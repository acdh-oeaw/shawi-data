<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="dict" select="doc('../vicav_dicts/dc_shawi_eng.xml')"/>
    <xsl:variable name="dictById" select="map:merge($dict//t:entry!map {data(./@xml:id): .})"/>
    
    <xsl:template match="t:TEI">
        <xsl:text>&lt;doc id="</xsl:text>
        <xsl:value-of select="t:teiHeader//t:idno[ends-with(@type, 'CorpusID')]"/>
        <xsl:text>" title="</xsl:text>
        <xsl:value-of select="t:teiHeader//t:title[@level='a']"/>
        <xsl:text>" speakers="</xsl:text>
        <xsl:value-of select="string-join(t:teiHeader//t:particDesc//t:name/text(), ' ')"/>
        <xsl:text>" geo="</xsl:text>
        <xsl:value-of select="t:teiHeader//t:settingDesc//t:placeName"/>
        <xsl:text>" topics="</xsl:text>
        <xsl:value-of select="string-join(t:teiHeader//t:textClass//t:catRef/@target, ' ')"/>
        <xsl:text>" status="</xsl:text>
        <xsl:value-of select="t:teiHeader//t:revisionDesc/@status"/>
        <xsl:text xml:space="preserve">" attrs="word wid decomp dict=lemmaRef msd trans=n pos root subc diaroot">
</xsl:text>
        <xsl:apply-templates select="t:text/t:body"/>
        <xsl:text xml:space="preserve">
&lt;/doc>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="t:w|t:pc">
        <xsl:variable name="dictId" select="replace(@lemmaRef, 'dict:', '')" as="xs:string"/>
        <xsl:variable name="dictEntry" select="$dictById($dictId)" as="element(t:entry)?"/>
        <xsl:if test=". = (',', '.', '!', '?', '[', '(')" xml:space="preserve">&lt;g/>&#xa;</xsl:if>
        <xsl:if test="true()" xml:space="preserve"><xsl:value-of select="normalize-unicode(text(), 'NFKC')"/>&#9;<xsl:value-of select="@xml:id"/>&#9;<xsl:value-of select="normalize-unicode(text(), 'NFKD')"/>&#9;<xsl:value-of select="@lemmaRef"/>&#9;<xsl:value-of select="@msd"/>&#9;<xsl:value-of select="@n"/>&#9;<xsl:value-of select="$dictEntry//t:gram[@type='pos']"/>&#9;<xsl:value-of select="$dictEntry//t:gram[@type='synRoot']"/>&#9;<xsl:value-of select="$dictEntry//t:gram[@type='subc']"/>&#9;<xsl:value-of select="$dictEntry//t:gram[@type='diaRoot']"/><xsl:apply-templates select="@* except (@xml:id,@n,@lemmaRef,@msd,@join,@rend,@xml:lang)" mode="tsv"/></xsl:if>
        <xsl:if test="@rend='withDash'" xml:space="preserve">&#xa;&lt;g/>&#xa;-&#xa;&lt;g/></xsl:if>
        <xsl:if test="true()" xml:space="preserve">&#xa;</xsl:if>
        <xsl:if test="t:gap" xml:space="preserve">&lt;gap reason="<xsl:value-of select="t:gap/@reason"/>"/>&#xa;</xsl:if>
    </xsl:template>
    
    <xsl:template match="@*" mode="tsv">
        <xsl:text>&#9;</xsl:text><xsl:value-of select="local-name()"/>=<xsl:value-of select="."/>       
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:text>&lt;</xsl:text><xsl:value-of select="local-name()"/><xsl:apply-templates select="@*"/><xsl:text xml:space="preserve">>
</xsl:text>
        <xsl:for-each-group select="*" group-adjacent="(@rend, preceding-sibling::*[1]/@rend, 'none')[1]">
            <xsl:if test="current-grouping-key() = 'withDash'">
                <xsl:text xml:space="preserve">&lt;connecteds>&#xa;</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="current-group()"/>            
            <xsl:if test="current-grouping-key() = 'withDash'">
                <xsl:text xml:space="preserve">&lt;/connecteds>&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&lt;/</xsl:text><xsl:value-of select="local-name()"/>
        <xsl:text xml:space="preserve">>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="@*"><xsl:text xml:space="preserve"> </xsl:text><xsl:value-of select="local-name()"/>="<xsl:value-of select="."/>"</xsl:template>

    <xsl:template match="t:note|t:head|t:spanGrp|t:media"/>
    
    <xsl:template match="t:body|t:div|t:annotationBlock"><xsl:apply-templates/></xsl:template>
    
</xsl:stylesheet>