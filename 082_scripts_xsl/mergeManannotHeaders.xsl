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
    
    <!-- Run this on a copy of shawiCorpus.xml that is located on the root dir shawi-data -->
    <!-- Place the result of this transformation in 103_tei_w -->
    <xsl:variable name="base-dir" select="string-join(subsequence(tokenize(base-uri(), '/'), 1, count(tokenize(base-uri(), '/')) - 1), '/')"/>
    <xsl:variable name="c103_tei_w" select="collection($base-dir||'/103_tei_w?select=*.xml&amp;on-error=ignore')"/>
    <xsl:variable name="c010_manannot" select="collection($base-dir||'/010_manannot?select=*.xml&amp;recurse=yes&amp;on-error=ignore')"/>

    <xsl:template match="tei:TEI/tei:teiHeader">
        <xsl:variable name="SHAWICorpusID" select=".//tei:idno[@type='SHAWICorpusID']"/>
        <xsl:variable name="tei_w_teiHeader" select="$c103_tei_w//tei:idno[not(ends-with(base-uri(), 'shawiCorpus.xml'))][@type='SHAWICorpusID'][. = $SHAWICorpusID]/ancestor::tei:teiHeader"/>
        <xsl:variable name="manannot_teiHeader" select="$c010_manannot//tei:idno[@type='SHAWICorpusID'][. = $SHAWICorpusID]/ancestor::tei:teiHeader"/>
        <xsl:variable name="teiHeaderParam" select="
            if ($manannot_teiHeader) then $manannot_teiHeader else 
            if ($tei_w_teiHeader) then $tei_w_teiHeader
            else ."/>
        <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="if ($manannot_teiHeader) then $manannot_teiHeader/@* else @*"/><xsl:text xml:space="preserve">
          </xsl:text>
            <xsl:apply-templates select="(if ($manannot_teiHeader) then $manannot_teiHeader else .)/(*|comment()|processing-instruction())">
                <xsl:with-param name="teiHeader" select="$teiHeaderParam" tunnel="true"/> 
            </xsl:apply-templates><xsl:text xml:space="preserve">
       </xsl:text></teiHeader>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus/tei:teiHeader">
        <teiHeader xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*"/><xsl:text xml:space="preserve">
          </xsl:text>
            <xsl:apply-templates select="./(*|comment()|processing-instruction())">
                <xsl:with-param name="teiHeader" select="." tunnel="true"/> 
            </xsl:apply-templates><xsl:text xml:space="preserve">
       </xsl:text></teiHeader>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt">
        <!-- This should accept only one tei:teiHeader but there is still a text that was split and has more instances with the same SHAWICorpusID -->
        <xsl:param name="teiHeader" tunnel="yes" as="element(tei:teiHeader)+"/>
        <publicationStmt xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*"/><xsl:apply-templates select="*|comment()|processing-instruction()"/>
            <xsl:text xml:space="preserve">
            </xsl:text><idno type="teiSource"><xsl:value-of select="string-join($teiHeader!replace(./base-uri(), '^.*(103_tei_w|010_manannot)/', $githubRepo||'/blob/'||$gitRef||'/$1/'), ' ')"/></idno><xsl:text xml:space="preserve">          
       </xsl:text></publicationStmt>
    </xsl:template>
    
    <xsl:template match="tei:idno[@type='teiSource']"/> <!-- remove if it is in the source -->
    
</xsl:stylesheet>