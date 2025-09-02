<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:_="urn:local"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="#all"
    extension-element-prefixes="saxon"
    version="3.0">
    <xsl:output method="xml" indent="yes" saxon:line-length="1000"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:function name="_:idRefFromMediaUrl" as="xs:string*">
        <xsl:param name="media" as="element(tei:media)"/>
        <xsl:variable name="url" select="$media/@url" as="attribute(url)"/>
        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="$media/@mimeType='audio/wav'">audio-master</xsl:when>
                <xsl:otherwise>audio-public</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="concat('#',substring-before(substring-after($url,'/'),'.'),'-',$type)"/>
    </xsl:function>
    
    <xsl:template match="tei:recording">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:for-each select="//tei:annotationBlock/descendant::tei:media">
                <xsl:copy>
                    <xsl:attribute name="xml:id" select="substring-after(_:idRefFromMediaUrl(.),'#')"/>
                    <xsl:attribute name="type">fragment</xsl:attribute>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:listPrefixDef">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <prefixDef ident="assets" matchPattern="^(.+)$" replacementPattern="https://shawi-assets.acdh.oeaw.ac.at/$1">
                <p>Private URIs using the <code>assets</code> prefix are pointers to the location of the SHAWI media assets.</p>
            </prefixDef>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:annotationBlock">
        <div corresp="{string-join(descendant::tei:media/_:idRefFromMediaUrl(.),' ')}">
            <xsl:apply-templates select="@* except (@start,@end)|node()"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:annotationBlock/tei:u[1]">
        <xsl:copy>
            <xsl:copy-of select="../@start"/>
            <xsl:if test="count(../tei:u) eq 1">
                <xsl:copy-of select="../@end"/>
            </xsl:if>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:annotationBlock[count(tei:u) gt 1]/tei:u[last()]">
        <xsl:copy>
            <xsl:copy-of select="../@end"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template match="@url[starts-with(.,'publicAssets')]">
        <xsl:attribute name="url" select="replace(.,'publicAssets','assets')"/>
    </xsl:template>
    
    <xsl:template match="tei:annotationBlock/descendant::tei:media"/>
</xsl:stylesheet>