<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
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
    <xsl:template match="tei:bibl[not(parent::tei:listBibl)]"/>
    
    <!-- Template to process parents of bibl elements to add source attribute correctly -->
    <xsl:template match="*[not(self::tei:listBibl) and not(self::tei:cit[@type='example'])][tei:bibl]">
        <xsl:copy>
            <!-- Generate a concatenated string of all bibl IDs in this element prefixed with # -->
            <xsl:attribute name="source">
               <xsl:for-each select="tei:bibl">
                   <xsl:variable name="key" select="concat(@corresp, .)"/>                   
                   <xsl:variable name="sameBibls" select="ancestor::tei:cit[@type='example']//tei:bibl[concat(@corresp, .)=$key]"/>
               <xsl:value-of select="concat('#',generate-id($sameBibls[1]))"/>
                   <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
               </xsl:for-each>
            </xsl:attribute>
            <xsl:apply-templates select="@* except @source[.='#']|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Enhanced template for tei:entry to include listBibl at the end -->
    <xsl:template match="tei:cit[@type='example']" >
        <xsl:copy>
            <xsl:apply-templates select="@* except @source"/>
            <xsl:if test="tei:bibl">
                <!-- Generate a concatenated string of all bibl IDs in this element prefixed with # -->
                <xsl:attribute name="source">
                    <xsl:for-each select="tei:bibl">
                        <xsl:variable name="key" select="concat(@corresp, .)"/>                   
                        <xsl:variable name="sameBibls" select="ancestor::tei:cit[@type='example']//tei:bibl[concat(@corresp, .)=$key]"/>
                        <xsl:value-of select="concat('#',generate-id($sameBibls[1]))"/>
                        <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
                    </xsl:for-each>
                    <xsl:if test="@source[. != '#']">
                        <xsl:if test="tei:bibl">
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@source"/>
                    </xsl:if>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()[not(self::tei:bibl)][not(self::tei:fs)]"/>
            <xsl:if test=".//tei:bibl">
                <listBibl>
                    <xsl:for-each-group select=".//tei:bibl" group-by="concat(@corresp, '+', text())">
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
                    </xsl:for-each-group>
                </listBibl>
            </xsl:if>
            <xsl:apply-templates select="tei:fs | tei:fs/following-sibling::*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
