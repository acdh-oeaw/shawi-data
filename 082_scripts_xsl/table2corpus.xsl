<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:_="urn:shawi"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!--  
        This stylesheet transforms the TEI representation of SHAWI_Recordings.xlsx produed 
        by the TEIC's xlsxtotei.xsl (https://github.com/TEIC/Stylesheets/blob/dev/xlsx/xlsxtotei.xsl) 
        into the project's Corpus Header Document and included TEI Headers for the ELAN transcription.
        
        For the full conversion workflow cf. https://gitlab.com/acdh-oeaw/shawibarab/shawi-data/-/blob/main/080_scripts_generic/080_01_ELAN2TEI/ELAN2TEI.ipynb
        
        INPUT: 080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml
        OUTPUT: 102_derived_tei/shawiCorpus.xml
        
        TODOs mentioned inline.
        
        Author: Daniel Schopper
        Created: 2022-03-10
    -->

    <xsl:param name="pathToRecordings"/>
    
    
    <xsl:variable name="prefixDefs">
        <prefixDef ident="corpus" matchPattern="^(.+)$" replacementPattern="shawiCorpus.xml#$1">
            <p>Private URIs using the <code>teiCorpusHeader</code> prefix are pointers to any element in the <ref target="shawiCorpus.xml">SHAWI teiCorpus document</ref>.</p>
        </prefixDef>
        <prefixDef ident="share" matchPattern="^(.+)$" replacementPattern="\\share17.univie.ac.at\orientalistik\SHAWI\Recordings\*\*\$1.wav">
            <p>Private URIs using the <code>share</code> prefix are pointers to audio file residing on the SHAWI network share.</p>
        </prefixDef>
        <prefixDef ident="geo" matchPattern="^(.+)$" replacementPattern="https://github.com/acdh-oeaw/vicav-content/blob/master/vicav_biblio/vicav_geodata.xml#$1">
            <p>Private URIs using the <code>geo</code> prefix are pointers to the <att>xml:id</att> attribute on a <gi>place</gi> element in <ref target="https://github.com/acdh-oeaw/vicav-content/blob/master/vicav_biblio/vicav_geodata.xml">VICAV Geodata list</ref>.</p>
        </prefixDef>
        <prefixDef ident="zotid" matchPattern="^(.+)$" replacementPattern="https://github.com/acdh-oeaw/vicav-content/blob/master/vicav_biblio/vicav_biblio_tei_zotero.xml#$1">
            <p>Private URIs using the <code>zotid</code> prefix are pointers to the <att>xml:id</att> attribute on a <gi>biblStruct</gi> element in the TEI export of the <ref target="https://www.zotero.org/groups/2165756/vicav/library">VICAV Zotero Group library</ref>.</p>
        </prefixDef>
    </xsl:variable>
    
    <xsl:variable name="teiCorpusPrefix">corpus</xsl:variable>
    <xsl:variable name="sharePrefix">share</xsl:variable>
    <xsl:variable name="vicavGeoListPrefix">geo</xsl:variable>
    <xsl:variable name="vicavZoteroGroupPrefix">zotid</xsl:variable>
       
    <xsl:variable name="cn" as="map(xs:string, map(xs:string, xs:integer))">
        <xsl:map>
            <xsl:for-each select="//tei:table/tei:head">
             <xsl:map-entry key="xs:string(.)">                
                 <xsl:map>
                     <xsl:for-each select="following-sibling::tei:row[@n='1'][1]/tei:cell[normalize-space(.) ne '']">
                         <xsl:map-entry key="xs:string(.)" select="xs:integer(position())"/>
                     </xsl:for-each>
                 </xsl:map> 
             </xsl:map-entry>
          </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    
    <xsl:variable name="t_Speakers" select="//tei:table[tei:head = 'Speakers']" as="element(tei:table)"/>
    <xsl:variable name="allSpeakers" select="$t_Speakers//tei:row[position() gt 1]" as="element(tei:row)*"/>
    <xsl:variable name="t_Speakers_in_Recordings" select="//tei:table[tei:head = 'Speakers_in_Recordings']" as="element(tei:table)"/>
    
    <xsl:variable name="t_Subjects" select="//tei:table[tei:head = 'Subjects']" as="element(tei:table)"/>
    <xsl:variable name="allSubjects" select="$t_Subjects//tei:row[position() gt 1]" as="element(tei:row)*"/>
    <xsl:variable name="t_Subjects_in_Recordings" select="//tei:table[tei:head = 'Subjects_in_Recordings']" as="element(tei:table)"/>
    
    <xsl:variable name="t_Team" select="//tei:table[tei:head = 'Team']" as="element(tei:table)"/>
    <xsl:variable name="allTeam" select="$t_Team//tei:row[position() gt 1]" as="element(tei:row)*"/>
    
    <xsl:variable name="t_Places" select="//tei:table[tei:head = 'Places']" as="element(tei:table)"/>
    
    <xsl:template match="/">
        <xsl:comment>THIS FILE WAS PROGRAMMATICALLY CREATED by table2corpus.xsl on/at <xsl:value-of select="current-dateTime()"/></xsl:comment>
        <xsl:result-document method="json" href="table_cell_num_mapping.json">
            <xsl:sequence select="$cn"/>
        </xsl:result-document>
        <xsl:apply-templates select="//tei:table[tei:head = 'Recordings']"/>
    </xsl:template>
    
    <xsl:function name="_:ID" as="xs:string">
        <xsl:param name="value" as="element(tei:cell)"/>
        <xsl:value-of select="replace($value,'[^A-Za-z]','')"/>
    </xsl:function>
    
    <xsl:function name="_:sortKey" as="xs:string">
        <xsl:param name="value" as="element(tei:cell)"/>
        <xsl:value-of select="replace(lower-case($value),'^(a|the)\s','')"/>
    </xsl:function>
    
    
    
    <xsl:function name="_:personReferenceByName" as="element(tei:person)">
        <xsl:param name="persName" as="xs:string"/>
        <xsl:variable name="tei:row" select="($allTeam[tei:cell[$cn('Team')('Forename')]||' '||tei:cell[$cn('Team')('Surname')] = $persName], $allSpeakers[tei:cell[$cn('Speakers')('Speaker')] = $persName])[1]"/>
        <xsl:apply-templates select="$tei:row" mode="teiInstanceDoc"/>
    </xsl:function>
    
    
    <xsl:template name="publicationStmt">
        <xsl:param name="textID"/>
        <publicationStmt>
            <publisher ref="https://ror.org/03anc3s24">Austrian Academy of Sciences</publisher>
            <publisher ref="https://ror.org/03prydq77">University of Vienna</publisher>
            <distributor ref="https://ror.org/028bsh698">Austrian Center for Digital Humanities and Cultural Heritage</distributor>
            <date when="????-??-??">TODO Set publication date here</date>
            <address>
                <addrLine>Sonnenfelsgasse 19</addrLine> 
                <addrLine>1010 Vienna</addrLine> 
                <addrLine>Austria</addrLine>
            </address>
            <availability status="free">
                <licence target="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</licence>
            </availability>
            <xsl:if test="$textID != ''">
                <idno type="SHAWICorpusID"><xsl:value-of select="$textID"/></idno>
            </xsl:if>
        </publicationStmt>
    </xsl:template>
    
    <xsl:template name="titleStmt">
        <xsl:param name="textID"/>
        <titleStmt>
            <xsl:if test="$textID != ''">
                <title level="a"><xsl:value-of select="$textID"/></title>
            </xsl:if>
            <title level="s">SHAWI Corpus</title>
            <xsl:choose>
                <xsl:when test="$textID != ''">
                    <xsl:apply-templates select="$allTeam" mode="respStmtInstanceDoc"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="$allTeam" mode="respStmtCorpusDoc"/>
                </xsl:otherwise>
            </xsl:choose>
            <funder>Funded by the <orgName ref="https://ror.org/013tf3c58">FWF Austrian Science Fund</orgName> under the number <idno type="projectNumber">P 33574</idno></funder>
        </titleStmt>
    </xsl:template>
    
    <!-- The /Recordings/ table is converted to our TEI Corpus document -->
    <xsl:template match="tei:table[tei:head = 'Recordings']">
        <teiCorpus>
            <teiHeader>
                <fileDesc>
                    <xsl:call-template name="titleStmt"/>
                    <xsl:call-template name="publicationStmt"/>
                    <sourceDesc>
                        <p>Derived from <ptr target="https://oeawacat.sharepoint.com/:x:/r/sites/ACDH-CH_p_ShawiTypeArabicDialects_Shawi/_layouts/15/Doc.aspx?sourcedoc=%7BF01FF43B-2409-4E31-A5BF-653E0559B160%7D&amp;file=SHAWI%20Recordings.xlsx&amp;action=default&amp;mobileredirect=true&amp;cid=cb8309b3-e569-4b43-b184-6149e267b7dc"/> via xlsxtotei and table2corpus.xsl</p>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <classDecl>
                        <taxonomy>
                            <xsl:for-each select="$allSubjects[tei:cell[$cn('Subjects')('Label')] != '']">
                                <xsl:sort select="_:sortKey(tei:cell[$cn('Subjects')('Label')])"/>
                                <xsl:variable name="subjectID" select="_:ID(tei:cell[1])"/>
                                <category xml:id="{$subjectID}" n="{tei:cell[$cn('Subjects')('Label')]}">
                                    <catDesc><xsl:value-of select="(tei:cell[$cn('Subjects')('Definition')][. != ''],'TODO ADD DESCRIPTION in Subjects table!')[1]"/></catDesc>
                                </category>
                            </xsl:for-each>
                        </taxonomy>
                    </classDecl>
                    <listPrefixDef>
                        <xsl:sequence select="$prefixDefs"/>
                    </listPrefixDef>
                </encodingDesc>
                <profileDesc>
                    <particDesc>
                        <listPerson>
                            <head>All Speakers in the SHAWI Corpus</head>
                            <xsl:apply-templates select="$allSpeakers" mode="teiCorpusDoc"/>
                        </listPerson>
                    </particDesc>
                </profileDesc>
            </teiHeader>
            <standOff>
                <listPerson>
                    <head>Project Team</head>
                    <xsl:apply-templates select="$allTeam" mode="teiCorpusDoc"/>
                </listPerson>
            </standOff>
            <xsl:apply-templates select="tei:row[position() gt 1][tei:cell[1] != '']"/>
        </teiCorpus>
    </xsl:template>
    
    <xsl:template match="tei:table[tei:head = 'Recordings']/tei:row[normalize-space(tei:cell[$cn('Recordings')('Rec. person')]) ne '']" priority="0">
        <xsl:variable name="textID" select="tei:cell[$cn('Recordings')('Text')]"/>
        <!-- find all rows with the matching text ID and take "the other" cell of the row, which is the speaker ID -->
        <xsl:variable name="speakerIDs" select="$t_Speakers_in_Recordings//tei:row[tei:cell = $textID]/tei:cell[. != $textID]"/>
        <xsl:variable name="speakers_in_recording" select="$allSpeakers[tei:cell[$cn('Recordings')('Text')] = $speakerIDs]" as="element(tei:row)*"/>
        
        <!--  -->
        <xsl:variable name="subjectIDs" select="$t_Subjects_in_Recordings//tei:row[tei:cell = $textID]/tei:cell[. != $textID]"/>
        <xsl:variable name="subjects_in_recording" select="$allSubjects[tei:cell[$cn('Subjects')('Label')] = $subjectIDs]" as="element(tei:row)*"/>
        
        <!-- place -->
        <xsl:variable name="placeName" select="tei:cell[$cn('Recordings')('Place')]"/>
        <xsl:variable name="placeID" select="$t_Places//tei:row[tei:cell[$cn('Places')('PlaceName')] = $placeName]/tei:cell[$cn('Places')('ID')]"/>
        
        <!-- path to Audio files -->
        <xsl:variable name="relPath" select="tei:cell[$cn('Recordings')('Trascribed Audio-file')]"/>
        <xsl:variable name="fullPath" select="$pathToRecordings"/>
        <TEI>
            <teiHeader>
                <fileDesc>
                    <xsl:call-template name="titleStmt">
                        <xsl:with-param name="textID" select="$textID"/>
                    </xsl:call-template>
                    <xsl:call-template name="publicationStmt">
                        <xsl:with-param name="textID" select="$textID"/>
                    </xsl:call-template>
                    <sourceDesc>
                        <!-- TODO reference source audio file to match with ELAN export. -->
                        <recordingStmt>
                            <!-- TODO parse duration and date -->
                            <recording dur-iso="{tei:cell[$cn('Recordings')('Length')]}" type="audio">
                                <date when="{_:excelSerialToISO( tei:cell[$cn('Recordings')('Date')])}"/>
                                <respStmt>
                                    <resp>recording</resp>
                                    <persName ref="{$teiCorpusPrefix}:{_:personReferenceByName(tei:cell[$cn('Recordings')('Rec. person')])}"><xsl:value-of select="normalize-space(tei:cell[$cn('Recordings')('Rec. person')])"/></persName>
                                </respStmt>
                                <!-- TODO The audio files on the share need to be re-organised to match the replacementPattern in the header -->
                                <media url="{$sharePrefix}:{tei:cell[$cn('Recordings')('Transcribed Audio-file')]}" mimeType="audio/wav" type="master"/>
                            </recording>
                        </recordingStmt>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <listPrefixDef>
                        <xsl:sequence select="$prefixDefs"/>
                    </listPrefixDef>
                </encodingDesc>
                <profileDesc>
                    <particDesc>
                        <listPerson>
                            <head>Speakers in <xsl:value-of select="$textID"/></head>
                            <xsl:if test="count($speakers_in_recording) eq 0">
                                <xsl:comment>TODO Add Speakers to Speakers_in_Recording Table</xsl:comment>
                            </xsl:if>
                            <xsl:for-each select="$speakers_in_recording">
                                <xsl:apply-templates select="." mode="teiInstanceDoc"/>
                            </xsl:for-each>
                        </listPerson>
                    </particDesc>
                    <settingDesc>
                        <!-- TODO find ID  -->
                        <!-- TODO fetch additional metadata from place list -->
                        <place sameAs="{$vicavGeoListPrefix}:{$placeID}"><placeName><xsl:value-of select="$placeName"/></placeName></place>
                    </settingDesc>
                    <textClass>
                        <xsl:for-each select="$subjects_in_recording">
                            <xsl:sort select="_:sortKey(tei:cell[1])"/>
                            <xsl:apply-templates select="." mode="teiInstanceDoc"/>
                        </xsl:for-each>
                    </textClass>
                </profileDesc>
            </teiHeader>
            <text>
                <body>
                    <p><xsl:comment>The text of this recording will be added after transcription has finished.</xsl:comment></p>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:function name="_:excelSerialToISO" as="xs:date">
        <xsl:param name="serial" required="yes" as="xs:int"/>
        <xsl:sequence select="xs:date('1899-12-30') + xs:dayTimeDuration('P'||$serial||'D')"/>
    </xsl:function>
    
    <xsl:template match="tei:table[tei:head = 'Recordings']/tei:row" priority="-2"/><!-- don't process rows that have no Rec. Person filled in -->    
    
    <xsl:template match="tei:table[tei:head = 'Subjects']/tei:row[tei:cell[1] != '']">
        <xsl:variable name="subjectID"/>
        <keyword><term><xsl:value-of select="tei:cell[1]"/></term></keyword>
    </xsl:template>
    
    
    
    <xsl:template match="tei:table[tei:head = 'Speakers']/tei:row[tei:cell[1] != '']" mode="teiCorpusDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of speakers in the teiCorpus  
            * "teiInstanceDoc": this generates the list of speakers in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <person xml:id="{tei:cell[1]}">
            <name type="pseudonym"><xsl:value-of select="tei:cell[1]"/></name>
            <sex><xsl:value-of select="tei:cell[2]"/></sex>
            <birth><xsl:value-of select="tei:cell[3]"/></birth>
            <xsl:if test="tei:cell[4] != ''">
                <langKnowledge>
                    <xsl:for-each select="tokenize(tei:cell[4], ',')">
                        <langKnown tag="{.}"/>
                    </xsl:for-each>
                </langKnowledge>
            </xsl:if>
            <note><xsl:value-of select="tei:cell[5]"/></note>
        </person>
    </xsl:template>

    <xsl:template match="tei:table[tei:head = 'Speakers']/tei:row[tei:cell[1] != '']" mode="teiInstanceDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of speakers in the teiCorpus  
            * "teiInstanceDoc": this generates the list of speakers in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <person sameAs="{$teiCorpusPrefix}:{tei:cell[1]}">
            <name type="pseudonym"><xsl:value-of select="tei:cell[1]"/></name>
        </person>
    </xsl:template>
    
   
    <xsl:template match="tei:table[tei:head = 'Team']/tei:row[tei:cell[1] != '']" mode="teiCorpusDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of team members in the teiCorpus
            * "respStmts: genereates a list of respStmts pointing to the list of team members 
            * "teiInstanceDoc": this generates the list of team members in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <xsl:param name="mode"/>
        <person xml:id="{tei:cell[1]}">
            <persName>
                <forename><xsl:value-of select="tei:cell[$cn('Team')('Forename')]"/></forename>
                <surname><xsl:value-of select="tei:cell[$cn('Team')('Surname')]"/></surname>
            </persName>
            <state type="projectRole"><desc><xsl:value-of select="tei:cell[$cn('Team')('Role')]"/></desc></state>
            <idno type="URI" subtype="ORCID">
                <xsl:choose>
                    <xsl:when test="tei:cell[$cn('Team')('ORCID')] != ''">
                        <xsl:value-of select="concat('https://orcid.org/',tei:cell[$cn('Team')('ORCID')])"/>
                    </xsl:when>
                    <xsl:otherwise>
                        TODO get an ORCID
                    </xsl:otherwise>
                </xsl:choose>
            </idno>
            <affiliation><xsl:value-of select="tei:cell[$cn('Team')('Affiliation')]"/></affiliation>
            <note><xsl:value-of select="tei:cell[$cn('Team')('Note')]"/></note>
        </person>
    </xsl:template>

    <xsl:template match="tei:table[tei:head = 'Team']/tei:row[tei:cell[1] != '']" mode="respStmtInstanceDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of team members in the teiCorpus 
            * "teiInstanceDoc": this generates the list of team members in one TEI instance, 
            * "respStmtsCorpusDoc: genereates a list of respStmts in the TEI Corpus Header
            * "respStmtsInstanceDoc: genereates a list of respStmts pointing to the list of team members in the TEI Corpus
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <xsl:param name="mode"/>
        <respStmt>
            <persName ref="corpus:{tei:cell[1]}">
                <forename><xsl:value-of select="tei:cell[2]"/></forename>
                <surname><xsl:value-of select="tei:cell[3]"/></surname>
            </persName>
            <resp><xsl:value-of select="tei:cell[4]"/></resp>
        </respStmt>
    </xsl:template>
    
    <xsl:template match="tei:table[tei:head = 'Team']/tei:row[tei:cell[1] != '']" mode="respStmtCorpusDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of team members in the teiCorpus
            * "respStmts: genereates a list of respStmts pointing to the list of team members in the TEI Corpus 
            * "teiInstanceDoc": this generates the list of team members in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <xsl:param name="mode"/>
        <respStmt>
            <persName ref="#{tei:cell[1]}">
                <forename><xsl:value-of select="tei:cell[2]"/></forename>
                <surname><xsl:value-of select="tei:cell[3]"/></surname>
            </persName>
            <resp><xsl:value-of select="tei:cell[4]"/></resp>
        </respStmt>
    </xsl:template>
    
    <xsl:template match="tei:table[tei:head = 'Team']/tei:row[tei:cell[1] != '']" mode="teiInstanceDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of team members in the teiCorpus
            * "respStmts: genereates a list of respStmts pointing to the list of team members 
            * "teiInstanceDoc": this generates the list of team members in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <person sameAs="{$teiCorpusPrefix}:{tei:cell[1]}">
            <name type="pseudonym"><xsl:value-of select="tei:cell[1]"/></name>
        </person>
    </xsl:template>
    
    <xsl:template match="tei:table[tei:head = 'Subjects']/tei:row[tei:cell[1] != '']" mode="teiInstanceDoc">
        <!-- mode = what is the context of this run:
            * "teiCorpusDoc": this generates the master list of speakers in the teiCorpus  
            * "teiInstanceDoc": this generates the list of speakers in one TEI instance, 
            thus not include all details but a @sameAs attribute pointing to the corpusHeader -->
        <catRef target="{$teiCorpusPrefix}:{_:ID(tei:cell[1])}"/>
    </xsl:template>
    
   
</xsl:stylesheet>