<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei">
    <xsl:output indent="no" omit-xml-declaration="yes">
    </xsl:output>
    <xsl:strip-space elements="*"/> 
    
    <xsl:template match="/">
        <doc id="{.//titleStmt/title[@level='a']/string()}">
            <xsl:apply-templates select=".//body"/>
            <xsl:text>&#xa;</xsl:text>
        </doc>
    </xsl:template>
    
    <xsl:template match="timeline"/>
    
    <xsl:template match="div[@type='Situation']">
        <xsl:text>&#xa;</xsl:text>
        <div>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:text>&#xa;</xsl:text>
        </div>
    </xsl:template>
    
    <xsl:template match="head"/>
    
    <xsl:template match="annotationBlock">
        <xsl:text>&#xa;</xsl:text>
        <annotationBlock>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:text>&#xa;</xsl:text>
        </annotationBlock>    
    </xsl:template>
    
    <xsl:template match="u">
        <xsl:text>&#xa;</xsl:text>
        <u>
            <xsl:attribute name="id">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:text>&#xa;</xsl:text>
        </u>
    </xsl:template>
    
    <xsl:template match="tei:seg">
        <xsl:text>&#xa;</xsl:text>
        <seg_token>
            <xsl:apply-templates/>
            <xsl:text>&#xa;</xsl:text>
        </seg_token>
    </xsl:template>
    
    <xsl:template match="w">
        <xsl:text>&#xa;</xsl:text>
        <w>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </w>
        
    </xsl:template>
    
    <xsl:template match="pc">
        <xsl:text>&#xa;</xsl:text>
        <pc>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </pc>
        
    </xsl:template>
    
    
</xsl:stylesheet>
