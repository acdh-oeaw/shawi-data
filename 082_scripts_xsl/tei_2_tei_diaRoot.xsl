<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
    
   
    
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:gram/@type[.='diaRootNew']">
        <xsl:attribute name="type">diaRoot</xsl:attribute>
    </xsl:template>
    
    
</xsl:stylesheet>