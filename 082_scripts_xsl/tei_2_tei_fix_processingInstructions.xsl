<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <!-- Identity Transform -->
    <xsl:template match="@*|node()" priority="1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Spezielle Behandlung für Processing Instructions -->
    <xsl:template match="processing-instruction()|comment()" priority="2">
        <xsl:copy>
            <xsl:value-of select="."/>
        </xsl:copy>
        <!-- Fügt nur einen Zeilenumbruch nach der Processing Instruction ein -->
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
