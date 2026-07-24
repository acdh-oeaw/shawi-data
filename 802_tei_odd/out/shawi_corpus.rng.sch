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
            id="shawi_corpus-att.cmc-generatedBy-CMC_generatedBy_within_post-constraint-rule-1">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@generatedBy]">
         <sch:assert test="ancestor-or-self::tei:post">The @generatedBy attribute is for use within a &lt;post&gt; element.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-att.datable.w3c-att-datable-w3c-when-constraint-rule-2">
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
            id="shawi_corpus-att.datable.w3c-att-datable-w3c-from-constraint-rule-3">
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
            id="shawi_corpus-att.datable.w3c-att-datable-w3c-to-constraint-rule-4">
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
            id="shawi_corpus-att.global.source-source-only_1_ODD_source-constraint-rule-5">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[@source]">
         <sch:let name="srcs" value="tokenize( normalize-space(@source),' ')"/>
         <sch:report test="(   self::tei:classRef                                 | self::tei:dataRef                                 | self::tei:elementRef                                 | self::tei:macroRef                                 | self::tei:moduleRef                                 | self::tei:schemaSpec )                                   and                                   $srcs[2]">
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
            id="shawi_corpus-att.pointing-targetLang-targetLang-constraint-rule-6">
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
            id="shawi_corpus-att.spanning-spanTo-spanTo-points-to-following-constraint-rule-7">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:*[ starts-with( @spanTo, '#') ]">
         <sch:assert test="id( substring( @spanTo, 2 ) ) &gt;&gt; .">
	      The element indicated by @spanTo (<sch:value-of select="@spanTo"/>) must follow the current <sch:name/> element 
            </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-att.styleDef-schemeVersion-schemeVersionRequiresScheme-constraint-rule-8">
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
            id="shawi_corpus-att.typed-subtypeTyped-constraint-rule-9">
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
            id="shawi_corpus-att.calendarSystem-calendar-calendar_attr_on_empty_element-constraint-rule-10">
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
            id="shawi_corpus-p-abstractModel-structure-p-in-ab-or-p-constraint-rule-11">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:p">
         <sch:report test="(ancestor::tei:ab or ancestor::tei:p) and                        not( ancestor::tei:floatingText                           | parent::tei:exemplum                           | parent::tei:item                           | parent::tei:note                           | parent::tei:q                           | parent::tei:quote                           | parent::tei:remarks                           | parent::tei:said                           | parent::tei:sp                           | parent::tei:stage                           | parent::tei:cell                           | parent::tei:figure )">
          Abstract model violation: Paragraphs may not occur inside other paragraphs or ab elements.
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-p-abstractModel-structure-p-in-l-constraint-rule-12">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:l//tei:p">
         <sch:assert test="ancestor::tei:floatingText | parent::tei:figure | parent::tei:note">
          Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, p, or ab, unless p is a child of figure or note, or is a descendant of floatingText.
        </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-desc-deprecationInfo-only-in-deprecated-constraint-rule-13">
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
            id="shawi_corpus-ref-refAtts-constraint-rule-14">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:ref">
         <sch:report test="@target and @cRef">Only one of the attributes @target and @cRef may be supplied on <sch:name/>.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-note-note-target-check-constraint-rule-15">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:u/tei:note">
         <s:assert test="parent::tei:u/tei:w/@xml:id = substring-after(@target, '#')">The target of note in u should point to a w element of the same
                                    parent u element</s:assert>
         <s:assert test="@resp">The note element must have a resp
                                    attribute</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-resp-uniqueRespValues-constraint-rule-16">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:respStmt">
         <s:assert test="not(tei:resp[. != 'recording' and . != 'transcription check' and . != 'contributor' and . = preceding::tei:resp])">Each value inside 'respStmt' must be unique, except for
                                    'recording', 'transcription check' and 'contributor'</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-fileDesc-rec-person-twice-constraint-rule-17">
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
            id="shawi_corpus-funder-funderIdnoType-constraint-rule-18">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:funder/tei:idno">
         <s:assert test="@type='projectNumber'">Only the type "projectNumber"
                                    is permitted for idno inside funder</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-publicationStmt-publStmtIdnoType-constraint-rule-19">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:publicationStmt/tei:idno">
         <s:assert test="@type='SHAWICorpusID' or @type='teiSource'">Only the types "SHAWICorpusID" and "teiSource" are permitted for idno inside publicationStmt</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-textClass-textclass-taxonomy-values-constraint-rule-20">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:textClass/*[self::tei:catRef or self::tei:keywords[tei:term]]">
         <s:let name="prefix" value="tokenize(@scheme, ':')[1]"/>
         <s:let name="prefix-regex"
                value="if (contains(@scheme, ':')) then'(corpus|vtc)' else ()"/>
         <s:let name="prefix-def"
                value="ancestor::tei:TEI/tei:teiHeader//tei:prefixDef[@ident = $prefix][1]"/>
         <s:let name="taxonomy-id"
                value="replace(@scheme, concat('^', $prefix-regex, ':'), '')"/>
         <s:let name="taxonomy-href"
                value="if ($prefix-def and matches(@scheme, concat('^', $prefix-regex, ':'))) then replace($taxonomy-id, string($prefix-def/@matchPattern), string($prefix-def/@replacementPattern)) else ()"/>
         <s:let name="taxonomy-uri"
                value="if ($taxonomy-href) then resolve-uri(replace($taxonomy-href, '#.*$', ''), base-uri(/)) else ()"/>
         <s:let name="taxonomy-doc"
                value="if ($taxonomy-uri and doc-available($taxonomy-uri)) then doc($taxonomy-uri) else ()"/>
         <s:let name="taxonomy"
                value="$taxonomy-doc//tei:taxonomy[@xml:id = $taxonomy-id]"/>
         <s:let name="taxonomy-values-id"
                value="for $cat in $taxonomy//tei:category[@xml:id] return string($cat/@xml:id)"/>
         <s:let name="taxonomy-values-n"
                value="for $cat in $taxonomy//tei:category[@n] return normalize-space($cat/@n)"/>
         <s:let name="invalid-targets"
                value="if (self::tei:catRef) then (for $t in tokenize(@target, '\s+') return if (matches($t, concat('^', $prefix-regex, ':')) and replace($t, concat('^', $prefix-regex, ':'), '') = $taxonomy-values-id) then () else $t) else ()"/>
         <s:let name="invalid-terms"
                value="if (self::tei:keywords) then tei:term[not(normalize-space(.) = $taxonomy-values-n)] else ()"/>
         <s:assert test="@scheme">Elements in textClass must provide @scheme</s:assert>
         <s:assert test="matches(@scheme, concat('^', $prefix-regex, ':.+$'))">@scheme must use the corpus: or vtc: prefix</s:assert>
         <s:assert test="exists($prefix-def)">No prefixDef with ident='corpus' or ident='vtc' is defined in the TEI header</s:assert>
         <s:assert test="normalize-space($taxonomy-id) != ''">@scheme must provide a taxonomy xml:id after 'corpus:' or 'vtc:'</s:assert>
         <s:assert test="$taxonomy-uri and doc-available($taxonomy-uri)">The taxonomy file referenced by @scheme ('<s:value-of select="@scheme"/>') cannot be loaded</s:assert>
         <s:assert test="exists($taxonomy)">The taxonomy referenced by @scheme ('<s:value-of select="@scheme"/>') does not exist <s:value-of select="$taxonomy-id"/>
            <s:value-of select="$prefix-def"/>
         </s:assert>
         <s:assert test="if (self::tei:catRef) then @target else true()">catRef must provide @target</s:assert>
         <s:assert test="if (self::tei:catRef) then every $t in tokenize(@target, '\s+') satisfies matches($t, concat('^', $prefix-regex, ':.+$')) else true()">Each catRef target must use the corpus: or vtc: prefix</s:assert>
         <s:assert test="if (self::tei:catRef) then empty($invalid-targets) else true()">Unknown catRef target(s): <s:value-of select="string-join($invalid-targets, ', ')"/>. Each target must match a tei:category/@xml:id in the referenced taxonomy.</s:assert>
         <s:assert test="if (self::tei:keywords) then empty($invalid-terms) else true()">Unknown keyword term(s): <s:value-of select="string-join($invalid-terms/normalize-space(.), ', ')"/>. Each term must match a value in the referenced taxonomy.</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-div-div-distinction-without-translation-constraint-rule-21">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:div[@type='Situation']">
         <s:assert test="tei:head">a head element is required when div is of type Situation</s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:div[@corresp]">
         <s:assert test="tei:u">a div without type Situation has to have utterances</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-div-abstractModel-structure-div-in-l-constraint-rule-23">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:l//tei:div">
         <sch:assert test="ancestor::tei:floatingText">
          Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
        </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-div-abstractModel-structure-div-in-ab-or-p-constraint-rule-24">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:div">
         <sch:report test="(ancestor::tei:p or ancestor::tei:ab) and not(ancestor::tei:floatingText)">
          Abstract model violation: p and ab may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-w-msd-spec-constraint-rule-25">
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
            id="shawi_corpus-w-lemmaRef-spec-constraint-rule-26">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:w[@xml:lang='ar-acm-x-shawi-vicav']">
         <s:assert test="@lemmaRef or (@type='truncated')">@lemmaRef is required when xml:lang is 'ar-acm-x-shawi-vicav' and type is not truncated</s:assert>
         <s:let name="dict" value="'../../vicav_dicts/dc_shawi_eng.xml'"/>
         <s:let name="entryIDs" value="doc($dict)//tei:entry/@xml:id"/>
         <s:assert test="not(@lemmaRef) or substring-after(@lemmaRef, 'dict:') = $entryIDs">There is no entry in the dictionary for the current w element: '<s:value-of select="@lemmaRef"/>'</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-w-rend-spec-constraint-rule-27">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:w[@rendition]">
         <s:let name="rendFile"
                value="'https://raw.githubusercontent.com/acdh-oeaw/vicav-library/main/vicav_rendition.xml'"/>
         <s:let name="rend_values" value="doc($rendFile)//tei:rendition/@xml:id"/>
         <s:assert test="every $r in tokenize(normalize-space(@rendition), '\s+') satisfies (replace(replace($r, '^rend:', ''), '^#', '') = $rend_values)">@rendition contains value(s) not found in vicav_rendition.xml:
                                        '<s:value-of select="@rendition"/>'</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-span-span-target-check-constraint-rule-28">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:span">
         <s:assert test="parent::tei:spanGrp/parent::tei:div/@xml:id = substring-after(@target, '#')">target of span should point at xml:id of parent div
                                    element</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-span-target-from-constraint-rule-29">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:span">
         <sch:report test="@from and @target">
          Only one of the attributes @target and @from may be supplied on <sch:name/>
         </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-span-targetto-constraint-rule-30">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:span">
         <sch:report test="@to and @target">
          Only one of the attributes @target and @to may be supplied on <sch:name/>
         </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-span-tonotfrom-constraint-rule-31">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:span">
         <sch:report test="@to and not(@from)">
          If @to is supplied on <sch:name/>, @from must be supplied as well
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-span-tofrom-constraint-rule-32">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:span">
         <sch:report test="contains(normalize-space(@to),' ') or contains(normalize-space(@from),' ')">
          The attributes @to and @from on <sch:name/> may each contain only a single value
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-u-uniqueIDs-constraint-rule-33">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:seg[@xml:id]">
         <s:assert test="count(root()//*[@xml:id = current()/@xml:id]) = 1">xml id of seg element must be unique</s:assert>
      </s:rule>
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="//tei:w[@xml:id]">
         <s:assert test="count(root()//*[@xml:id = current()/@xml:id]) = 1">xml id of w element must be unique</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-u-u-who-check-constraint-rule-35">
      <s:rule xmlns="http://www.tei-c.org/ns/1.0"
              xmlns:math="http://www.w3.org/1998/Math/MathML"
              xmlns:s="http://purl.oclc.org/dsdl/schematron"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns:xi="http://www.w3.org/2001/XInclude"
              context="tei:u">
         <s:assert test="starts-with(@who, 'corpus:')">The 'who' attribute of
                                    u has to start with 'corpus:'</s:assert>
         <s:assert test="every $w in tokenize(@who, '\s+') satisfies //tei:person/@sameAs = $w">The 'who' attribute of u must point to a person defined in the
                                    header</s:assert>
      </s:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="shawi_corpus-shift-shiftNew-constraint-rule-36">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:math="http://www.w3.org/1998/Math/MathML"
                xmlns:s="http://purl.oclc.org/dsdl/schematron"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                context="tei:shift">
         <sch:assert test="@new" role="warning">              
          The @new attribute should always be supplied; use the special value
          "normal" to indicate that the feature concerned ceases to be
          remarkable at this point.
        </sch:assert>
      </sch:rule>
   </pattern>
   <sch:diagnostics/>
</sch:schema>
