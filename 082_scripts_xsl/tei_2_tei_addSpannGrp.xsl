<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    
    <!-- Output method set to XML with indentation -->
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Identity template to copy everything by default -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Generate a unique ID for each span element -->
    <xsl:function name="tei:generate-id">
        <xsl:param name="node"/>
        <xsl:value-of select="concat('id_', generate-id($node))"/>
    </xsl:function>
    
    <!-- Process annotationBlock elements -->
    <xsl:template match="tei:annotationBlock">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            
            <!-- Check if there is already a spanGrp of type Translation -->
            <xsl:if test="not(tei:spanGrp[@type='Translation'])">
                
                <!-- Find the preceding u element and get its @id -->
                <xsl:variable name="prevU" select="tei:u"/>
                <xsl:variable name="uId" select="$prevU/@xml:id"/>
                
                <!-- Insert spanGrp with a span referencing the u element -->
                <spanGrp type="Translation">
                    <span xml:lang="en" target="#{ $uId }">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="tei:generate-id(.)"/>
                        </xsl:attribute>
                    </span>
                </spanGrp>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
