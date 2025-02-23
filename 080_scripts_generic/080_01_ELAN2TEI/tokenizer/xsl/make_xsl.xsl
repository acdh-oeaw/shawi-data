<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:p="xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd p" version="2.0">
    <xsl:import href="xpath20.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>
                <xd:b>Created on:</xd:b> Dec 4, 2013</xd:p>
            <xd:p>
                <xd:b>Author:</xd:b> Daniel Schopper</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:include href="toks-lib.xsl"/>
    
    <xsl:param name="debug"/>
    <xsl:param name="pathToTokenizerLib" as="xs:string" select="if(exists(root()//param[@key='pathToTokenizerLib'])) then xs:string(root()//param[@key='pathToTokenizerLib']/data(@value)) else '../../xsl/toks.xsl'"/>
    <xsl:param name="pathToVertXSL" as="xs:string" select="if(exists(root()//param[@key='pathToVertXSL'])) then xs:string(root()//param[@key='pathToVertXSL']/data(@value)) else '../../xsl/xtoks2vert.xsl'"/>
    <xsl:param name="pathToVertTxtXSL" as="xs:string" select="if(exists(root()//param[@key='pathToVertTxtXSL'])) then xs:string(root()//param[@key='pathToVertTxtXSL']/data(@value)) else '../../xsl/vert2txt.xsl'"/>
    <xsl:param name="punctCharPattern" as="xs:string" select="if(exists(root()//param[@key='pc-regex'])) then xs:string(root()//param[@key='pc-regex']/data(@value)) else '\p{P}+'"/>
    <xsl:param name="ws-regex" as="xs:string" select="if(exists(root()//param[@key='ws-regex'])) then xs:string(root()//param[@key='ws-regex']/data(@value)) else '\s+'"/>
    <xsl:param name="preserve-ws" as="xs:boolean" select="if(exists(root()//param[@key='preserve-ws'])) then xs:boolean(root()//param[@key='preserve-ws']/data(@value)) else true()"/>
    <xsl:param name="pathToPLib" as="xs:string" select="if(exists(root()//param[@key='pathToPLib'])) then xs:string(root()//param[@key='pathToPLib']/data(@value)) else '../../xsl/addP.xsl'"/>
    <xsl:param name="output-base-path"/>
    <xsl:param name="postTokXSLDir" select="concat($output-path,'/postTokenization')"/>
    
    
    <xsl:function name="xtoks:expand-path">
        <xsl:param name="path" as="xs:string?"/>
        <xsl:if test="$path != ''">
            <xsl:analyze-string select="$path" regex="\$\{{(profile-home|xsl-home)\}}">
                <xsl:matching-substring>
                    <xsl:choose>
                        <xsl:when test="regex-group(1) = 'profile-home'">
                            <xsl:value-of select="concat('../profiles/',$profile-name)"/>
                        </xsl:when>
                        <xsl:when test="regex-group(1) = 'xsl-home'">
                            <xsl:value-of select="concat('../xsl/',$profile-name)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:if>
    </xsl:function>
    <xsl:variable name="profile-name" as="xs:string" select="/profile/@id"/>
    <xsl:variable name="output-path">
        <xsl:choose>
            <xsl:when test="$output-base-path != ''">
                <xsl:value-of select="$output-base-path"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="pathParts" as="xs:string+" select="tokenize(base-uri(), '/')"/>
                <xsl:value-of select="string-join(subsequence($pathParts, 1, count($pathParts) - 1), '/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="/" mode="mkParams">
        <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
            <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
            <xsl:namespace name="xd">http://www.oxygenxml.com/ns/doc/xsl</xsl:namespace>
            <xsl:attribute name="version">2.0</xsl:attribute>
            <xsl:attribute name="xml:id">params</xsl:attribute>
            <xsl:apply-templates select="profile/namespace" mode="#current"/>
            <xsl:apply-templates select="profile/parameters/param" mode="#current"/>
            <xsl:apply-templates select="profile/ignore/expression[text()]" mode="#current"/>
            <xsl:apply-templates select="profile/in-word-tags/expression[text()]" mode="#current"/>
            <xsl:apply-templates select="profile/floating-blocks/expression[text()]" mode="#current"/>
            <xsl:apply-templates select="profile/copy/expression[text()]" mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="namespace[text()]" mode="mkParams">
        <xsl:namespace name="{@prefix}" select="."/>
    </xsl:template>
    
    <xsl:template match="param[@key != 'lexicon']" mode="mkParams">
        <xsl:element name="xsl:param">
            <xsl:attribute name="name">
                <xsl:value-of select="@key"/>
            </xsl:attribute>
            <if test="@as">
                <xsl:attribute name="as">
                    <xsl:value-of select="@as"/>
                </xsl:attribute>
            </if>
            <value-of select="xtoks:expand-path(@value)"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="param[@key = 'lexicon']" mode="mkParams">
        <variable name="lexicon" select="//param[@key = 'lexicon']"/>
        <xsl:element name="xsl:param">
            <xsl:attribute name="name">lexToks</xsl:attribute>
            <xsl:element name="lexicon" namespace="">
                <xsl:for-each select="tokenize($lexicon,'\n+')">
                    <xsl:sort select="string-length(.)" order="descending"/>
                    <entry xmlns="http://acdh.oeaw.ac.at/xtoks">
                        <xsl:attribute name="xml:id" select="concat('entry_',position())"/>
                        <xsl:for-each select="normalize-space(.)">
                            <xsl:call-template name="tokenize-text">
                                <xsl:with-param name="pc-regex" select="$punctCharPattern"/>
                                <xsl:with-param name="ws-regex" select="$ws-regex"/>
                                <xsl:with-param name="preserve-ws" select="$preserve-ws"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </entry>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

   
    <xsl:template match="*/expression[text()]" mode="mkParams">
        <xsl:variable name="parent" select="parent::*/local-name()"/>
        <xsl:variable name="mode">
            <xsl:choose>
                <xsl:when test="$parent = 'copy'">is-copy-node</xsl:when>
                <xsl:when test="$parent = 'floating-blocks'">is-floating-node</xsl:when>
                <xsl:when test="$parent = 'in-word-tags'">is-inline-node</xsl:when>
                <xsl:when test="$parent = 'ignore'">is-ignore-node</xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="expression" select="."/>
        <xsl:variable name="prefixes" select="root()//namespace/@prefix/xs:string(.)"/>
        <xsl:variable name="expression-parsed" select="p:parse-XPath(xs:string($expression))"/>
        <xsl:variable name="syntactically-valid" select="not($expression-parsed instance of element(ERROR))"/>
        <xsl:variable name="all-prefixes-defined" select="every $prefix in $expression-parsed//QName[matches(.,'^\w+:')]/substring-before(.,':') satisfies $prefix = $prefixes"/>
        <xsl:choose>
            <xsl:when test="$mode = ''">
                <xsl:message>Unknown parent element '<xsl:value-of select="$parent"/>' -- ignoring expression '<xsl:value-of select="$expression"/>'</xsl:message>
            </xsl:when>
            <xsl:when test="not($syntactically-valid)">
                <xsl:message>Invalid XPath expression '<xsl:value-of select="$expression"/>' in element '<xsl:value-of select="$parent"/>' -- ignoring</xsl:message>
            </xsl:when>
            <xsl:when test="not($all-prefixes-defined)">
                <xsl:message>Undefined namespace prefix in XPath expression '<xsl:value-of select="$expression"/>' in element '<xsl:value-of select="$parent"/>' -- ignoring</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="xsl:template">
                    <xsl:attribute name="match" select="."/>
                    <xsl:attribute name="mode"><xsl:value-of select="$mode"/></xsl:attribute>
                    <xsl:element name="xsl:sequence">
                        <xsl:attribute name="select">true()</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="structure/expression[text()]" mode="xtoks2vert">
        <xsl:element name="xsl:template">
            <xsl:attribute name="match" select="."/>
            <xsl:attribute name="mode">extractTokens</xsl:attribute>
            <xsl:element name="xsl:variable">
                <xsl:attribute name="name">content</xsl:attribute>
                <xsl:attribute name="as">item()*</xsl:attribute>
                <xsl:element name="xsl:apply-templates">
                    <xsl:attribute name="mode">#current</xsl:attribute>
                </xsl:element>
            </xsl:element>
            <xsl:element name="xsl:if">
                <xsl:attribute name="test">exists($content)</xsl:attribute>
                <xsl:element name="xsl:copy">
                    <xsl:element name="xsl:copy-of">
                        <xsl:attribute name="select">@*</xsl:attribute>
                    </xsl:element>
                    <xsl:for-each select="root()//struct-attribute[@on = current()]">
                        <xsl:element name="xsl:attribute">
                            <xsl:attribute name="namespace">http://acdh.oeaw.ac.at/xtoks</xsl:attribute>
                            <xsl:attribute name="name">
                                <xsl:value-of select="@name"/>
                            </xsl:attribute>
                            <xsl:attribute name="select">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                    
                    <xsl:element name="xsl:sequence">
                        <xsl:attribute name="select">$content</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="structure/expression[text()]" mode="xtoks2txt">        
        <xsl:element name="xsl:template">
            <xsl:attribute name="match" select="."/>
            <xsl:element name="xsl:sequence">
                <xsl:attribute name="select">tei:structure(.)</xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-attributes/doc-attribute[expression/text()]" mode="xtoks2vert">
        <!-- doc-attribute may only contain one expression element, but we want to make sure … -->
        <xsl:variable name="expression" select="expression[1]"/>
        <xsl:variable name="prefixes" select="root()//namespace/@prefix/xs:string(.)"/>
        <xsl:variable name="expression-parsed" select="p:parse-XPath(xs:string($expression))"/>
        <xsl:variable name="syntactically-valid" select="not($expression-parsed/ERROR)"/>
        <xsl:variable name="all-prefixes-defined" select="every $prefix in $expression-parsed//QName[matches(.,'^\w+:')]/substring-before(.,':') satisfies $prefix = $prefixes"/>
        <xsl:choose>
            <xsl:when test="$syntactically-valid and $all-prefixes-defined">
                <xsl:element name="xsl:template">
                    <xsl:attribute name="match" select="$expression"/>
                    <xsl:attribute name="mode">doc-attributes</xsl:attribute>
                    <xsl:element name="xsl:attribute">
                        <xsl:attribute name="namespace">http://acdh.oeaw.ac.at/xtoks</xsl:attribute>
                        <xsl:attribute name="name">
                            <xsl:value-of select="@name"/>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="starts-with($expression, '//')">
                                <xsl:attribute name="select">string-join(<xsl:value-of select="$expression"></xsl:value-of>/normalize-space(), ' ')</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="select">normalize-space(.)</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="not($syntactically-valid)">
                <xsl:message>Invalid XPath expression '<xsl:value-of select="$expression"/>' in doc-attribute '<xsl:value-of select="@name"/>' -- ignoring</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Undefined namespace prefixes in XPath expression '<xsl:value-of select="$expression"/>' in doc-attribute '<xsl:value-of select="@name"/>' -- ignoring</xsl:message>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>
    
    
    <xsl:template match="/">
        <xsl:if test="$debug != ''">
            <xsl:message select="concat('make_xsl.xsl: $debug=',$debug)"/>
            <xsl:message select="concat('make_xsl.xsl: $output-base-path=',$output-base-path)"/>
            <xsl:message select="concat('make_xsl.xsl: $postTokXSLDir=',$postTokXSLDir)"/>    
        </xsl:if>
        
        <!-- preapare parameter stylesheet -->
        <xsl:result-document href="{$output-path}/params.xsl" indent="yes">
            <xsl:apply-templates select="." mode="mkParams"/>
        </xsl:result-document>
        
        <!-- if present, create the post-processing stylesheet -->
        <xsl:if test="exists(//postProcessing[xsl:stylesheet])">
            <xsl:for-each select="//postProcessing/xsl:stylesheet">
                <xsl:variable name="pos" select="position()"/>
                <!-- IMPORTANT Do not change this file name as the order is important here. -->
                <xsl:result-document href="{$postTokXSLDir}/{$pos}.xsl" indent="yes">
                    <xsl:copy-of select="."/>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:if>
        
        <!-- Create the tokenizer wrapper stylesheet -->
        <xsl:result-document href="{$output-path}/wrapper_toks.xsl" indent="yes">
            <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
                <xsl:namespace name="xd">http://www.oxygenxml.com/ns/doc/xsl</xsl:namespace>
                <xsl:for-each select="//namespace">
                    <namespace name="{@prefix}" select="."/>
                </xsl:for-each>
                <attribute name="version">2.0</attribute>
                <attribute name="exclude-result-prefixes">#all</attribute>
                
                <element name="xsl:include">
                    <attribute name="href">params.xsl</attribute>
                </element>
                <element name="xsl:include">
                    <attribute name="href" select="$pathToTokenizerLib"/>
                </element>
            </xsl:element>
        </xsl:result-document>
        
        
        
        <!-- Create the partial-token linker stylehsheet -->
        <xsl:result-document href="{$output-path}/wrapper_addP.xsl" indent="yes">
            <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
                <xsl:namespace name="xd">http://www.oxygenxml.com/ns/doc/xsl</xsl:namespace>
                <xsl:for-each select="//namespace">
                    <namespace name="{@prefix}" select="."/>
                </xsl:for-each>
                <xsl:for-each select="//namespace">
                    <namespace name="{@prefix}" select="."/>
                </xsl:for-each>
                <attribute name="version">2.0</attribute>
                <attribute name="exclude-result-prefixes">#all</attribute>
                <text xml:space="preserve">

