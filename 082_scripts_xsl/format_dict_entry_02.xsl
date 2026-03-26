<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" >
    <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="no"/>

    <xsl:template match="node()|@*">
        <xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:bibl | bibl" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:cit | cit" xml:space="preserve"><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>
    
    <xsl:template match="tei:cit/tei:form | cit/form" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:cit[@type='example']/tei:cit | tei:cit[@type='etymon']/tei:cit | cit[@type='example']/cit" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:cit/tei:quote | cit/quote" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:def | def" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:entry | entry" xml:space="preserve"><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>
    
    <xsl:template match="tei:entry/tei:gramGrp | entry/gramGrp" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>

    <xsl:template match="tei:entry/tei:note | entry/note" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="entry1|tei:entry1" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>

    <xsl:template match="tei:etym | etym" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:text>&#xA;</xsl:text><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>

    <xsl:template match="tei:form[@type='lemma' or @type='multiWordUnit' or @type='variant' or @type='stem'] | form[@type='lemma' or @type='multiWordUnit' or @type='variant' or @type='stem']" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>
    
    <xsl:template match="tei:form[@type='inflected'] | form[@type='inflected'] | tei:form[@type='derivative']  | tei:form[@type='stem'] | form[@type='derivative']" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>    
    

    <xsl:template match="tei:gram | gram" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:form/tei:gramGrp | form/gramGrp" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>
    <xsl:template match="tei:entry/tei:gramGrp | entry/gramGrp" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>
    
    <xsl:template match="tei:form/tei:usg | form/usg" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:form[@type='lemma' or @type='multiWordUnit' or @type='inflected' or @type='derivative' or @type='variant' or @type='stem']/tei:orth | form[@type='lemma' or @type='stem' or @type='multiWordUnit' or @type='derivative' or @type='inflected' or @type='variant']/orth" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:fs[@type='change' or @type='create'][1] | fs[@type='change' or @type='create'][1]" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    <xsl:template match="tei:fs[@type='change' or @type='create'][position()&gt;1] | fs[@type='change' or @type='create'][position()&gt;1]" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:entry/tei:gramGrp/tei:gram | gramGrp/gram" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:lb | lb" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:gloss | gloss" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>    

    <xsl:template match="tei:listBibl | listBibl" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>    
    
    <xsl:template match="tei:note[@type='nyemEntry'] | note[@type='nyemEntry']" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:note[@type='workflow'] | note[@type='workflow']" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="per|tei:per" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>

    <xsl:template match="tei:pos[@type='nyemPos'] | pos[@type='nyemPos']" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>
    
    <xsl:template match="tei:pron | pron" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:ref[@type='example'] | ref[@type='example']" xml:space="preserve"><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="ref[@type='wikipedia'] | tei:ref[@type='wikipedia']" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:oRef | oRef" xml:space="preserve"><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    <xsl:template match="tei:seg | seg" xml:space="preserve"><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:sense | sense" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy></xsl:template>
    
    <xsl:template match="tei:sense/tei:cit | sense/cit" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text>&#xA;</xsl:text></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>
    <xsl:template match="tei:sense/tei:gramGrp | sense/gramGrp" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/><xsl:text></xsl:text></xsl:copy><xsl:text>&#xA;</xsl:text></xsl:template>
    
    <xsl:template match="tei:sense/tei:usg | sense/usg" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>
    
    <xsl:template match="tei:usg | usg" xml:space="preserve"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>

    <xsl:template match="tei:xr | xr"><xsl:text>&#xA;</xsl:text><xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy></xsl:template>    
    
</xsl:stylesheet>
