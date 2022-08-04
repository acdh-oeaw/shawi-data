<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:param name="path_to_annotated_doc">file:/home/dschopper/data/shawi-data/010_manannot/Urfa-012_Lentils-Harran-2010.xml</xsl:param>
    <xsl:key name="w-by-id" match="tei:w" use="@xml:id"/>
        
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="doc-available($path_to_annotated_doc)">
                <xsl:variable name="annotated_doc" select="doc($path_to_annotated_doc)" as="document-node()"/>
                <xsl:apply-templates>
                    <xsl:with-param name="annotated_doc" select="$annotated_doc" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="xtoks:w">
        <xsl:param name="annotated_doc" tunnel="yes" as="document-node()"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="key('w-by-id', @xtoks:id, $annotated_doc)/@* except @xml:id"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>