<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:variable name="derivedVerbClassValues" as="element()+">
        <val>I</val>
        <val>Iq</val>
        <val>II</val>
        <val>IIq</val>
        <val>IIIō</val>
        <val>III</val>
        <val>VIe</val>
        <val>IV</val>
        <val>V</val>
        <val>VI</val>
        <val>VIw</val>
        <val>VII</val>
        <val>VIII</val>
        <val>IX</val>
        <val>X</val>
    </xsl:variable>
    <xsl:template match='tei:gram[@type="subc"][.=$derivedVerbClassValues]/@type'>
        <xsl:attribute name="type">derivedVerbClass</xsl:attribute>
    </xsl:template>
    <xsl:template match='tei:gram[@type="subc"][.="elative"]/@type'>
        <xsl:attribute name="type">degree</xsl:attribute>
    </xsl:template>
    <xsl:template match='tei:gram[@type="diaRootNew"]/@type'>
        <xsl:attribute name="type">diaRoot</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>