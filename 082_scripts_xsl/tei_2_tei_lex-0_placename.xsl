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
    
    <!-- Template to replace all <placeName> elements with <name type="place"> -->
    <xsl:template match="tei:placeName">
        <name type="place">
            <xsl:apply-templates select="@*|node()"/>
        </name>
    </xsl:template>
    
    <!-- Template to handle form elements and extract name[@type='tribe'] -->
    <xsl:template match="tei:form/tei:usg[@type='geographic']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- Apply templates to all child nodes except for name[@type='tribe'] -->
            <xsl:apply-templates select="node()[not(self::tei:name[@type='tribe'])]"/>
        </xsl:copy>
        <!-- Place all name[@type='tribe'] directly under new usg[@type='socioCultural'] elements -->
        <xsl:for-each select=".//tei:name[@type='tribe']">
            <usg type="socioCultural">
                <xsl:apply-templates select="."/>
            </usg>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Template to handle name elements with | in their content -->
    <xsl:template match="tei:name[@type='tribe'][contains(., '|')]">
        <xsl:variable name="parts" select="tokenize(., '\|')" />
        <xsl:for-each select="$parts">
            <name type="tribe">
                <xsl:value-of select="." />
            </name>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
