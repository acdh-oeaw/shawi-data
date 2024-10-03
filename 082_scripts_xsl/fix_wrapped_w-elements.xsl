<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:saxon="http://saxon.sf.net/"
    extension-element-prefixes="saxon"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output saxon:line-length="9000" indent="no"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="processing-instruction()">
        <xsl:sequence select="."/><xsl:text xml:space="preserve">&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>