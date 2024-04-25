<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="tei">

   <!-- Output method set to XML with indentation -->
   <xsl:output method="xml" indent="yes" />

   <!-- Identity template to copy everything by default -->
   <xsl:template match="node() | @*">
      <xsl:copy>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>

   <!-- Template to remove original bibl elements from their original location -->
   <xsl:template match="tei:bibl"/>

   <!-- Enhance the template to process parents of bibl elements to add source attribute correctly -->
   <xsl:template match="*[tei:bibl]">
      <xsl:copy>
         <xsl:attribute name="source">#<xsl:value-of select="generate-id(tei:bibl[1])"/></xsl:attribute>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

   <!-- Enhanced template for tei:entry to include listBibl at the end -->
   <xsl:template match="tei:entry">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates select="node()[not(self::tei:bibl)]"/>
         <listBibl>
            <xsl:for-each select=".//tei:bibl">
               <bibl>
                  <xsl:attribute name="xml:id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
                  <xsl:if test="@corresp">
                     <title>
                        <xsl:attribute name="ref"><xsl:value-of select="@corresp"/></xsl:attribute>
                     </title>
                  </xsl:if>
                  <biblScope unit="page">
                     <xsl:apply-templates select="@*[local-name() != 'corresp']"/>
                     <xsl:apply-templates select="node()"/>
                  </biblScope>
               </bibl>
            </xsl:for-each>
         </listBibl>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
