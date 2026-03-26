<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0" xml:space="preserve" version="1.0">
   <xsl:output method="html"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <style type="text/css">
               body {
               <xsl:choose>
                  <xsl:when test="//fs/f/symbol[@value='released'] | //fs/f/symbol[@value='released']">background: rgb(179,253,157);</xsl:when>
                  <xsl:otherwise>background: white;</xsl:otherwise>
               </xsl:choose>
               font-size:{fontsize};
               }

               table { border-collapse: collapse;background: white;font-size:{fontsize};}

               td {
               border: 1px solid black;
               padding-left: 5px;
               vertical-align: top;
               }
               
               .dvExamples {
               border: 1px solid black;
               background: rgb(210,210,255);
               }

               .dvArguments {
               border: 1px solid black;
               background: rgb(210,210,255);
               }

               .dvUsg {
               color: green;
               font-style: italic;
               }

               .tdHead {
               font-weight: bold;
               color: white;
               background: blue;
               padding-right: 5px;
               width: 100px;
               }

               .tdSenseHead {
               font-weight: bold;
               font-style: italic;
               color: blue;
               background: rgb(181,213,251);
               padding-right: 5px;
               width: 100px;
               text-align: right;
               }

               .tdSense {
               background: rgb(248,234,255);
               border-style: dotted;
               }

               .gramGrp {
               color: rgb(255,128,0);
               font-weight: bold;
               }

               .spArab {
               direction:rtl;
               }
               
               .spEn {
                 color: blue;
               }

               .spTr {
                 color: red;
               }

               .spDe {
                 color: black;
               }

               .spEs {
                 color: green;
               }

               .spPlaceName {
               font-style: italic;
               color: green;
               }

               .spExTransDe {padding:30px;font-style: italic;color: rgb(180,180,180);}
               .spExTransEn {padding:30px;font-style: italic;color: blue;}
               .spExTransTr {padding:30px;font-style: italic;color: green;}
               .spExTransFr {padding:30px;font-style: italic;color: orange;}

               .spDef {
               font-style: italic;
               color: green;
               }
               
               .spGloss {
                  color:green;
                  font-style: italic;
               }

               .spTransEn {
               direction: rtl;
               font-style: italic;
               color: blue;
               }

               .spTransDe {
               font-style: italic;
               color: rgb(160,160,160);
               }

               .spMorphPattern {
                  border: 1px solid red;
                  background:rgb(230,230,230);
                  margin-left:10px;
                  font-style: italic;
                  padding-left: 5px;
                  padding-right: 5px;
               }

               .spPlace {
               color: green;
               }

               .spSource {
                  border: 1px solid red;
                  background:rgb(230,230,230);
                  margin-left:10px;
                  font-style: italic;
                  padding-left: 5px;
                  padding-right: 5px;
               }

               .spTribe {
               color: blue;
               }

               .spTransTr {
               font-style: italic;
               color: green;
               }

               .iTransEn {
               font-style: italic;
               color: green;
               }

               .iTransDe {
               font-style: italic;
               color: purple;
               }

               .spSenseGram { border:1px solid green; font-style: italic; color: green; background: rgb(230,230,230);
               padding-left:5px}
            </style>
         </head>

         <body>
             <div><xsl:value-of select="//@xml:id"/></div>
            <!--*************************************************************-->
            <!--** ERROR MESSAGES *******************************************-->
            <!--*************************************************************-->
            <xsl:variable name="warningStyle">background:red;color:white;font-weight:bold</xsl:variable>

            <xsl:if test="//entry
                              [.//gram[@type='pos'][.='noun']]
                              [not(form[@type='lemma']/gramGrp/gram[@type='morphPattern'])]"><span style="{$warningStyle}">
              Missing "morphPattern in lemma"</span></xsl:if>
            <xsl:if test="//form
                              [gramGrp/gram[@type='number']='plural']
                              [not(gramGrp/gram[@type='morphPattern'])]"><span style="{$warningStyle}">
              Missing "morphPattern in form"</span></xsl:if>
            <xsl:if test="//sense/cit[not(@type='translation') and not(@type='example')]/quote">
               <span style="{$warningStyle}">cit/quote not allowed in lex0!!!</span><br/>
            </xsl:if>
            <xsl:for-each select="//orth">
               <xsl:if test="string-length(.)=0">
                  <span style="{$warningStyle}">Orth should not be empty</span><br/>
               </xsl:if>
            </xsl:for-each>
            <xsl:if test="//entry/form[@type='variant'] | //entry/form[@type='variant'] ">
               <span style="{$warningStyle}">Variants must be nested!!!</span><br/>
            </xsl:if>
            <xsl:if test="//@ana">
               <span style="{$warningStyle}">No @ana's allowed!!!</span><br/>
            </xsl:if>
            <xsl:if test="//sense[not(@xml:id)]">
               <span style="{$warningStyle}">Missing xml:id!!!</span><br/>
            </xsl:if>
            <xsl:if test="not(//gram[@type='synRoot']) and //entry">
               <span style="{$warningStyle}">No synRoot</span><br/>
            </xsl:if>
            <xsl:if test="not(//gram[@type='diaRoot']) and //entry">
               <span style="{$warningStyle}">No diaRoot</span><br/>
            </xsl:if>
            <xsl:if test="string-length(//gram[@type='pos'])&lt;1 and //entry">
               <span style="{$warningStyle}">No pos</span><br/>
            </xsl:if>


            <xsl:if test="//fs/symbol[@value='released']">
               <xsl:attribute name="style">background: rgb(179,253,157)</xsl:attribute>
            </xsl:if>


            <xsl:for-each select="cit">
               <table width="2000px">
                  <xsl:if test="//usg/name">
                     <tr><td>Placename: <xsl:value-of select="usg/name"/></td></tr>
                  </xsl:if>

                  <tr>
                     <td>
                        <xsl:apply-templates select="quote"/>
                        <xsl:if test="@subtype='proverb'"> (prov.)</xsl:if>
                     </td>
                  </tr>

                  <xsl:for-each select="cit[@type='translation']">
                     <tr>
                        <td>
                           <i><xsl:apply-templates/><xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if></i>
                        </td>
                     </tr>
                  </xsl:for-each>

                  <xsl:for-each select="cit[@type='litTranslation' ]">
                     <tr>
                        <td>
                           <i>Lit.: </i>
                             <span class="spTrans"><xsl:apply-templates/><xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if></span>
                        </td>
                     </tr>
                  </xsl:for-each>

               </table>
            </xsl:for-each>

            <xsl:for-each select="entry">
               <table width="600px">
                  <xsl:for-each select="form[@type='lemma']">
                     <tr>
                        <td class="tdHead">Lemma</td>
                        <td>
                           <xsl:value-of select="orth"/>

                           <!-- ************************************************* -->
                           <!-- PLACE ******************************************* -->
                           <!-- ************************************************* -->
                           <xsl:if test="usg/name">
                              <span class="spPlaceName">
                                 (<xsl:for-each select="usg/name">
                                    <xsl:if test="position()!=1">, </xsl:if>
                                    <xsl:if test="@type='place'"><span class="spPlace"><xsl:value-of select="."/></span></xsl:if>
                                    <xsl:if test="@type='tribe'"><span class="spTribe"><xsl:value-of select="."/></span></xsl:if>
                                 </xsl:for-each>)
                              </span>
                           </xsl:if>

                           <!-- morphPattern ********************************-->
                           <xsl:if test="gramGrp/gram[@type='morphPattern']">
                              <span class="spMorphPattern"><b>morphPattern: </b>
                                 <xsl:value-of select="gramGrp/gram[@type='morphPattern']"/>
                              </span>
                           </xsl:if>

                           <xsl:for-each select="form[@type='variant']">
                              <br/>
                              <xsl:if test="orth">
                                <span class="trans"><xsl:value-of select="orth"/></span></xsl:if>
                              [var.]

                              <!-- geographic ********************************-->
                              <xsl:if test="usg[@type='geographic']/name">
                                <span class="spPlaceName">
                                   (<xsl:for-each select="usg/name">
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:if test="@type='place'"><span class="spPlace"><xsl:value-of select="."/></span></xsl:if>
                                      <xsl:if test="@type='tribe'"><span class="spTribe"><xsl:value-of select="."/></span></xsl:if>
                                   </xsl:for-each>)
                                </span>
                              </xsl:if>

                              <!-- morphPattern ********************************-->
                              <xsl:if test="gramGrp/gram[@type='morphPattern']">
                                 <span class="spMorphPattern"><b>morphPattern: </b>
                                    <xsl:value-of select="gramGrp/gram[@type='morphPattern']"/>
                                 </span>
                              </xsl:if>

                              <!-- SOURCE ********************************-->
                              <xsl:if test="@source">
                                 <span class="spSource">
                                    <xsl:variable name="sid" select="substring-after(@source, '#')"/>
                                    <xsl:value-of select="//bibl[@xml:id=$sid]/title/@ref"/>, <xsl:value-of select="//bibl[@xml:id=$sid]/biblScope"/>
                                 </span>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>

                     <xsl:if test="string-length(//gram[@type='pos'])">
                        <tr>
                           <td class="tdHead">POS</td>
                           <td>
                              <xsl:value-of select="//entry/gramGrp/gram[@type='pos']"/>
                              <xsl:if test="//entry/gramGrp/gram[@type='subc'] | //entry/gramGrp/gram[@type='inflectionType']">
                                 [<xsl:value-of select="//entry/gramGrp/gram[@type='subc'] | //entry/gramGrp/gram[@type='inflectionType']"/>]
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:if>

                     <xsl:if test="//gram[@type='synRoot' or @type='diaRoot' or @type='root']">
                        <tr>
                           <td class="tdHead">Root</td>
                           <td>
                              <xsl:for-each select="//gram[@type='synRoot' or @type='diaRoot' ]">
                                 <xsl:if test="position()!=1">, </xsl:if>
                                 <xsl:if test="@type='diaRoot'"><xsl:value-of select="."/> (diaRoot)</xsl:if>
                                 <xsl:if test="@type='synRoot'"><xsl:value-of select="."/> (synRoot)</xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                  </xsl:for-each>

                  <xsl:for-each select="form[@type='inflected'] ">
                     <tr>
                        <td class="tdHead">Infl.</td>
                        <td class="tdTrans">
                           <xsl:if test="orth"><xsl:value-of select="orth"/></xsl:if>  
                            <xsl:if test="usg/name">
                              <span class="spPlaceName">
                                 (<xsl:for-each select="usg/name">
                                    <xsl:if test="position()!=1">, </xsl:if>
                                    <xsl:if test="@type='place'"><span class="spPlace"><xsl:value-of select="."/></span></xsl:if>
                                    <xsl:if test="@type='tribe'"><span class="spTribe"><xsl:value-of select="."/></span></xsl:if>
                                 </xsl:for-each>)
                              </span>
                            </xsl:if>

                           [<xsl:for-each select="gramGrp/gram[@type!='morphPattern']"><span class="gramGrp"><xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if><xsl:value-of select="."/></span></xsl:for-each>]

                           <!-- morphPattern ********************************-->
                           <xsl:if test="gramGrp/gram[@type='morphPattern']">
                              <span class="spMorphPattern"><b>morphPattern: </b>
                                 <xsl:value-of select="gramGrp/gram[@type='morphPattern']"/>
                              </span>
                           </xsl:if>

                           <xsl:if test="usg/placeName">
                              <span class="spPlaceName"> (<xsl:value-of select="usg/placeName"/>)</span>
                           </xsl:if>
                           <xsl:for-each select="form[@type='variant']">
                              <br/>
                              <xsl:if test="orth"><span class="trans"><xsl:value-of select="orth"/></span></xsl:if>
                              [var.]
                              <xsl:if test="usg/name">
                                <span class="spPlaceName">
                                   (<xsl:for-each select="usg/name">
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:if test="@type='place'"><span class="spPlace"><xsl:value-of select="."/></span></xsl:if>
                                      <xsl:if test="@type='tribe'"><span class="spTribe"><xsl:value-of select="."/></span></xsl:if>
                                   </xsl:for-each>)
                                </span>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:for-each>

                  <!-- ***************************************************** -->
                  <!-- SENSE *********************************************** -->
                  <!-- ***************************************************** -->
                  <xsl:for-each select="sense">
                     <tr>
                        <td class="tdSenseHead">
                           <xsl:if test="count(//sense)&gt;1">
                              <xsl:value-of select="position()"/>
                           </xsl:if>
                        </td>
                        <td class="tdSense">
                           <xsl:if test="gramGrp">
                              <span class="spSenseGram">
                                 <xsl:for-each select="gramGrp/gram">
                                    <xsl:value-of select="."/> (<xsl:value-of select="@type"/>)
                                 </xsl:for-each>
                              </span><br/>
                           </xsl:if>
                           <xsl:for-each select="def">
                              <div class="dvDef">
                                 <xsl:choose>
                                    <xsl:when test="@xml:lang='de'"><span class="spDefGerm">(<xsl:value-of select="."/>)</span></xsl:when>
                                    <xsl:when test="@xml:lang='tr'"><span class="spDefTurk">(<xsl:value-of select="."/>)</span></xsl:when>
                                    <xsl:otherwise><span class="spDef">(<xsl:value-of select="."/>)</span></xsl:otherwise>
                                 </xsl:choose>
                              </div>
                           </xsl:for-each>

                           <!-- ENGLISH trans-->
                           <xsl:if test="cit[@type='translationEquivalent'][form/orth[@xml:lang='en']]">
                             <div class="dvDef">
                                <xsl:for-each select="cit[@type='translationEquivalent'][form/orth[@xml:lang='en']]">
                                   <span class="spEn">                                     
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:value-of select="form/orth"/>
                                         <xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if>
                                         <xsl:if test="gloss"><span class="spGloss"> (<xsl:value-of select="gloss"/>) </span></xsl:if>

                                      <!-- SOURCE ********************************-->
                                      <xsl:if test="@source">
                                         <span class="spSource">
                                            <xsl:variable name="sid" select="substring-after(@source, '#')"/>
                                            <xsl:value-of select="//bibl[@xml:id=$sid]/title/@ref"/>, <xsl:value-of select="//bibl[@xml:id=$sid]/biblScope"/>
                                         </span>
                                      </xsl:if>
                                   </span>
                                </xsl:for-each>                             
                             </div>
                           </xsl:if>

                           <xsl:if test="cit[@type='translationEquivalent'][form/orth[@xml:lang='de']]">
                             <div class="dvDef">
                                <xsl:for-each select="cit[@type='translationEquivalent'][form/orth[@xml:lang='de']]">
                                   <span class="spDe">                                     
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:value-of select="form/orth"/>
                                         <xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if>
                                         <xsl:if test="gloss"><span class="spGloss"> (<xsl:value-of select="gloss"/>) </span></xsl:if>

                                      <!-- SOURCE ********************************-->
                                      <xsl:if test="@source">
                                         <span class="spSource">
                                            <xsl:variable name="sid" select="substring-after(@source, '#')"/>
                                            <xsl:value-of select="//bibl[@xml:id=$sid]/title/@ref"/>, <xsl:value-of select="//bibl[@xml:id=$sid]/biblScope"/>
                                         </span>
                                      </xsl:if>
                                   </span>
                                </xsl:for-each>                             
                             </div>
                           </xsl:if>


                           <xsl:if test="cit[@type='translationEquivalent'][form/orth[@xml:lang='tr']]">
                             <div class="dvDef">
                                <xsl:for-each select="cit[@type='translationEquivalent'][form/orth[@xml:lang='tr']]">
                                   <span class="spTr">
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:value-of select="form/orth"/>
                                         <xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if>
                                         <xsl:if test="gloss"><span class="spGloss"> (<xsl:value-of select="gloss"/>) </span></xsl:if>

                                      <!-- SOURCE ********************************-->
                                      <xsl:if test="@source">
                                         <span class="spSource">
                                            <xsl:variable name="sid" select="substring-after(@source, '#')"/>
                                            <xsl:value-of select="//bibl[@xml:id=$sid]/title/@ref"/>, <xsl:value-of select="//bibl[@xml:id=$sid]/biblScope"/>
                                         </span>
                                      </xsl:if>
                                   </span>
                                </xsl:for-each>
                             </div>
                           </xsl:if>

                           <xsl:if test="cit[@type='translationEquivalent'][form/orth[@xml:lang='fr']]">
                             <div class="dvDef">
                                <xsl:for-each select="cit[@type='translationEquivalent'][form/orth[@xml:lang='fr']]">
                                   <span class="spFr">
                                      <xsl:if test="position()!=1">, </xsl:if>
                                      <xsl:value-of select="form/orth"/>
                                         <xsl:if test="usg"> (<xsl:value-of select="usg"/>)</xsl:if>
                                         <xsl:if test="gloss"><span class="spGloss"> (<xsl:value-of select="gloss"/>) </span></xsl:if>

                                      <!-- SOURCE ********************************-->
                                      <xsl:if test="@source">
                                         <span class="spSource">
                                            <xsl:variable name="sid" select="substring-after(@source, '#')"/>
                                            <xsl:value-of select="//bibl[@xml:id=$sid]/title/@ref"/>, <xsl:value-of select="//bibl[@xml:id=$sid]/biblScope"/>
                                         </span>
                                      </xsl:if>
                                   </span>
                                </xsl:for-each>
                             </div>
                           </xsl:if>


                           <xsl:for-each select="xr/cit[@type='example'] | xr/tei:cit[@type='example'] ">
                              <div class="dvExamples" >
                                 <xsl:choose>
                                    <xsl:when test="@type='example' and @subtype='proverb'">
                                       <span class="spProverb"><b>Prov.: </b><xsl:apply-templates select="quote | tei:quote"/><i class="iTrans">
                                         <xsl:value-of select="tei:cit[@xml:lang='en']/quote | tei:cit[@xml:lang='en']/tei:quote"/><xsl:value-of select="tei:cit[@xml:lang='en']/tei:quote"/></i></span></xsl:when>

                                    <xsl:when test="@type='example'">
                                       <xsl:if test="not(tei:fs/tei:f/tei:symbol[@value='released']) and not(tei:fs/tei:f/tei:symbol[@value='released'])"><b style="color:red">Not released: </b></xsl:if>
                                       <span class="spExample"><xsl:apply-templates select="tei:quote"/><i class="iTrans">  <xsl:value-of select="tei:cit/tei:quote[@xml:lang='en'] | tei:cit/tei:quote[@xml:lang='en']"/></i></span></xsl:when>

                                 </xsl:choose>
                              </div>
                           </xsl:for-each>

                            <!-- geographic ********************************-->
                            <xsl:if test="usg[@type='geographic']/name">
                              <span class="spPlaceName">
                                 (<xsl:for-each select="usg/name">
                                    <xsl:if test="position()!=1">, </xsl:if>
                                    <xsl:if test="@type='place'"><span class="spPlace"><xsl:value-of select="."/></span></xsl:if>
                                    <xsl:if test="@type='tribe'"><span class="spTribe"><xsl:value-of select="."/></span></xsl:if>
                                 </xsl:for-each>)
                              </span>
                            </xsl:if>

                           <xsl:for-each select="usg[@type!='geographic']">
                              <div class="dvUsg"><xsl:value-of select="."/></div>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:for-each> <!--end of sense -->

                  <tr>
                     <td class="tdHead">Editors</td>
                     <td>
                        <xsl:for-each select="//entry/fs | //cit/fs">
                           <xsl:value-of select="f[@name='who']/symbol/@value"/> (<xsl:value-of select="@type"/>):
                           <xsl:value-of select="f[@name='when']/symbol/@value"/>
                           <xsl:if test="f[@name='status']">
                              <xsl:text> (</xsl:text><xsl:value-of select="f[@name='status']/symbol/@value"/>)
                           </xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </xsl:for-each>

            <!-- Paradigms -->
            <xsl:if test="//w[@msd]">
            <h3>Perf.</h3>
           <table>
              <tr><td></td><td>Sg.</td><td>Pl.</td></tr>
              <tr>
                 <td>1.</td>
                 <td><xsl:value-of select="//w[@msd='pf.1.sg.']"/></td>
                 <td><xsl:value-of select="//w[@msd='pf.1.pl.']"/></td>
              </tr>
              <tr>
                 <td>2.m.</td>
                 <td><xsl:value-of select="//w[@msd='pf.2.m.sg.']"/></td>
                 <td><xsl:value-of select="//w[@msd='pf.2.m.pl.']"/></td>
              </tr>
              <tr>
                 <td>2.f.</td>
                 <td><xsl:value-of select="//w[@msd='pf.2.f.sg.']"/></td>
                 <td><xsl:value-of select="//w[@msd='pf.2.f.pl.']"/></td>
              </tr>
              <tr>
                 <td>3.m.</td>
                 <td><xsl:value-of select="//w[@msd='pf.3.m.sg.']"/></td>
                 <td><xsl:value-of select="//w[@msd='pf.3.m.pl.']"/></td>
              </tr>
              <tr>
                 <td>3.f.</td>
                 <td><xsl:value-of select="//w[@msd='pf.3.f.sg.']"/></td>
                 <td><xsl:value-of select="//w[@msd='pf.3.f.pl.']"/></td>
              </tr>
           </table>

            <h3>Imperf.</h3>
              <table>
                <tr><td></td><td>Sg.</td><td>Pl.</td></tr>
                <tr>
                   <td>1.</td>
                   <td><xsl:value-of select="//w[@msd='impf.1.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='impf.1.pl.']"/></td>
                </tr>
                <tr>
                   <td>2.m.</td>
                   <td><xsl:value-of select="//w[@msd='impf.2.m.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='impf.2.m.pl.']"/></td>
                </tr>
                <tr>
                   <td>2.f.</td>
                   <td><xsl:value-of select="//w[@msd='impf.2.f.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='impf.2.f.pl.']"/></td>
                </tr>
                <tr>
                   <td>3.m.</td>
                   <td><xsl:value-of select="//w[@msd='impf.3.m.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='impf.3.m.pl.']"/></td>
                </tr>
                <tr>
                   <td>3.f.</td>
                   <td><xsl:value-of select="//w[@msd='impf.3.f.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='impf.3.f.pl.']"/></td>
                </tr>
             </table>

            <h3>Imper.</h3>
              <table>
                <tr><td></td><td>Sg.</td><td>Pl.</td></tr>
                <tr>
                   <td>m.</td>
                   <td><xsl:value-of select="//w[@msd='imp.m.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='imp.m.pl.']"/></td>
                </tr>
                <tr>
                   <td>f.</td>
                   <td><xsl:value-of select="//w[@msd='imp.f.sg.']"/></td>
                   <td><xsl:value-of select="//w[@msd='imp.f.pl.']"/></td>
                </tr>
                </table>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
