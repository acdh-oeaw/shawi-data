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
    
   
    
    <xsl:template match="tei:form[@type='lemma'][parent::tei:entry/tei:gramGrp/tei:gram[.='multiWordUnit']]">
        <form type="compound">
            <xsl:apply-templates select="@* | node()"/>
        </form>
    </xsl:template>
    
   
    
</xsl:stylesheet>

