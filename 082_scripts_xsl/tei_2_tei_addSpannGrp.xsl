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
    
    <!-- Process annotationBlock elements -->
    <xsl:template match="tei:annotationBlock">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            
            <!-- Check if there is already a spanGrp of type Translation -->
            <xsl:if test="not(tei:spanGrp[@type='Translation'])">
                
                <!-- Find the preceding u element and get its @id -->
                <xsl:variable name="prevU" select="tei:u"/>
                <xsl:variable name="uId" select="$prevU/@xml:id"/>
                
                <!-- Generate a new xml:id dynamically -->
                <xsl:variable name="idNum" select="count(preceding::tei:u) + 1"/>
                <xsl:variable name="newID" select="concat('a', $idNum)"/>
                
                <!-- Insert spanGrp with a span referencing the u element -->
                <tei:spanGrp type="Translation">
                    <tei:span xml:lang="en" target="#{ $uId }" xml:id="{$newID}"/>
                </tei:spanGrp>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
