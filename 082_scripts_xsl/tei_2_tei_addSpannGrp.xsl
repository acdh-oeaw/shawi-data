<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    
    <!-- Output method set to XML without indentations -->
    <xsl:output method="xml" indent="no"/>
    
    <!-- Identity template to copy everything by default, including processing instructions -->
    <xsl:template match="@* | node() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Process annotationBlock elements -->
    <xsl:template match="tei:annotationBlock">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            
            <!-- Check if there is already a spanGrp of type Translation -->
            <xsl:if test="not(tei:spanGrp[@type='Translation'])">
                
                <!-- Find the first u element inside annotationBlock and get its @id -->
                <xsl:variable name="prevU" select="tei:u"/>
                <xsl:variable name="uId" select="$prevU/@xml:id"/>
                
                <!-- Generate a new xml:id dynamically -->
                <xsl:variable name="idNum" select="count(preceding::tei:annotationBlock/tei:u) + 1"/>
                <xsl:variable name="newID" select="concat('a', $idNum)"/>
                
                <!-- Insert spanGrp with a span referencing the u element -->
                <spanGrp type="Translation">
                    <span xml:lang="en" target="#{$uId}" xml:id="{$newID}">.</span>
                </spanGrp>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
