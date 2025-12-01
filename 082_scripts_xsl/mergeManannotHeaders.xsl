<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0"
    exclude-result-prefixes="#all">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy" />
    
    <xsl:param name="githubRepo">https://github.com/acdh-oeaw/shawi-data</xsl:param>
    <xsl:param name="gitRef">main</xsl:param>
    
    <xsl:variable name="base-dir" select="string-join(subsequence(tokenize(base-uri(), '/'), 1, count(tokenize(base-uri(), '/')) - 1), '/')"/>
    <xsl:variable name="c010_manannot" select="collection($base-dir||'/../010_manannot?select=*.xml')"/>
    
    <xsl:template match="tei:TEI/tei:teiHeader">
        <xsl:variable name="SHAWICorpusID" select=".//tei:idno[@type='SHAWICorpusID']"/>
        <xsl:variable name="manannot_teiHeader" select="$c010_manannot//tei:idno[@type='SHAWICorpusID'][. = $SHAWICorpusID]/ancestor::tei:teiHeader"/>
        <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="if ($manannot_teiHeader) then $manannot_teiHeader/@* else @*"/><xsl:text xml:space="preserve">
          </xsl:text>
            <xsl:apply-templates select="(if ($manannot_teiHeader) then $manannot_teiHeader else .)/(*|comment()|processing-instruction())"/><xsl:text xml:space="preserve">
       </xsl:text></teiHeader>
    </xsl:template>
    
    <!-- is thist the right place and tag? -->
    <xsl:template match="tei:publicationStmt">
        <publicationStmt xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*"/><xsl:apply-templates select="*|comment()|processing-instruction()"/>
            <xsl:text xml:space="preserve">
            </xsl:text><idno type="teiSource"><xsl:value-of select="replace(base-uri(), '^.*103_tei_w/', $githubRepo||'/blob/'||$gitRef||'/103_tei_w/')"/></idno><xsl:text xml:space="preserve">          
       </xsl:text></publicationStmt>
    </xsl:template>
    
    <xsl:template match="tei:idno[@type='githubSource']"/> <!-- remove if it is in the source -->
    
</xsl:stylesheet>