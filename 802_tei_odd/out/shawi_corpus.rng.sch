<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<sch:schema xmlns:rng="http://relaxng.org/ns/structure/1.0"
            xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            queryBinding="xslt2">
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="tei"
           uri="http://www.tei-c.org/ns/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="xs"
           uri="http://www.w3.org/2001/XMLSchema"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="rng"
           uri="http://relaxng.org/ns/structure/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="rna"
           uri="http://relaxng.org/ns/compatibility/annotations/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="sch"
           uri="http://purl.oclc.org/dsdl/schematron"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:math="http://www.w3.org/1998/Math/MathML"
           xmlns:s="http://purl.oclc.org/dsdl/schematron"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xi="http://www.w3.org/2001/XInclude"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           prefix="sch1x"
           uri="http://www.ascc.net/xml/schematron"/>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.datable.w3c-att-datable-w3c-when-constraint-rule-1">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@when]">
         <sch:report test="@notBefore|@notAfter|@from|@to" role="nonfatal">The @when attribute cannot be used with any other att.datable.w3c attributes.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.datable.w3c-att-datable-w3c-from-constraint-rule-2">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@from]">
         <sch:report test="@notBefore" role="nonfatal">The @from and @notBefore attributes cannot be used together.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.datable.w3c-att-datable-w3c-to-constraint-rule-3">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@to]">
         <sch:report test="@notAfter" role="nonfatal">The @to and @notAfter attributes cannot be used together.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.global.source-source-only_1_ODD_source-constraint-rule-4">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@source]">
         <sch:let name="srcs" value="tokenize( normalize-space(@source),' ')"/>
         <sch:report test="( self::tei:classRef               | self::tei:dataRef               | self::tei:elementRef               | self::tei:macroRef               | self::tei:moduleRef               | self::tei:schemaSpec )               and               $srcs[2]">
              When used on a schema description element (like
              <sch:value-of select="name(.)"/>), the @source attribute
              should have only 1 value. (This one has <sch:value-of select="count($srcs)"/>.)
            </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.typed-subtypeTyped-constraint-rule-5">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@subtype]">
         <sch:assert test="@type">The <sch:name/> element should not be categorized in detail with @subtype unless also categorized in general with @type</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.pointing-targetLang-targetLang-constraint-rule-6">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[not(self::tei:schemaSpec)][@targetLang]">
         <sch:assert test="@target">@targetLang should only be used on <sch:name/> if @target is specified.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.styleDef-schemeVersion-schemeVersionRequiresScheme-constraint-rule-7">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@schemeVersion]">
         <sch:assert test="@scheme and not(@scheme = 'free')">
              @schemeVersion can only be used if @scheme is specified.
            </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-att.calendarSystem-calendar-calendar-constraint-rule-8">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
              systems or calendars to which the date represented by the content of this element belongs,
              but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-p-abstractModel-structure-p-in-ab-or-p-constraint-report-5">
      <rule context="tei:p">
         <sch:report xmlns="http://www.tei-c.org/ns/1.0"
                     xmlns:math="http://www.w3.org/1998/Math/MathML"
                     xmlns:s="http://purl.oclc.org/dsdl/schematron"
                     xmlns:svg="http://www.w3.org/2000/svg"
                     xmlns:xi="http://www.w3.org/2001/XInclude"
                     test="(ancestor::tei:ab or ancestor::tei:p) and not( ancestor::tei:floatingText |parent::tei:exemplum |parent::tei:item |parent::tei:note |parent::tei:q |parent::tei:quote |parent::tei:remarks |parent::tei:said |parent::tei:sp |parent::tei:stage |parent::tei:cell |parent::tei:figure )">
        Abstract model violation: Paragraphs may not occur inside other paragraphs or ab elements.
      </sch:report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-p-abstractModel-structure-p-in-l-or-lg-constraint-report-6">
      <rule context="tei:p">
         <sch:report xmlns="http://www.tei-c.org/ns/1.0"
                     xmlns:math="http://www.w3.org/1998/Math/MathML"
                     xmlns:s="http://purl.oclc.org/dsdl/schematron"
                     xmlns:svg="http://www.w3.org/2000/svg"
                     xmlns:xi="http://www.w3.org/2001/XInclude"
                     test="(ancestor::tei:l or ancestor::tei:lg) and not( ancestor::tei:floatingText |parent::tei:figure |parent::tei:note )">
        Abstract model violation: Lines may not contain higher-level structural elements such as div, p, or ab, unless p is a child of figure or note, or is a descendant of floatingText.
      </sch:report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-desc-deprecationInfo-only-in-deprecated-constraint-rule-9">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:desc[ @type eq 'deprecationInfo']">
         <sch:assert test="../@validUntil">Information about a
        deprecation should only be present in a specification element
        that is being deprecated: that is, only an element that has a
        @validUntil attribute should have a child &lt;desc
        type="deprecationInfo"&gt;.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-name-calendar-calendar-check-name-constraint-rule-10">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-ref-refAtts-constraint-report-7">
      <rule context="tei:ref">
         <report xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="@target and @cRef">Only one of the
	attributes @target' and @cRef' may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-author-calendar-calendar-check-author-constraint-rule-11">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-editor-calendar-calendar-check-editor-constraint-rule-12">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-respStmt-name-check-constraint-rule-13">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:resp[text()='recording']">
         <s:let name="currentID"
                value="//tei:publicationStmt/tei:idno[@type='SHAWICorpusID']/text()"/>
         <s:let name="recFile"
                value="'../../080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml'"/>
         <s:let name="recFileData"
                value="doc($recFile)//tei:table[tei:head[text()='Recordings']]/tei:row[@n &gt; 1][tei:cell[1][text() = $currentID]]"/>
         <s:assert test="preceding-sibling::tei:persName = $recFileData/tei:cell[6]">
                                    The person for the role 'recording' should be: <s:value-of select="$recFileData/tei:cell[6]"/>
         </s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:resp[text()='transcription']">
         <s:let name="currentID"
                value="//tei:publicationStmt/tei:idno[@type='SHAWICorpusID']/text()"/>
         <s:let name="recFile"
                value="'../../080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml'"/>
         <s:let name="recFileData"
                value="doc($recFile)//tei:table[tei:head[text()='Recordings']]/tei:row[@n &gt; 1][tei:cell[1][text() = $currentID]]"/>
         <s:assert test="preceding-sibling::tei:persName = $recFileData/tei:cell[8]">
                                    The person for the role 'transcription' should be: <s:value-of select="$recFileData/tei:cell[8]"/>
         </s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:resp[text()='transcription check']">
         <s:let name="currentID"
                value="//tei:publicationStmt/tei:idno[@type='SHAWICorpusID']/text()"/>
         <s:let name="recFile"
                value="'../../080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml'"/>
         <s:let name="recFileData"
                value="doc($recFile)//tei:table[tei:head[text()='Recordings']]/tei:row[@n &gt; 1][tei:cell[1][text() = $currentID]]"/>
         <s:assert test="(preceding-sibling::tei:persName = $recFileData/tei:cell[9]) or (preceding-sibling::tei:persName = $recFileData/tei:cell[10])">
                                    The person for the role 'transcription check' should be: <s:value-of select="$recFileData/tei:cell[9]"/> or <s:value-of select="$recFileData/tei:cell[10]"/>
         </s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:resp[text()='translation']">
         <s:let name="currentID"
                value="//tei:publicationStmt/tei:idno[@type='SHAWICorpusID']/text()"/>
         <s:let name="recFile"
                value="'../../080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml'"/>
         <s:let name="recFileData"
                value="doc($recFile)//tei:table[tei:head[text()='Recordings']]/tei:row[@n &gt; 1][tei:cell[1][text() = $currentID]]"/>
         <s:assert test="preceding-sibling::tei:persName = $recFileData/tei:cell[11]">
                                    The person for the role 'translation' should be: <s:value-of select="$recFileData/tei:cell[11]"/>
         </s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:resp[text()='translation check']">
         <s:let name="currentID"
                value="//tei:publicationStmt/tei:idno[@type='SHAWICorpusID']/text()"/>
         <s:let name="recFile"
                value="'../../080_scripts_generic/080_01_ELAN2TEI/data/Shawi_Recordings.xml'"/>
         <s:let name="recFileData"
                value="doc($recFile)//tei:table[tei:head[text()='Recordings']]/tei:row[@n &gt; 1][tei:cell[1][text() = $currentID]]"/>
         <s:assert test="preceding-sibling::tei:persName = $recFileData/tei:cell[12]">
                                    The person for the role 'translation check' should be: <s:value-of select="$recFileData/tei:cell[12]"/>
         </s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-resp-uniqueRespValues-constraint-rule-18">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:respStmt">
         <s:assert test="not(tei:resp[. != 'recording' and . != 'transcription check' and . != 'contributor' and . = preceding::tei:resp])">Each value inside 'respStmt' must be unique, except for 'recording', 'transcription check' and 'contributor'</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-title-calendar-calendar-check-title-constraint-rule-19">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-fileDesc-rec-person-twice-constraint-rule-20">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:respStmt">
         <s:assert test="count(//tei:resp[text() = 'recording']) = 2">The role 'recording' should appear exactly twice across all respStmt elements</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-funder-funderIdnoType-constraint-rule-21">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:funder/tei:idno">
         <s:assert test="@type='projectNumber'">Only the type "projectNumber" is permitted for idno inside funder</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-funder-calendar-check-funder-constraint-rule-22">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-funder-calendar-calendar-check-funder-constraint-rule-23">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-publicationStmt-publStmtIdnoType-constraint-rule-24">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:publicationStmt/tei:idno">
         <s:assert test="@type='SHAWICorpusID'">Only the type "SHAWICorpusID" is permitted for idno inside publicationStmt</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-idno-calendar-calendar-check-idno-constraint-rule-25">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-licence-calendar-calendar-check-licence-constraint-rule-26">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-change-calendar-calendar-check-change-constraint-rule-27">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-orgName-calendar-calendar-check-orgName-constraint-rule-28">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-persName-calendar-calendar-check-persName-constraint-rule-29">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-placeName-calendar-calendar-check-placeName-constraint-rule-30">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
                        systems or calendars to which the date represented by the content of this element belongs,
                        but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-div-abstractModel-structure-div-in-l-or-lg-constraint-report-8">
      <rule context="tei:div">
         <sch:report xmlns="http://www.tei-c.org/ns/1.0"
                     xmlns:math="http://www.w3.org/1998/Math/MathML"
                     xmlns:s="http://purl.oclc.org/dsdl/schematron"
                     xmlns:svg="http://www.w3.org/2000/svg"
                     xmlns:xi="http://www.w3.org/2001/XInclude"
                     test="(ancestor::tei:l or ancestor::tei:lg) and not(ancestor::tei:floatingText)">
        Abstract model violation: Lines may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
      </sch:report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-div-abstractModel-structure-div-in-ab-or-p-constraint-report-9">
      <rule context="tei:div">
         <sch:report xmlns="http://www.tei-c.org/ns/1.0"
                     xmlns:math="http://www.w3.org/1998/Math/MathML"
                     xmlns:s="http://purl.oclc.org/dsdl/schematron"
                     xmlns:svg="http://www.w3.org/2000/svg"
                     xmlns:xi="http://www.w3.org/2001/XInclude"
                     test="(ancestor::tei:p or ancestor::tei:ab) and not(ancestor::tei:floatingText)">
        Abstract model violation: p and ab may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
      </sch:report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-w-msd-spec-constraint-rule-31">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:w[@msd]">
         <s:let name="fLibFile" value="'../../010_manannot/fLib.xml'"/>
         <s:let name="msd_values"
                value="doc($fLibFile)//tei:fvLib[@n='Morpho-syntactic annotations']/tei:fs/@xml:id"/>
         <s:assert test="@msd = $msd_values">MSD: '<s:value-of select="@msd"/>' is not in list of msd values (<s:value-of select="$msd_values"/>)</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-w-lemmaRef-spec-constraint-rule-32">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:w[@xml:lang='ar-acm-x-shawi-vicav']">
         <s:let name="dict"
                value="'../../vicav_dicts/dc_shawi_eng_2025_05_14T12_08_57.xml'"/>
         <s:let name="entryIDs" value="doc($dict)//tei:entry/@xml:id"/>
         <s:assert test="not(@lemmaRef) or substring-after(@lemmaRef, 'dict:') = $entryIDs">There is no entry in the dictionary for the current w element: '<s:value-of select="@lemmaRef"/>'</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-span-span-target-check-constraint-rule-33">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:span">
         <s:assert test="parent::tei:spanGrp/parent::tei:annotationBlock/@xml:id = substring-after(@target, '#')">target of span should point at xml:id of parent annotationBlock element</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-span-targetfrom-constraint-report-10">
      <rule context="tei:span">
         <report xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="@from and @target">
Only one of the attributes @target and @from may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-span-targetto-constraint-report-11">
      <rule context="tei:span">
         <report xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="@to and @target">
Only one of the attributes @target and @to may be supplied on <name/>
         </report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-span-tonotfrom-constraint-report-12">
      <rule context="tei:span">
         <report xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="@to and not(@from)">
If @to is supplied on <name/>, @from must be supplied as well</report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-span-tofrom-constraint-report-13">
      <rule context="tei:span">
         <report xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="contains(normalize-space(@to),' ') or contains(normalize-space(@from),' ')">
The attributes @to and @from on <name/> may each contain only a single value</report>
      </rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="vicav_corpus-shift-shiftNew-constraint-assert-30">
      <rule context="tei:shift">
         <assert xmlns:math="http://www.w3.org/1998/Math/MathML"
                 xmlns:s="http://purl.oclc.org/dsdl/schematron"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns:xi="http://www.w3.org/2001/XInclude"
                 test="@new"
                 role="warning">              
The @new attribute should always be supplied; use the special value
"normal" to indicate that the feature concerned ceases to be
remarkable at this point.</assert>
      </rule>
   </pattern>
   <sch:diagnostics/>
</sch:schema>
