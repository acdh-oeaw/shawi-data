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
    
    <!-- Template to transform form[type='multiWordUnit'] to form[type='compound'] -->
    <xsl:template match="tei:form[@type='multiWordUnit']">
        <xsl:copy>
            <!-- Create the 'type' attribute with the new value -->
            <xsl:attribute name="type">compound</xsl:attribute>
            <!-- Copy all other attributes and child nodes -->
            <xsl:apply-templates select="@*[name() != 'type'] | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template to handle gramGrp elements and remove gram[type='pos'] with 'multiWordUnit' content -->
    <xsl:template match="tei:gramGrp">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()[not(self::tei:gram[@type='pos' and text()='multiWordUnit'])]"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

