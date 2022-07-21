<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all">
   <xsl:output method="text"/>
   <xsl:include href="params.xsl"/>
   <xsl:include href="../../xsl/vert2txt.xsl"/>
   <xsl:template match="tei:u">
      <xsl:sequence select="tei:structure(.)"/>
   </xsl:template>
   <xsl:template match="tei:seg[@type = 'token']">
      <xsl:sequence select="tei:structure(.)"/>
   </xsl:template>
</xsl:stylesheet>
