<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:_="urn:shawi"
    exclude-result-prefixes="xs tei _"
    version="2.0">
    <xsl:output method="xml" indent="no" omit-xml-declaration="true"/>
    <xsl:param name="path-to-standoff-document"/>
    <xsl:variable name="standoff" select="doc($path-to-standoff-document)"/>
    <xsl:key name="fs-by-id" match="//tei:fs" use="@xml:id"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:function name="_:annotationByReference" as="element(tei:fs)*">
        <xsl:param name="idRef"/>
        <xsl:sequence select="key('fs-by-id',substring-after($idRef,'#'), $standoff)"/>
    </xsl:function>
    
    <xsl:template match="tei:w[count(tokenize(@ana,'\s+')) gt 1]">
        <xsl:variable name="id" select="@xml:id"/>
        <xsl:variable name="annotations" select="for $idRef in tokenize(@ana,'\s+') return _:annotationByReference($idRef)" as="element(tei:fs)*"/>
        <xsl:variable name="newReferences" as="item()*">
            <xsl:for-each select="tokenize(@ana,'\s+')">
                <xsl:variable name="idRef" select="."/>
                <xsl:choose>
                    <xsl:when test="not(exists(_:annotationByReference($idRef))) and exists($annotations)">
                        <xsl:comment>removed broken reference to annotation '<xsl:value-of select="$idRef"/>' (<xsl:value-of select="current-dateTime()"/>)</xsl:comment>
                        <xsl:message>WARNING: Removing annotation on w with id '<xsl:value-of select="$id"/>' with broken reference to '<xsl:value-of select="$idRef"/>'</xsl:message>
                    </xsl:when>
                    <xsl:when test="not(exists(_:annotationByReference($idRef))) and not(exists($annotations)) and position() eq 1">
                        <xsl:comment>ALL REFERENCES BROKEN</xsl:comment>
                        <xsl:message>ERROR: w with id '<xsl:value-of select="$id"/>' has broken reference to '<xsl:value-of select="$idRef"/>'. No other valid references found!</xsl:message>
                        <xsl:sequence select="$idRef"/>
                    </xsl:when>
                    <xsl:when test="count($annotations) gt 1 and position() eq 1">
                        <xsl:comment>AMBIGIOUS REFERENCES to be de-duplicated.</xsl:comment>
                        <xsl:sequence select="$idRef"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="$idRef"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:sequence select="for $r in $newReferences return if ($r instance of comment()) then ($r,'&#10;                  ') else ()"/>
        <xsl:copy>
            <xsl:sequence select="@* except @ana"/>
            <xsl:attribute name="ana" select="for $r in $newReferences return if ($r instance of xs:string) then $r else ()"/>
            <xsl:sequence select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="processing-instruction()|comment()[parent::document-node()]|*[parent::document-node()]" priority="1">
        <xsl:text>&#10;</xsl:text>
        <xsl:next-match/>
    </xsl:template>
    
    
    
</xsl:stylesheet>