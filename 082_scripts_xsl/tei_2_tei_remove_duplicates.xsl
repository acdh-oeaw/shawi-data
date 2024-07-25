<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:form[@type='lemma'][count(tei:form[@type='variant']) ne count(distinct-values(tei:form[@type='variant']/tei:orth))]">
        <xsl:copy><xsl:sequence select="@*"/>
        <xsl:for-each select="*">
            <xsl:variable name="this" select="."/>
            <xsl:variable name="followingOrth" select="following-sibling::tei:orth"/>
            <xsl:variable name="copy" select="$followingOrth/following-sibling::*[deep-equal(., $this)]"/>
            <xsl:choose>
                <xsl:when test="exists($copy)"/>
                <xsl:otherwise> <xsl:sequence select="$this"/></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each></xsl:copy>
    </xsl:template>
    
        
</xsl:stylesheet>