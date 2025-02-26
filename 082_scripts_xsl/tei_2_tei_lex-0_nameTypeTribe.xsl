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
    <xsl:template match="tei:usg[@type='socioCultural']"/>
    
   
    <xsl:template match="tei:usg[@type='geographic']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- Copy all child nodes -->
            <xsl:apply-templates select="node()"/>
            <!-- Insert name[@type='tribe'] elements from the first following usg[@type='socioCultural'] if it exists -->
            <xsl:if test="following-sibling::tei:usg[1][@type='socioCultural']">
                <xsl:sequence select="following-sibling::tei:usg[1]/tei:name[@type='tribe']"/>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
