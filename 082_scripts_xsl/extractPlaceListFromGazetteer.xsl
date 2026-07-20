<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"></xsl:output>
    <xsl:template match="/">
            <table>
                <row role="label">
                    <cell>Turkish Name</cell>
                    <cell>Arabic Namen</cell>
                </row>
                <xsl:for-each select="//tei:place[tei:note='SHAWI']">
                    <xsl:sort select="*:placeName[@type='prefLabel']"></xsl:sort>
                    <row role="data">
                        <cell><ref target="geo:{@xml:id}"><xsl:value-of select="*:placeName[@type='prefLabel']"/></ref></cell>
                        <cell><xsl:value-of select="string-join(*:placeName[@xml:lang='ar-Latn'],', ')"/></cell>
                    </row>
                </xsl:for-each>
            </table>
    </xsl:template>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>