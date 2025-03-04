<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:strip-space elements="*"/>
    
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
        <xsl:text xml:space="preserve">" attrs="word wid decomp dict=lemmaRef pos=msd trans=n">
</xsl:text>
        <xsl:apply-templates select="t:text/t:body"/>
        <xsl:text xml:space="preserve">
&lt;/doc></xsl:text>
    </xsl:template>
    
    <xsl:template match="t:w|t:pc" xml:space="preserve"><xsl:if test=". = (',', '.', '!', '?', '[', '(')">&lt;g/>&#xa;</xsl:if><xsl:value-of select="normalize-unicode(text(), 'NFKC')"/>&#9;<xsl:value-of select="@xml:id"/>&#9;<xsl:value-of select="normalize-unicode(text(), 'NFKD')"/>&#9;<xsl:value-of select="@lemmaRef"/>&#9;<xsl:value-of select="@msd"/>&#9;<xsl:value-of select="@n"/><xsl:apply-templates select="@* except (@xml:id,@n,@lemmaRef,@msd,@join,@rend,@xml:lang)" mode="tsv"/><xsl:if test="@rend='withDash'">&#xa;&lt;g/>&#xa;-&#xa;&lt;g/></xsl:if>&#xa;</xsl:template>
    
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