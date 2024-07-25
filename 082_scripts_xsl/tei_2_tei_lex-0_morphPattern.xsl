<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Identity transform template: copy all elements and attributes except for gram[type='morphPatternSg'] -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template to skip copying gram[type='morphPatternSg'] elements -->
    <xsl:template match="tei:gram[@type='morphPatternSg']" />
    
    <!-- Template for form elements of type 'lemma' -->
    <xsl:template match="tei:form[@type='lemma']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()[not(self::tei:orth)]"/>
            <xsl:for-each select="tei:orth">
                <xsl:copy-of select="."/>
                <gramGrp>
                    <!-- Copy gram[type='morphPatternSg'] from the ancestor entry element into this gramGrp -->
                    <xsl:copy-of select="ancestor::tei:entry/tei:gramGrp/tei:gram[@type='morphPatternSg']"/>
                </gramGrp>
            </xsl:for-each>
            <xsl:apply-templates select="tei:orth/following-sibling::*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template to skip copying gram[type='morphPatternPl'] elements -->
    <xsl:template match="tei:entry/tei:gramGrp/tei:gram[@type='morphPatternPl']" />
    
    <!-- Template for form elements of type 'inflected' to include gram[type='morphPatternPl'] -->
    <xsl:template match="tei:form[@type='inflected']/tei:gramGrp">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <!-- Retrieve and insert gram[type='morphPatternPl'] after gram[type='number'] -->
            <xsl:for-each select="../../tei:gramGrp/tei:gram[@type='morphPatternPl']">
                <xsl:choose>
                    <xsl:when test="preceding-sibling::tei:gram[@type='number']">
                        <xsl:copy-of select="."/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- If no preceding sibling of type 'number', just copy the element -->
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
   
    
</xsl:stylesheet>


    

