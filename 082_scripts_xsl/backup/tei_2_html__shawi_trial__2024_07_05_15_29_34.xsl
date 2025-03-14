<xsl:stylesheet xml:space="preserve" 
                xmlns="http://www.w3.org/1999/xhtml" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tei="http://www.tei-c.org/ns/1.0" 
                version="2.0" 
                exclude-result-prefixes="xsl tei">
    <xsl:output method="html" indent="no" encoding="UTF-8"/>
    <xsl:strip-space elements="tei:body tei:TEI tei:row tei:cell tei:teiHeader tei:text tei:u tei:hi tei:ref tei:p tei:fileDesc tei:titleStmt tei:publicationStmt tei:editionStmt tei:revisionDesc tei:sourceDesc tei:div"/>

    <!-- Parameter for external document path -->
   <xsl:param name="pathToExternalDoc">../010_manannot/shawi_standoff.xml</xsl:param>
    <!-- Load the external XML document using the parameter -->
    <xsl:variable name="externalDoc" select="doc('../010_manannot/shawi_standoff.xml')" as="document-node()"/>
    
  <!-- Key to access elements by ID quickly within the external document -->
    <xsl:key name="element-by-id" match="*[@id]" use="@id"/>
    
    <!-- Variable to hold the title -->
    <xsl:variable name="title" select="//tei:titleStmt/tei:title"/>
    
     <!-- Variable to count all 'ana' attributes in the document -->
    <xsl:variable name="anaCount" select="count(//tei:*[@ana])"/>
    <xsl:variable name="wCount" select="count(//tei:w)"/>

    <!-- Template to apply at the root level -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <style type="text/css">
    .countResult {
        color: blue;
        background-color: green;
        padding: 10px;
        margin: 10px 0;
    }
    .missing {
        color: red;
    }
</style>

            </head>
            <body>
                
              
                <h1><xsl:value-of select="$title"/></h1>
                
                <p class="countResult">Total 'ana' attributes found: <xsl:value-of select="$anaCount"/></p>
                <p class="countResult">Total 'w' elements found: <xsl:value-of select="$wCount"/></p>

                <!-- Example of using external document content -->
                <p>Content from external document: <xsl:value-of select="$externalDoc//someElement"/></p>
                <!-- Processing the body of the TEI document -->
                <xsl:apply-templates select="tei:text/tei:body"/>
            </body>
        </html>
    </xsl:template>
    
      <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
            </head>
            <body>
                
                <xsl:apply-templates select=".//tei:body"/>
            </body>
        </html>
    </xsl:template>

   <xsl:template match="tei:w[@ana]">
    <span>
        <xsl:attribute name="class">
            <!-- Prüft, ob das externe Dokument ein Element mit der ID hat, die in @ana ohne das vorangestellte # angegeben ist -->
            <xsl:if test="not($externalDoc//*[@id = substring(current()/@ana, 2)])">missing</xsl:if>
        </xsl:attribute>
        <xsl:value-of select="."/>
    </span>
</xsl:template>



    <!-- Identity template for basic copying of content -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <!-- Specific template for paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>
