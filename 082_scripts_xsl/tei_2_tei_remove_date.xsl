<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Identity template: copies everything by default -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template to remove the when="????-??-??" attribute from date elements in tei:teiHeader/tei:publicationStmt -->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@when='????-??-??']">
        <xsl:copy>
            <!-- Copy all attributes except the 'when' attribute -->
            <xsl:apply-templates select="@*[name() != 'when']"/>
            <!-- Copy child nodes of the date element -->
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
