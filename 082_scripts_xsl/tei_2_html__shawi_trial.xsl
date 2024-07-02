<xsl:stylesheet xml:space="preserve" 
                xmlns="http://www.w3.org/1999/xhtml" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tei="http://www.tei-c.org/ns/1.0" 
                version="2.0" 
                exclude-result-prefixes="xsl tei">
    <xsl:output method="html" indent="no" encoding="UTF-8"/>
    <xsl:strip-space elements="tei:body tei:TEI tei:row tei:cell tei:teiHeader tei:text tei:u tei:hi tei:ref tei:p tei:fileDesc tei:titleStmt tei:publicationStmt tei:editionStmt tei:revisionDesc tei:sourceDesc tei:div"/>

    <!-- Variable to hold the title -->
    <xsl:variable name="title" select="//tei:titleStmt/tei:title"/>

    <!-- Variable to count all 'ana' attributes in the document -->
    <xsl:variable name="anaCount" select="count(//tei:*[@ana])"/>
    <xsl:variable name="wCount" select="count(//tei:w)"/>

    <!-- Template to apply at the root level -->
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <!-- Embed CSS styles directly in the head section -->
                <style type="text/css">
                    p {
                        color: blue; /* Sets the text color to blue */
                        background-color: green; /* Sets the background color to green */
                        padding: 10px; /* Adds space around the text */
                        margin: 10px 0; /* Adds space above and below the paragraph */
                    }
                </style>
            </head>
            <body>
                <h1><xsl:value-of select="$title"/></h1>
                <p>Total 'ana' attributes found: <xsl:value-of select="$anaCount"/></p>
                <p>Total 'w' elements found: <xsl:value-of select="$wCount"/></p>
                <!-- Processing the body of the TEI document -->
                <xsl:apply-templates select=".//tei:body"/>
            </body>
        </html>
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
