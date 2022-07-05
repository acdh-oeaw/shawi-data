<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all">
   <xsl:variable name="basename"
                 select="replace(tokenize(base-uri(),'/')[last()],'\.xml$','')"/>
   <xsl:param name="path-to-profile"/>
   <xsl:variable name="profile" select="doc($path-to-profile)" as="document-node()"/>
   <xsl:include href="xsl/rmNl.xsl"/>
   <xsl:include href="xsl/toks.xsl"/>
   <xsl:include href="xsl/addP.xsl"/>
   <xsl:include href="xsl/vert2txt.xsl"/>
   <xsl:include href="xsl/xtoks2tei.xsl"/>
   <xsl:include href="xsl/rmWs.xsl"/>
   <xsl:include href="xsl/functions.xsl"/>
   <xsl:include href="params.xsl"/>
   <xsl:include href="wrapper_postTokenization.xsl"/>
   <xsl:include href="wrapper_xtoks2vert.xsl"/>
   <!--This is just a template. In order to create one or several other output formast, 
                         call the respective template in ../../xsl/functions.xsl-->
   <xsl:template match="/">
      <xsl:result-document href="{$basename}_toks.xml" method="xml" indent="yes">
         <xsl:call-template name="xtoks:tokenize">
            <xsl:with-param name="input" select="."/>
         </xsl:call-template>
      </xsl:result-document>
   </xsl:template>
</xsl:stylesheet>
