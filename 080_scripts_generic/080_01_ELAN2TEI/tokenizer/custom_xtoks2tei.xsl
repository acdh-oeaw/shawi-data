<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all">
    <xsl:include href="xsl/xtoks2tei.xsl"/>
           
    <xsl:template match="tei:seg[@type='connected']">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>