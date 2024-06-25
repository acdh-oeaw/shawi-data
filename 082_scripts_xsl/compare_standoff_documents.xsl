<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="pathToConfig"/>
    <xsl:variable name="config" select="doc($pathToConfig)"/>
    <xsl:variable name="currentDocument" select="doc($config//currentDocument/path)"/>
    <xsl:variable name="oldDocuments" select="doc($config//oldDocuments/path)"/>
    <xsl:key name="fs-by-id" match="tei:fs" use="@xml:id"/>
    <xsl:key name="fs-by-trans" match="tei:fs" use="tei:f[@name='trans']/tei:string"/>
    <xsl:template match="/">
        <xsl:variable name="missing-in-new-version" as="element()*">
            <xsl:for-each select="$oldDocuments//tei:fs">
                <xsl:variable name="id" select="@xml:id"/>
                <xsl:variable name="fs-in-current-version" select="key('fs-by-trans',tei:f[@name = 'trans']/tei:string,$currentDocument)"/>
                <xsl:if test="not(exists(key('fs-by-id',$id,$currentDocument)))">
                    <missing-in-new-version id="{$id}" id-of-wordform-in-current-standoff-document="{$fs-in-current-version/@xml:id}" path="{base-uri()}">
                        <old-version>
                            <xsl:sequence select="."/>
                        </old-version>
                        <current-version-with-matching-transcription>
                            <xsl:sequence select="$fs-in-current-version"/>
                        </current-version-with-matching-transcription>
                    </missing-in-new-version>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <standoff-comparison>
            <config>
                <xsl:sequence select="$config"/>
            </config>
            <results missing-in-new-version="{count($missing-in-new-version)}">
                <xsl:sequence select="$missing-in-new-version"/>
            </results>
        </standoff-comparison>
    </xsl:template>
</xsl:stylesheet>