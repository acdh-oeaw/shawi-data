<xsl:stylesheet xml:space="preserve" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" exclude-result-prefixes="xsl tei">
   <xsl:output method="html" indent="no" encoding="UTF-8"/>
   <xsl:strip-space elements="tei:body tei:TEI tei:row tei:cell tei:teiHeader tei:text tei:u tei:hi tei:ref tei:p tei:fileDesc tei:titleStmt tei:publicationStmt tei:editionStmt tei:revisionDesc tei:sourceDesc tei:div"/>
   <!--*** FN: tei_2_html__shawi_002.xsl *** -->

   <xsl:variable name="title">
      <xsl:value-of select="//tei:titleStmt/tei:title"/>
   </xsl:variable>

   <xsl:template match="/">
      <html>
         <xsl:comment>This is a generated page, do not edit!</xsl:comment>
         <xsl:comment>XSLT: tei_2_html__simple_text.xsl</xsl:comment>
         <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <link rel="stylesheet" href="../650_css/basic__001.css"></link>
         </head>

         <body>
            <xsl:apply-templates select="@*|node()"/>
         </body>

      </html>
   </xsl:template>


   <xsl:template match="tei:annotationBlock">
      <div class="anBlock" id="{@xml:id}"><xsl:apply-templates/></div>
   </xsl:template>

   <xsl:template match="tei:ab">
      <p class="pSimple"><xsl:apply-templates/></p>
   </xsl:template>

   <xsl:template match="tei:cell">
      <td><xsl:apply-templates/></td>
   </xsl:template>

   <xsl:template match="tei:div"><xsl:apply-templates/></xsl:template>

   <xsl:template match="tei:figure">
      <img src="{tei:graphic/@url}" alt="{tei:graphic/@url}"/>
      <div>
         <a href="{tei:head/tei:ref/@target}"><xsl:value-of select="tei:head/tei:ref"/></a>
      </div>
   </xsl:template>

   <xsl:template match="tei:head">
      <xsl:variable name="depth" select="count(ancestor::tei:div)"/>
      <xsl:variable name="sid" select="parent::tei:div/@xml:id"/>
      <xsl:choose>
         <xsl:when test="$depth=1"><h1><xsl:apply-templates/></h1></xsl:when>
         <xsl:when test="$depth=2"><h2><xsl:apply-templates/></h2></xsl:when>
         <xsl:when test="$depth=3"><h3><xsl:apply-templates/></h3></xsl:when>
         <xsl:when test="$depth=4"><h4><xsl:apply-templates/></h4></xsl:when>
         <xsl:when test="$depth=5"><h5><xsl:apply-templates/></h5></xsl:when>
         <xsl:when test="$depth=6"><h6><xsl:apply-templates/></h6></xsl:when>
         <xsl:otherwise><h1><xsl:apply-templates/></h1></xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="tei:hi[@rend = 'contrast']">
      <span class="contrast"><xsl:apply-templates/></span>
   </xsl:template>

   <xsl:template match="tei:hi[@rend = 'red']">
      <span style="color:red"><xsl:apply-templates/></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'blue']">
      <span style="color:blue"><xsl:apply-templates/></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'green']">
      <span style="color:green"><xsl:apply-templates/></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'white_green']">
      <span style="color:white;background:rgb(17, 132, 78); border:0.5px solid black"><b><xsl:apply-templates/></b></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'bold_green']">
      <span style="color:rgb(255,144,33);background:white; border:0.5px solid black"><b><xsl:apply-templates/></b></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'red_white']">
      <span style="color:white;background:rgb(255, 136, 136); border:0.5px solid black"><b><xsl:apply-templates/></b></span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'bold']">
      <b><xsl:apply-templates/></b>
   </xsl:template>
   <xsl:template match="tei:hi[@rend = 'italics']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i><xsl:apply-templates/></i>
   </xsl:template>

   <xsl:template match="tei:item[tei:biblStruct]">
      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="tei:item">
      <li><xsl:apply-templates/></li>
   </xsl:template>

   <xsl:template match="tei:l">
      <xsl:apply-templates/><br/>
   </xsl:template>

   <xsl:template match="tei:lb">
      <br/>
   </xsl:template>

   <xsl:template match="tei:lg">
      <p><xsl:apply-templates/></p>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'ul']">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'ol']">
      <ol>
         <xsl:apply-templates/>
      </ol>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'tocItems' or @type = 'tocItems_sec' or @type = 'tocItems_exercises' ]">
      <table class="{@type}">
         <xsl:for-each select="tei:item">
            <tr>
               <td>
                  <xsl:apply-templates/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'links']">
      <table class="tbLinkItem">
         <xsl:for-each select="tei:item">
            <tr>
               <td class="tdLinkItem">
                  <xsl:value-of select="tei:ref"/>
               </td>
               <td class="tdLinkItem">
                  <a class="aLink"><xsl:attribute name="href">
                        <xsl:value-of select="(root()//@xml:base)[1]"/><xsl:value-of select="tei:ref/@target"/></xsl:attribute>→</a>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'links']/tei:item"/>

   <xsl:template match="tei:p"><p><xsl:apply-templates/></p></xsl:template>

   <xsl:template match="tei:w | tei:seg" xml:space="default">
      <tr>
         <td>
            <a id="{@xml:id}" href="goto:{@xml:id}">
               <xsl:choose>
                  <xsl:when test="@ana"><xsl:attribute name="class">wAssigned</xsl:attribute></xsl:when>
                  <xsl:when test="not(@lemmaRef)"><xsl:attribute name="style">background:red; color:white</xsl:attribute></xsl:when>
                  <xsl:otherwise><xsl:attribute name="class">wTable</xsl:attribute></xsl:otherwise>
               </xsl:choose>
               <xsl:if test="@high">
                  <xsl:attribute name="style">background:red; color:green</xsl:attribute>
               </xsl:if>

               <xsl:value-of select="."/>
               <xsl:choose>
                  <xsl:when test="@rend='withDash'">-</xsl:when>
                  <xsl:when test="not(@join='right')"><span> </span></xsl:when>
               </xsl:choose>
             </a>
        </td>
        <td><xsl:value-of select="@pos"/></td>
        <td><xsl:value-of select="@msd"/></td>
        <td><xsl:value-of select="@n"/></td>
        <td><xsl:value-of select="@lemmaRef"/></td>
      </tr>
   </xsl:template>

   <xsl:template match="tei:pc" xml:space="default">
      <tr><td colspan="4">
      <a id="{@xml:id}" href="goto:{@xml:id}">
         <xsl:if test="@high">
            <xsl:attribute name="style">background:red; color:green</xsl:attribute>
         </xsl:if>

         <xsl:value-of select="."/>
         <xsl:choose>
            <xsl:when test="@rend='withDash'">-</xsl:when>
            <xsl:when test="not(@join='right')"><span> </span></xsl:when>
         </xsl:choose></a>
      </td></tr>
   </xsl:template>

   <xsl:template match="tei:u">
      <table><xsl:apply-templates/></table>
   </xsl:template>

   <xsl:template match="tei:ptr[@type = 'contPointer']">
      <a class="aLink" href="{target}"><span class="spArrow">GOO →</span></a>
   </xsl:template>

   <xsl:template match="tei:ref">
      <xsl:choose>
         <xsl:when test="@target">
            <a href="{@target}">
               <xsl:apply-templates/>
            </a>
         </xsl:when>
         <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="tei:row">
      <tr><xsl:apply-templates/></tr>
   </xsl:template>

   <xsl:template match="tei:spanGrp[@type = 'Translation']">
      <div class="dvTrans" id="{@xml:id}">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template match="tei:table">
      <table><xsl:apply-templates/></table>
   </xsl:template>

   <xsl:template match="tei:note[@type='visible']">
      <span class="note"><xsl:apply-templates/></span>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'embeddedExamples']">
      <table class="embExTable">
         <xsl:for-each select="tei:item">
            <tr class="topLine">
               <td><xsl:apply-templates select="tei:u[@xml:lang='zu']"/>
                  <xsl:text> </xsl:text><i class="exampleTrans"><xsl:apply-templates select="tei:u[@xml:lang = 'en']"/></i>
                  <xsl:if test="string-length(tei:ref)&gt;0">
                     <xsl:text> </xsl:text>[<xsl:apply-templates select="tei:ref"/>]
                  </xsl:if>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <xsl:template match="tei:list[@type = 'examples']">
      <table class="exTable">
         <xsl:for-each select="tei:item">
            <tr class="topLine">
               <td><xsl:apply-templates select="tei:u[@xml:lang='zu']"/>
                  <xsl:text> </xsl:text><i class="exampleTrans"><xsl:apply-templates select="tei:u[@xml:lang = 'en']"/></i>
                  <xsl:if test="string-length(tei:ref)&gt;0">
                     <xsl:text> </xsl:text>[<xsl:apply-templates select="tei:ref"/>]
                  </xsl:if>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <xsl:template match="tei:desc"/>
   <xsl:template match="tei:fs"/>
   <xsl:template match="tei:header"/>
   <xsl:template match="tei:note"/>
   <xsl:template match="tei:label"/>
   <xsl:template match="tei:particDesc"/>
   <xsl:template match="tei:prefixDef/tei:p"/>
   <xsl:template match="tei:title"/>
   <xsl:template match="tei:titleStmt"/>
   <xsl:template match="tei:fileDesc"/>
   <xsl:template match="tei:revisionDesc"/>
   <xsl:template match="tei:sourceDesc"/>
   <xsl:template match="tei:sourceDesc/tei:bibl"/>
   <xsl:template match="tei:teiHeader/tei:fileDesc/tei:author"/>
   <xsl:template match="tei:titleStmt/tei:title"/>
   <xsl:template match="tei:publicationStmt/tei:pubPlace"/>
   <xsl:template match="tei:publicationStmt/tei:date"/>
   <xsl:template match="tei:editionStmt/tei:edition"/>
</xsl:stylesheet>
