<?xml version="1.0" encoding="UTF-8"?>
<!--2022-07-05T17:45:28.580756+02:00-->
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xtoks="http://acdh.oeaw.ac.at/xtoks"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="#all"
                version="2.0">
   <xsl:output method="xml" indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:template match="/" mode="pp1">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="node() | @*" mode="pp1">
      <xsl:copy>
         <xsl:apply-templates select="node() | @*" mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="tei:seg[xtoks:w|xtoks:pc]" mode="pp1">
      <xsl:call-template name="groupTokenParts"/>
   </xsl:template>
   <xsl:template match="*[not(self::tei:seg)][xtoks:w]" mode="pp1">
      <xsl:copy>
         <xsl:apply-templates select="@*" mode="#current"/>
         <xsl:call-template name="groupTokenParts"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template name="groupTokenParts">
      <xsl:for-each-group group-starting-with="xtoks:ws" select="node()">
         <xsl:variable name="first-is-ws" select="exists(current-group()[1]/self::xtoks:ws)"/>
         <xsl:variable name="last-is-pc"
                       select="exists(current-group()[last()]/self::xtoks:pc)"/>
         <xsl:choose>
                        <!-- first token = ws, last token = pc > fetch all in between into group -->
            <xsl:when test="$first-is-ws and $last-is-pc">
               <xsl:choose>
                                <!-- let's count how many parts except the first and the last are left -->
                                <!-- if there are more then 1, then wrap them ... -->
                  <xsl:when test="count(current-group())-2 gt 1">
                     <xsl:variable name="parts-in-between"
                                   select="current-group()[position() gt 1][not(. is current-group()[last()])]"/>
                     <xsl:apply-templates select="current-group()[1]" mode="pp1"/>
                     <tei:seg type="token">
                        <xsl:for-each select="$parts-in-between">
                           <xsl:apply-templates select="." mode="pp1">
                              <xsl:with-param tunnel="yes"
                                              name="join"
                                              select="if (exists(following-sibling::*) and not(following-sibling::*[1]/self::xtoks:ws)) then 'right' else ''"/>
                           </xsl:apply-templates>
                        </xsl:for-each>
                     </tei:seg>
                     <xsl:apply-templates select="current-group()[last()]" mode="pp1"/>
                  </xsl:when>
                  <!-- .. otherwise, don't wrap them -->
                  <xsl:otherwise>
                     <xsl:apply-templates select="current-group()" mode="pp1"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <!-- first token != ws, last token = pc  -->
            <xsl:when test="not($first-is-ws) and $last-is-pc">
               <xsl:choose>
                  <xsl:when test="count(current-group() except current-group()[last()]) gt 1">
                     <tei:seg type="token">
                        <xsl:for-each select="current-group()[position() lt count(current-group())]">
                           <xsl:apply-templates select="." mode="pp1">
                              <xsl:with-param tunnel="yes"
                                              name="join"
                                              select="if (exists(following-sibling::*) and not(following-sibling::*[1]/self::xtoks:ws)) then 'right' else ''"/>
                           </xsl:apply-templates>
                        </xsl:for-each>
                     </tei:seg>
                     <xsl:apply-templates select="current-group()[last()]" mode="pp1"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="current-group()" mode="pp1"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <!-- first token = ws, last token != pc -->
            <xsl:when test="$first-is-ws and not($last-is-pc)">
               <xsl:choose>
                  <xsl:when test="count(current-group()[position() gt 1]) gt 1">
                     <xsl:apply-templates select="current-group()[1]" mode="pp1"/>
                     <tei:seg type="token">
                        <xsl:for-each select="current-group()[position() gt 1]">
                           <xsl:apply-templates select="." mode="pp1">
                              <xsl:with-param tunnel="yes"
                                              name="join"
                                              select="if (exists(following-sibling::*) and not(following-sibling::*[1]/self::xtoks:ws)) then 'right' else ''"/>
                           </xsl:apply-templates>
                        </xsl:for-each>
                     </tei:seg>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="current-group()" mode="pp1"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                  <xsl:when test="count(current-group()) gt 1">
                     <tei:seg type="token">
                        <xsl:for-each select="current-group()">
                           <xsl:apply-templates select="." mode="pp1">
                              <xsl:with-param tunnel="yes" name="join">
                                 <xsl:if test="exists(following-sibling::*[not(self::xtoks:ws)]) and not(following-sibling::*[1]/self::xtoks:ws)">right</xsl:if>
                              </xsl:with-param>
                           </xsl:apply-templates>
                        </xsl:for-each>
                     </tei:seg>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="current-group()" mode="pp1"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each-group>
   </xsl:template>
   <xsl:template match="xtoks:w[exists(following-sibling::*) and not(following-sibling::*[1]/self::xtoks:ws)]"
                 mode="pp1">
      <xsl:copy>
         <xsl:copy-of select="@* except @xml:id"/>
         <xsl:attribute name="xtoks:id"
                        select="concat(root()//tei:title[@level ='a'],'_',@xtoks:id)"/>
         <xsl:attribute name="join">right</xsl:attribute>
         <xsl:if test="following-sibling::*[1]/self::xtoks:pc[. = '-']">
            <xsl:attribute name="rend">withDash</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="xtoks:w" mode="pp1">
      <xsl:param tunnel="yes" name="join"/>
      <xsl:copy>
         <xsl:copy-of select="@* except @xtoks:id"/>
         <xsl:if test="$join != ''">
            <xsl:attribute name="join" select="$join"/>
         </xsl:if>
         <xsl:attribute name="xtoks:id"
                        select="concat(root()//tei:title[@level ='a'],'_',@xtoks:id)"/>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="xtoks:pc[.='-']" mode="pp1"/>
</xsl:stylesheet>
