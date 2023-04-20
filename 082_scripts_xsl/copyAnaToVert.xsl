<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:param name="path_to_annotated_doc">../../010_manannot/Urfa-012_Lentils-Harran-2010.xml</xsl:param>
    <!-- replace is for oxygenXML as it is easier to just get the input filename there which contains _05_vert -->
    <xsl:variable name="annotated_doc_path" select="replace($path_to_annotated_doc, '_05_vert', '')"/>
    <xsl:variable name="annotated_dir" select="string-join(tokenize($annotated_doc_path, '/')[position() != last()],  '/')"/>
    <xsl:variable name="standoff_doc_path" select="$annotated_dir||'/shawi_standoff.xml'"/>
    <xsl:variable name="annotated_doc" select="doc($annotated_doc_path)" as="document-node()"/>
    <xsl:variable name="standoff_doc" select="doc($standoff_doc_path)" as="document-node()"/>
    
    <xsl:key name="w-by-id" match="$annotated_doc//tei:w" use="@xml:id"/>
    <xsl:key name="ana-by-id" match="$standoff_doc//tei:standOff/tei:fs" use="@xml:id"/>
        
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="doc-available($annotated_doc_path)">
                <xsl:apply-templates/>               
            </xsl:when>
            <xsl:otherwise>
                <xsl:message select="'Annotations in '||$annotated_doc_path||' not available for '||base-uri(.)"/>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="xtoks:w">
        <xsl:variable name="annotated_w" select="key('w-by-id', @xtoks:id, $annotated_doc)"/>
        <xsl:variable name="annotations" select="key('ana-by-id', substring($annotated_w/@ana, 2), $standoff_doc)"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="$annotated_w/@* except $annotated_w/@xml:id"/>
            <xsl:apply-templates select="$annotations//tei:f"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:f">
        <xsl:attribute name="xtoks:{@name}">
            <xsl:value-of select="tei:string"/>
        </xsl:attribute>
    </xsl:template>
      
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>