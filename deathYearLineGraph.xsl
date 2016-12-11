<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

    <!--GLOBAL VARIABLES-->
    <xsl:variable name="graveyardFile" select="document('graveyardInfo-TEI.xml')"/>
    <xsl:variable name="numPeople" select="count(//person[@role = 'occupant'])"/>
    <xsl:variable name="allYears"
        select="//person[@role = 'occupant']//death/tokenize(@when, '-')[1]"/>
    <xsl:variable name="minYear"
        select="number(min(//person[@role = 'occupant']//death/tokenize(@when, '-')[1]))"/>
    <xsl:variable name="maxYear"
        select="number(max(//person[@role = 'occupant']//death/tokenize(@when, '-')[1]))"/>
    <xsl:variable name="distinctYears"
        select="distinct-values(//person[@role = 'occupant']//death/tokenize(@when, '-')[1])"/>
    <xsl:variable name="oneYearPeopleCount"
        select="count(//person[@role = 'occupant'][death/tokenize(@when, '-')[1] = '1911'])"/>
    <xsl:variable name="xSpacer" select="20"/>
    <xsl:variable name="ySpacer" select="20"/>
    <xsl:variable name="X-decade" select="floor((($maxYear - $minYear) div 10))"/>

    <xsl:template match="/">

        <svg width="1000" height="1000">

            <g transform="translate(100 250)">

                <!--X-AXIS-->
                <line x1="0" y1="0" x2="{($maxYear - $minYear)}" y2="0" stroke="black"
                    stroke-width="1"/>
                <!--Y-AXIS-->
                <line x1="0" y1="-{7 * $ySpacer}" x2="0" y2="0" stroke="black" stroke-width="1"/>

                <!-- DOTS -->
                <xsl:for-each select="$distinctYears">
                    <xsl:sort/>
                    <xsl:variable name="xPos" select="xs:integer($maxYear) - xs:integer(current())"/>
                    <xsl:variable name="yearCount"
                        select="count($graveyardFile//person//death[tokenize(@when, '-')[1] = tokenize(current(), '-')[1]])"/>
                    
                    
                    <circle fill="red" r="5" cx="{$xPos}" cy="-{$yearCount * $ySpacer}"/>
                    <text x="{$xPos}" y="{-($yearCount * $ySpacer) - 5}">
                        <xsl:value-of select="current()"/>
                    </text>
                </xsl:for-each>

                <!-- X-AXIS MARKS (DECADES) -->
                <xsl:for-each select="1 to 11">
                    <xsl:choose>
                        <xsl:when test="current() lt 10">
                            <text x="{current() * $xSpacer}" y="10" text-anchor="middle">
                                <xsl:text>19</xsl:text>
                                <xsl:value-of select="current()"/>
                                <xsl:text>0</xsl:text>
                            </text>
                        </xsl:when>
                        <xsl:when test="current() eq 10">
                            <text x="{current() * $xSpacer}" y="10" text-anchor="middle">
                                <xsl:value-of select="current() * 20"/>
                                <xsl:text>0</xsl:text>
                            </text>
                        </xsl:when>
                        <xsl:otherwise>
                            <text x="{current() * $xSpacer}" y="10" text-anchor="middle">
                                <xsl:text>20</xsl:text>
                                <xsl:value-of select="current() - 1"/>
                            </text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>

                <!-- Y-AXIS MARKS (# OF DEATHS) -->
                <xsl:for-each select="1 to 6">
                    <text x="-10" y="-{current() * $ySpacer}" text-anchor="middle">
                        <xsl:value-of select="current()"/>
                    </text>
                </xsl:for-each>



            </g>
        </svg>

        <!--NOT WORKING:
            
            <xsl:for-each-group select="descendant::person[@role = 'occupant']//death" group-by="descendant::person[@role = 'occupant']//death/tokenize(@when, '-')[1]">
            
            <xsl:for-each select="current-grouping-key()">
                <xsl:comment><xsl:value-of select="current-grouping-key()"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="count(person//death[tokenize(@when, '-')[1] eq current-grouping-key()])"/>
            </xsl:comment>
            </xsl:for-each>
        </xsl:for-each-group>
        -->

    </xsl:template>
















    <!-- <xsl:variable name="xSpacer" select="100"/>
    <xsl:variable name="maxXVAL" select="$numChapters * $xSpacer"/>
    <xsl:variable name="maxSpeeches" select="max(//chapter//count(descendant::q[@sp='alice']))"/>
    <xsl:variable name="ySpacer" select="10"/>
    <xsl:variable name="maxYVAL" select="$maxSpeeches * $ySpacer"/>-->


    <!--<svg width="100%" height="100%">
            
            <g transform="translate(50 750)">
                
                <line x1="30" y1="-10" x2="{$maxXVAL + $xSpacer}" y2="-10" stroke="black" stroke-width="1"/>
                
                <line x1="30" y1="-10" x2="30" y2="{-$maxYVAL - 100}" stroke="black" stroke-width="1"/>
                
                <xsl:for-each select="1 to 7">
                    <xsl:variable name="yAxis_HashLocation" select=".*100"/>
                    <xsl:variable name="yAxis_HashName" select=". *10"/>
                    <text x="15" y="{-$yAxis_HashLocation}">
                        <xsl:value-of select="$yAxis_HashName"/>
                    </text>
                    
                    <line x1="30" x2="{$maxXVAL + $xSpacer}" y1="{-$yAxis_HashLocation}" y2="{-$yAxis_HashLocation}" stroke="green" stroke-width=".5" stroke-dasharray="10"/>
                    
                </xsl:for-each>
                
                <xsl:for-each select="descendant::chapter">
                    <xsl:variable name="Xpos" select="@which * $xSpacer"/>
                    <xsl:variable name="Ypos" select="count(descendant::q[@sp='alice']) * $ySpacer"/>
                    <xsl:variable name="Ypos2" select="following::chapter[1]/count(.//q[@sp='alice']) *$ySpacer"/>
                    
                    <text x="{$Xpos}" y="15" text-anchor="end" transform="rotate(-45 {$Xpos}, 15)">
                        Ch. <xsl:value-of select="@which"/>
                    </text>
                    <circle cx="{$Xpos}" cy="{-$Ypos}" r="5" fill="red"/>
                    
                    <xsl:if test="following::chapter[1]">
                        <line x1="{$Xpos}" y1="{-$Ypos}" x2="{(@which +1) * $xSpacer}" y2="{-$Ypos2}" stroke="red" stroke-width="1" />
                    </xsl:if>>
                </xsl:for-each>
                
                
                
                
            </g>
            
            
        </svg>-->
</xsl:stylesheet>
