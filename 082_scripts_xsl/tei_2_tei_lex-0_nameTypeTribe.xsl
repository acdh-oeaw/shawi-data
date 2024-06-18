<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    
    <!-- Output method set to XML with indentation -->
    <xsl:output method="xml" indent="yes" />
    
    <!-- Identity template to copy everything by default -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template to handle usg[@type='socioCultural'] elements -->
    <xsl:template match="tei:usg[@type='socioCultural']">
    </xsl:template>
    
    <!-- Template to handle usg[@type='geographic'] elements -->
    <xsl:template match="tei:usg[@type='geographic']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- Copy all child nodes -->
            <xsl:apply-templates select="node()"/>
            <!-- Insert name[@type='tribe'] elements from following usg[@type='socioCultural'] -->
            <xsl:for-each select="following-sibling::tei:usg[@type='socioCultural'][1]/tei:name[@type='tribe']">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
