<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="3.0">
    <!-- Output method set to XML with indentation -->
    <xsl:output method="xml" indent="yes" />
    
    <!-- Ignoriere alles standardmäßig -->
    <xsl:template match="@* | node()" />
    
    <!-- doesnt work yet -->
    <xsl:template match="/">
        <!-- Verarbeite alle tei:entry-Elemente -->
        <xsl:apply-templates select="//tei:entry[.//tei:bibl]"/>
    </xsl:template>
    
    <!-- Verarbeite jedes <entry> -->
    <xsl:template match="tei:entry">
        <!-- Gib den Inhalt von <orth> aus (nur form[@type='lemma']) -->
        <xsl:apply-templates select="tei:form[@type='lemma']/tei:orth"/>
        
        <!-- Gib die <bibl>-Elemente dieses entry aus -->
        <xsl:apply-templates select=".//tei:bibl"/> 
        
        <!-- Leerzeile zur Trennung der Entries -->
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <!-- Gib nur den Textinhalt von <orth> aus -->
    <xsl:template match="tei:orth">
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <!-- Gib den Inhalt von <bibl> aus -->
    <xsl:template match="tei:bibl">
        <bibl>
            <xsl:value-of select="@corresp"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>&#10;</xsl:text>
        </bibl>
    </xsl:template>
    
    
</xsl:stylesheet>



