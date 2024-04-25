<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="tei">
   <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="no"/>
   
   <xsl:template match="@* | node()">
      <xsl:copy><xsl:apply-templates select="@* | node()"/></xsl:copy>
   </xsl:template>
   
   <xsl:template match="tei:entry/tei:sense/tei:cit/tei:usg">
      <tei:gloss><xsl:value-of select="."/></tei:gloss>
   </xsl:template>
   
   
   
      
</xsl:stylesheet> 
