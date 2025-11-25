<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0"
    exclude-result-prefixes="#all">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy" />
    
    <xsl:variable name="c010_manannot" select="collection(base-uri()||'/../../010_manannot?select=*.xml')"/>
    
    <xsl:template match="tei:TEI/tei:teiHeader">
        <xsl:variable name="SHAWICorpusID" select=".//tei:idno[@type='SHAWICorpusID']"/>
        <xsl:variable name="manannot_teiHeader" select="$c010_manannot//tei:idno[@type='SHAWICorpusID'][. = $SHAWICorpusID]/ancestor::tei:teiHeader"/>
        <xsl:choose>
            <xsl:when test="$manannot_teiHeader">
                <xsl:sequence select="$manannot_teiHeader"/>
            </xsl:when>
            <xsl:otherwise>
                <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
                    <xsl:apply-templates select="@*"/><xsl:text xml:space="preserve">
          </xsl:text>
                    <xsl:apply-templates select="*|comment()|processing-instruction()"/><xsl:text xml:space="preserve">
       </xsl:text></teiHeader>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>