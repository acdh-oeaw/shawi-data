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
    
    <!-- Template to handle form elements -->
    <xsl:template match="tei:form/tei:usg[@type='geographic']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- Apply templates to all child nodes except for usg[@type='socioCultural'] -->
            <xsl:apply-templates select="node()[not(self::tei:usg[@type='socioCultural'])]"/>
        </xsl:copy>
        <!-- Place all usg[@type='socioCultural'] directly under this form element -->
        <xsl:apply-templates select=".//tei:usg[@type='socioCultural']"/>
    </xsl:template>
    
    <!-- Template to handle socioCultural usg elements with | in their content -->
    <xsl:template match="tei:usg[@type='socioCultural'][contains(., '|')]">
        <xsl:variable name="parts" select="tokenize(., '\|')" />
        <xsl:for-each select="$parts">
            <usg type="socioCultural">
                <xsl:value-of select="." />
            </usg>
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>
