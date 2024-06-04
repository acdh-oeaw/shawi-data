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
    
    <!-- Template to replace all <name type='tribe'> elements with <usg type='socioCultural'> -->
    <xsl:template match="tei:name[@type='tribe']">
        <usg type="socioCultural">
            <xsl:apply-templates select="@*[not(name()='type')]|node()"/>
        </usg>
    </xsl:template>
    
  
    
    
</xsl:stylesheet>
