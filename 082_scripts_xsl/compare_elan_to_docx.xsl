<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    xmlns:_="https://id.acdh.oeaw.ac.at"
    exclude-result-prefixes="#all"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="html"/>
    <xsl:param name="path-to-elan-docs">../122_elan?select=*.eaf&amp;metadata=yes</xsl:param>
    <xsl:variable name="elan-collection" select="collection($path-to-elan-docs)"/>
    <xsl:variable name="elan-docs" as="map(*)*">
        <xsl:for-each select="$elan-collection">
            <xsl:variable name="filename" select="tokenize(map:get(.,'path'),'/')[last()]"/>
            <xsl:sequence select="map:put(., 'filename', $filename)"/>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:function name="_:getELANdocForTextName" as="map(*)*">
        <xsl:param name="text"/>
        <xsl:sequence select="$elan-docs[starts-with(lower-case(map:get(.,'filename')), lower-case($text))]"/>
    </xsl:function>
    
    <xsl:function name="_:getHeadingForELANfilename" as="element(tei:head)*">
        <xsl:param name="filename"/>
        <xsl:param name="doc"/>
        <xsl:variable name="headings" select="$doc//tei:head" as="element()*"/>
        <xsl:variable name="head" as="element(tei:head)*">
            <xsl:for-each select="$headings">
                <xsl:variable name="text" select="substring-before(.,':')"/>
                <xsl:if test="normalize-space($text) != '' and starts-with(lower-case($filename),lower-case($text))">
                    <xsl:sequence select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:message select="count($head)"></xsl:message>        
        <xsl:sequence select="$head"/>

    </xsl:function>

    <xsl:template match="/">
        <xsl:variable name="doc" select="."/>
        <html>
            <head>
                <title>Word to ELAN comparison</title>
            </head>
            <body>
                <p>docx document: <xsl:value-of select="replace(tokenize(base-uri(.),'/')[last()],'xml','docx')"/></p>
                <p>Date: <xsl:value-of select="current-dateTime()"/></p>
                <h2>List of ELAN documents</h2>
                <ul>
                    <xsl:for-each select="sort($elan-docs, '', function($m){$m?filename})">
                        
                        <xsl:variable name="heading" select="_:getHeadingForELANfilename(.?filename, $doc)" as="element(tei:head)*"/>
                        <xsl:choose>
                            <xsl:when test="exists($heading)">
                                <li><a href="#{generate-id($heading)}"><xsl:value-of select="map:get(.,'filename')"/></a></li>
                            </xsl:when>
                            <xsl:otherwise>
                                <li><xsl:value-of select="map:get(.,'filename')"/></li>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ul>
                <xsl:apply-templates select=".//tei:table"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- each text is a table in the MS Word document, the heading provides the name of the text
    which matches the file name of the ELAN document-->
    <xsl:template match="tei:table">
        <xsl:variable name="head" select="preceding-sibling::tei:head[1]"/>
        <xsl:variable name="text" select="translate(substring-before($head,':'),'ª','a')" as="xs:string"/>
        <!--<xsl:for-each select="$elan-docs">
            <xsl:variable name="map" select="." as="map(*)"/>
            <xsl:for-each select="map:keys($map)">
                <xsl:variable name="value" select="$map(.)"/>
                <xsl:if test="$value instance of xs:string">
                    <xsl:message select="concat(.,'=',$map(.))"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>-->
        <xsl:variable name="elan-doc-map" select="_:getELANdocForTextName($text)" as="map(*)*"/>
        <xsl:if test="$text != ''">
            <h2 ID="{generate-id($head)}"><xsl:value-of select="$text"/></h2>
            <xsl:choose>
                <xsl:when test="count($elan-doc-map) eq 1">
                    <table>
                        <thead>
                            <tr>
                                <th>Filename</th>
                                <th>Utterance #</th>
                                <th>Word Document</th>
                                <th>ELAN document</th>
                                <th>Equal</th>
                            </tr>
                        </thead>
                        <tbody style="border: 1px solid black; border-collapse: true;">
                            <xsl:apply-templates select="tei:row">
                                <xsl:with-param name="text" select="$text" tunnel="yes"/>
                                <xsl:with-param name="elan-doc-map" select="$elan-doc-map" tunnel="yes"/>
                            </xsl:apply-templates>
                        </tbody>
                    </table>
                </xsl:when>
                <xsl:when test="count($elan-doc-map) gt 1">
                    <p>found several potential ELAN documents: <xsl:value-of select="string-join(for $i in $elan-doc-map return $i('filename'),',')"/></p>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>No file found starting with <xsl:value-of select="$text"/></xsl:message>
                    <p><i>No ELAN document found starting with <xsl:value-of select="$text"/></i></p>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:row[normalize-space(tei:cell[2])='']"/>
    
    <xsl:template match="tei:row[normalize-space(tei:cell[2])!='']">
        <xsl:variable name="utterance-no" select="count(preceding-sibling::tei:row)"/>
        <xsl:apply-templates select="tei:cell[2]">
            <xsl:with-param name="utterance-no" select="$utterance-no" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:cell">
        <xsl:param name="elan-doc-map" as="map(*)" tunnel="yes"/>
        <xsl:param name="utterance-no" as="xs:integer" tunnel="yes"/>
        
        <xsl:variable name="elan-doc" select="$elan-doc-map?fetch()" as="document-node()"/>
        <xsl:variable name="utterance-in-elan" select="normalize-space(subsequence($elan-doc//ALIGNABLE_ANNOTATION[normalize-space(.)!=''],$utterance-no+1,1))"/>        
        <xsl:variable name="elan-tokens" select="tokenize($utterance-in-elan)"/>
        <xsl:variable name="docx-tokens" select="tokenize(.)"/>
        <tr style="border: 1px solid black; border-collapse: collapse;">
            <td style="border: 1px solid black; border-collapse: collapse;"><xsl:value-of select="$elan-doc-map('filename')"/></td>
            <td style="border: 1px solid black; border-collapse: collapse;"><xsl:value-of select="$utterance-no"/></td>
            <td style="border: 1px solid black; border-collapse: collapse;">
                <xsl:for-each select="$docx-tokens">
                    <xsl:choose>
                        <xsl:when test=". = subsequence($elan-tokens,position(),1)">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <mark><xsl:value-of select="."/></mark>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="position() lt count($docx-tokens)">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td>
            <td style="border: 1px solid black; border-collapse: collapse;">
                <xsl:for-each select="$elan-tokens">
                    <xsl:choose>
                        <xsl:when test=". = subsequence($docx-tokens,position(),1)">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <mark><xsl:value-of select="."/></mark>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="position() lt count($elan-tokens)">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td>
            <td style="border: 1px solid black; border-collapse: collapse;"><xsl:value-of select=". = normalize-space($utterance-in-elan)"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>