</text>
                <element name="xsl:include">
                    <attribute name="href">params.xsl</attribute>
                </element>
                <element name="xsl:include">
                    <attribute name="href" select="$pathToPLib"/>
                </element>
                <text xml:space="preserve">

</text>
            </xsl:element>
        </xsl:result-document>
        
        <xsl:result-document href="{$output-path}/wrapper_xtoks2vert.xsl" indent="yes">
            <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
                <xsl:namespace name="xd">http://www.oxygenxml.com/ns/doc/xsl</xsl:namespace>
                <xsl:namespace name="xtoks">http://acdh.oeaw.ac.at/xtoks</xsl:namespace>
                <xsl:for-each select="//namespace">
                    <namespace name="{@prefix}" select="."/>
                </xsl:for-each>
                <attribute name="version">2.0</attribute>
                <attribute name="exclude-result-prefixes">#all</attribute>
                
                <element name="xsl:include">
                    <attribute name="href">params.xsl</attribute>
                </element>
                <element name="xsl:include">
                    <attribute name="href" select="$pathToVertXSL"/>
                </element>
                
                <apply-templates select="//expression[parent::structure][text()]" mode="xtoks2vert"/>
                
                <apply-templates select="//doc-attribute[parent::doc-attributes][expression/text()]" mode="xtoks2vert"/>
                    
                
            </xsl:element>
        </xsl:result-document>
        <xsl:result-document href="{$output-path}/wrapper_vert2txt.xsl" indent="yes">
            <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
                <xsl:namespace name="xd">http://www.oxygenxml.com/ns/doc/xsl</xsl:namespace>
                <xsl:namespace name="xtoks">http://acdh.oeaw.ac.at/xtoks</xsl:namespace>
                <xsl:for-each select="//namespace">
                    <namespace name="{@prefix}" select="."/>
                </xsl:for-each>
                <attribute name="version">2.0</attribute>
                <attribute name="exclude-result-prefixes">#all</attribute>
                <xsl:element name="xsl:output">
                    <xsl:attribute name="method">text</xsl:attribute>
                </xsl:element>
                <text xml:space="preserve">

</text>
                <element name="xsl:include">
                    <attribute name="href">params.xsl</attribute>
                </element>
                <element name="xsl:include">
                    <attribute name="href" select="$pathToVertTxtXSL"/>
                </element>
                <text xml:space="preserve">

</text>
                <apply-templates select="//expression[parent::structure][text()]" mode="xtoks2txt"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>