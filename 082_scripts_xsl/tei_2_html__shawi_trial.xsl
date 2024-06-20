<xsl:stylesheet xml:space="preserve" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" exclude-result-prefixes="xsl tei">
   <xsl:output method="html" indent="no" encoding="UTF-8"/>
   <xsl:strip-space elements="tei:body tei:TEI tei:row tei:cell tei:teiHeader tei:text tei:u tei:hi tei:ref tei:p tei:fileDesc tei:titleStmt tei:publicationStmt tei:editionStmt tei:revisionDesc tei:sourceDesc tei:div"/>

   <xsl:variable name="title">
      <xsl:value-of select="//tei:titleStmt/tei:title"/>
   </xsl:variable>

</xsl:stylesheet>
