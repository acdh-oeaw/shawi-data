<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!--  
        This stylesheet merges the metadata from the Corpus document and the 
        TEI-representation of the ELAN transcriptions. 
        
        TODOs mentioned inline.
        
        Author: Daniel Schopper
        Created: 2022-03-12
    -->
    
    <xsl:param name="pathToCorpusDoc"/>
    <xsl:variable name="input" select="."/>
    <xsl:variable name="corpusDoc" select="doc($pathToCorpusDoc)" as="document-node()"/>
    <xsl:variable name="IDcandidates" select="$corpusDoc//*:idno[@type='SHAWICorpusID']"/>
    <xsl:variable name="pathSegs" select="tokenize(base-uri($input),'[/_]')"/>
    <xsl:variable name="recordingID" select="$IDcandidates[some $x in $pathSegs satisfies lower-case($x) = lower-case(.)]"/>
    <xsl:variable name="teiHeaderFromCorpus" select="$recordingID/ancestor::tei:teiHeader" as="element(tei:teiHeader)?"/>
    
    <xsl:template match="/">
        <xsl:if test="normalize-space($recordingID) = ''">
            <xsl:message select="concat('$input=',base-uri($input))"/>
            <xsl:message select="concat('$pathToCorpusDoc=',$pathToCorpusDoc)"/>
            <xsl:message select="concat('$IDcandidates=',string-join($IDcandidates,', '))"/>
            <xsl:message select="concat('$recordingID=',$recordingID)"/>
            <xsl:message terminate="yes">$recordingID could not be determined from input filename <xsl:value-of select="tokenize(base-uri($input),'/')[last()]"/></xsl:message>
        </xsl:if>
        <xsl:if test="not($teiHeaderFromCorpus)">
            <xsl:message select="concat('$input=',base-uri($input))"/>
            <xsl:message select="concat('$pathToCorpusDoc=',$pathToCorpusDoc)"/>
            <xsl:message select="concat('$IDcandidates=',string-join($IDcandidates,', '))"/>
            <xsl:message select="concat('$recordingID=',$recordingID)"/>
            <xsl:message terminate="yes">teiHeader for recording <xsl:value-of select="$recordingID"/> not found in <xsl:value-of select="$pathToCorpusDoc"/></xsl:message>
        </xsl:if>
        <xsl:comment>THIS FILE WAS PROGRAMMATICALLY CREATED by mergeHeaderAndTranscription.xsl on/at<xsl:value-of select="current-dateTime()"/></xsl:comment>
        <xsl:apply-templates>
            <xsl:with-param name="teiHeaderFromCorpus" select="$teiHeaderFromCorpus" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- TODO: make a real merge, i.e. include relevant metadata from the ELAN export 
        and not just overwrite it with the corpus header -->
    <xsl:template match="tei:teiHeader">
        <xsl:param name="teiHeaderFromCorpus" tunnel="yes"/>
        <xsl:element name="{name($teiHeaderFromCorpus)}">
            <xsl:copy-of select="$teiHeaderFromCorpus/@*"/>
            <xsl:for-each select="$teiHeaderFromCorpus/*">
                <xsl:sequence select="."/>
                <xsl:if test="name() = 'profileDesc'">
                    <revisionDesc status="generated">
                        <change>
                            <xsl:attribute name="when">
                                <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
                            </xsl:attribute>
                        </change>
                    </revisionDesc>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="node() except text()| @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\[(…|\.\.\.)\]">
            <xsl:matching-substring>
                <gap rendition="rend:ellipsisInSquareBrackets"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>

                <xsl:analyze-string select="." regex="(\w+|\w+-)(…|\.\.\.)">
                    <xsl:matching-substring>
                        <w type="truncated" rendition="rend:ellipsisAfter"><xsl:value-of select="regex-group(1)"/></w>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>

                        <xsl:analyze-string select="." regex="\s(…|\.\.\.)">
                            <xsl:matching-substring>
                                <milestone unit="sentence" rendition="rend:ellipsis"/>
                            </xsl:matching-substring>
                            <xsl:non-matching-substring>
                                <xsl:value-of select="."/>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>

                    </xsl:non-matching-substring>
                </xsl:analyze-string>
                
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

    <!-- in span do not apply ellipsis handling -->
    <xsl:template match="tei:span//text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:annotationBlock">
        <annotationBlock xml:id="{concat($recordingID, '_', @xml:id)}">
            <xsl:apply-templates select="node() | @* except (@xml:id, @who)"/>
        </annotationBlock>
    </xsl:template>
    
    <xsl:template match="tei:u">
        <xsl:variable name="num">
            <xsl:number level="any" from="tei:annotationBlock" count="tei:u" format="1"/>
        </xsl:variable>
        <u xml:lang="ar-acm-x-shawi-vicav" xml:id="{concat($recordingID,'_',../@xml:id,'_u', $num)}" who="{concat('#', ../@who)}">
          <xsl:apply-templates select="tei:seg"/>
          <media mimeType="audio/mp3" url="publicAssets:{$recordingID}/{concat($recordingID,'_',../@xml:id)}.mp3"></media>
          <media mimeType="audio/wav" url="arche:{$recordingID}/{concat($recordingID,'_',../@xml:id)}.wav"></media>
        </u>
    </xsl:template>
    
    <xsl:template match="tei:seg">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    
    <xsl:template match="tei:span">
        <span xml:lang="en" target="{concat('#', $recordingID,'_',substring(@target, 2))}">
            <xsl:apply-templates select="@* except @target|node()"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>