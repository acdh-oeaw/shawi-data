<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all"><!--This is genereated by make_xsl.xsl-->
   <xsl:include href="postTokenization/1.xsl"/>
   <xsl:function name="xtoks:applyPostProcessingXSLTs">
      <xsl:param name="input" as="document-node()"/>
      <xsl:variable name="pp1">
         <xsl:apply-templates select="$input" mode="pp1"/>
      </xsl:variable>
      <xsl:sequence select="$pp1"/>
   </xsl:function>
</xsl:stylesheet>
