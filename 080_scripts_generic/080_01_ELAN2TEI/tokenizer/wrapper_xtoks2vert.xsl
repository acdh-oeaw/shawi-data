<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all">
   <xsl:include href="params.xsl"/>
   <xsl:include href="../../xsl/xtoks2vert.xsl"/>
   <xsl:template match="tei:u" mode="extractTokens">
      <xsl:variable name="content" as="item()*">
         <xsl:apply-templates mode="#current"/>
      </xsl:variable>
      <xsl:if test="exists($content)">
         <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                           name="id"
                           select="parent::tei:annotationBlock/concat(ancestor::tei:TEI//tei:title[@level = 'a'],'_',@xml:id)"/>
            <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                           name="who"
                           select="parent::tei:annotationBlock/concat('#',@who)"/>
            <xsl:sequence select="$content"/>
         </xsl:copy>
      </xsl:if>
   </xsl:template>
   <xsl:template match="tei:seg[@type = 'token']" mode="extractTokens">
      <xsl:variable name="content" as="item()*">
         <xsl:apply-templates mode="#current"/>
      </xsl:variable>
      <xsl:if test="exists($content)">
         <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:sequence select="$content"/>
         </xsl:copy>
      </xsl:if>
   </xsl:template>
   <xsl:template match="tei:TEI/@xml:id" mode="doc-attributes">
      <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                     name="id"
                     select="normalize-space(.)"/>
   </xsl:template>
   <xsl:template match="//tei:sourceDesc/tei:recording/tei:media/@url"
                 mode="doc-attributes">
      <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                     name="audio"
                     select="normalize-space(.)"/>
   </xsl:template>
   <xsl:template match="//tei:textClass/tei:catRef/@target" mode="doc-attributes">
      <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                     name="topic"
                     select="normalize-space(.)"/>
   </xsl:template>
   <xsl:template match="//tei:settingDesc/tei:place" mode="doc-attributes">
      <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                     name="geo"
                     select="normalize-space(.)"/>
   </xsl:template>
   <xsl:template match="//tei:particDesc//tei:person" mode="doc-attributes">
      <xsl:attribute namespace="http://acdh.oeaw.ac.at/xtoks"
                     name="speakers"
                     select="normalize-space(.)"/>
   </xsl:template>
</xsl:stylesheet>
