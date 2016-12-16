<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
    <head><title>People in Brush Creek Section I</title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>        
        <body><xsl:comment>#include virtual="menu.shtml"</xsl:comment>
            <h1>People in Brush Creek Section I</h1>
            
               <xsl:apply-templates select="//body"/> 
                
            
            
        </body>    
            
        </html>
        
    </xsl:template>
    <xsl:template match="listPerson">
        <h2><xsl:text>Lot Number </xsl:text><xsl:value-of select="tokenize(@xml:id, 'o')[last()]"/></h2>
        <!--ebb: You'll want to look up how to split this and grab just the digits in the @xml:id. -->
        
        <table class="occupants">
           
            <tr>
                <th>Grave Marker</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Birth</th>
                <th>Death</th>
                <th>Age</th>
                <th>Settlement</th>
                <th>Cause of Death</th>
                <th>Burial Information</th>
                <th>Ethnicity</th>
               
            </tr>
            <xsl:apply-templates select="person[not(@role='owner')]"/> 
        </table>
    </xsl:template>
    <xsl:template match="person">
        <tr id="{@xml:id}">
            <td><a href="{graphic/@url}" target="_blank"><img class="tn" src="{graphic/@url}" alt="image of grave"/></a></td>    
            <td><xsl:apply-templates select="descendant::forename[@type='first']"/><xsl:text> </xsl:text><xsl:for-each select="descendant::forename[@type='middle']"><xsl:apply-templates select="current()"/><xsl:text> </xsl:text>
            </xsl:for-each>
                <xsl:for-each select="descendant::surname"><xsl:apply-templates select="current()"/><xsl:text> </xsl:text></xsl:for-each>
            </td>
            <td><xsl:choose>
                <xsl:when test="@sex='f'"><xsl:text>Female</xsl:text></xsl:when>
                <xsl:when test="@sex='m'"><xsl:text>Male</xsl:text>
                </xsl:when>
                <xsl:when test="@sex='na'"><xsl:text>N/A</xsl:text>
                </xsl:when>
                <xsl:when test="@sex='u'"><xsl:text>Unknown</xsl:text>
                </xsl:when>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="birth/@when"><xsl:apply-templates select="birth/@when"/></xsl:when>
            <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="death/@when"><xsl:apply-templates select="death/@when"/></xsl:when>
                <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="age"><xsl:apply-templates select="age"/></xsl:when>
                <xsl:otherwise>Unmarked
                <!--ebb: You know, you really should try calculating this by subtracting birth year from death year where present (if present). -->
                </xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="death/placeName"><xsl:value-of select="string-join(death/placeName/*, ', ')"/></xsl:when>
                <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="death/note"><xsl:apply-templates select="death/note"/></xsl:when>
                <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="event">
              
                <xsl:for-each select="event">  <xsl:apply-templates select="@type"/><xsl:text> </xsl:text><xsl:apply-templates select="@when"/>
            <xsl:if test="desc/text()">
                <xsl:text>: </xsl:text><xsl:value-of select="desc"/>
            </xsl:if>
                <xsl:if test="note">
              <xsl:text>, </xsl:text><xsl:value-of select="note/@type"/><xsl:text>: </xsl:text><xsl:value-of select="note"/>
                </xsl:if><xsl:text> </xsl:text></xsl:for-each>
                
                
            </xsl:when>
                <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
            <td><xsl:choose><xsl:when test="trait"><xsl:apply-templates select="trait/label"/></xsl:when>
                <xsl:otherwise>Unmarked</xsl:otherwise>
            </xsl:choose></td>
          
        </tr>
  
    </xsl:template>
    
    
</xsl:stylesheet>