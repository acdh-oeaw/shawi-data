<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                xml:id="params">
   <xsl:param name="preserve-ws">false</xsl:param>
   <xsl:param name="pc-regex">\p{P}</xsl:param>
   <xsl:param name="ws-regex">[\s+]</xsl:param>
   <xsl:param name="debug">false</xsl:param>
   <xsl:param name="useLexicon">false</xsl:param>
   <xsl:param name="lexToks">
      <lexicon/>
   </xsl:param>
   <xsl:param name="token-namespace">tei</xsl:param>
   <xsl:param name="pathToTokenizerLib">xsl/toks.xsl</xsl:param>
   <xsl:param name="pathToVertXSL">xsl/xtoks2vert.xsl</xsl:param>
   <xsl:param name="pathToVertTxtXSL">xsl/vert2txt.xsl</xsl:param>
   <xsl:param name="pathToPLib">xsl/addP.xsl</xsl:param>
   <xsl:template match="tei:teiHeader" mode="is-copy-node">
      <xsl:sequence select="true()"/>
   </xsl:template>
   <xsl:template match="tei:timeline" mode="is-copy-node">
      <xsl:sequence select="true()"/>
   </xsl:template>
   <xsl:template match="tei:note" mode="is-copy-node">
      <xsl:sequence select="true()"/>
   </xsl:template>
</xsl:stylesheet>
