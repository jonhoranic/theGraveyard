<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <!--GLOBAL VARIABLES-->
    <xsl:variable name="graveyardFile" select="document('graveyardInfo-TEI.xml')"/>
    <xsl:variable name="numPeople" select="count(//person[@role = 'occupant'])"/>
    <xsl:variable name="allAges" select="//person[@role = 'occupant']//age"/>
    <xsl:variable name="minAge" select="number(min(//person[@role = 'occupant']//age))"/>
    <xsl:variable name="maxAge" select="number(max(//person[@role = 'occupant']//age))"/>
    <xsl:variable name="distinctAges" select="distinct-values(//person[@role = 'occupant']//age)"/>
    <xsl:variable name="distinctFemaleAges"
        select="distinct-values(//person[@role = 'occupant'][@sex = 'f']//age)"/>
    <xsl:variable name="distinctMaleAges"
        select="distinct-values(//person[@role = 'occupant'][@sex = 'm']//age)"/>
    <xsl:variable name="xSpacer" select="10"/>
    <xsl:variable name="ySpacer" select="30"/>
    <xsl:variable name="xPos" select="position() * $xSpacer"/>
    <xsl:variable name="yPos" select="position() * $ySpacer"/>

    <xsl:template match="/">

        <svg width="100%" height="200%">
            <g transform="translate(0 600)">
                <!-- Y Axis -->
                <line x1="20" x2="20" y1="0" y2="-500" stroke="black" stroke-width="1"/>
                <!-- X Axis -->
                <line x1="20" x2="1100" y1="0" y2="0" stroke="black" stroke-width="1"/>

                <xsl:choose>
                    <xsl:when test="//person[@role = 'occupant']//age[number() le 2]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 10 and number() gt 2]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 20 and number() gt 10]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 30 and number() gt 20]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 40 and number() gt 30]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 50 and number() gt 40]">
                        <line x1="{$xPos}" y1="{count(current()) * $xSpacer}" x2="{$xPos}" y2="0"
                            style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when
                        test="//person[@role = 'occupant']//age[number() le 60 and number() gt 50]">
                        <line x1="{$xPos}"
                            y1="{count(//person[@role = 'occupant']//age[number() le 60 and number() gt 50]) * $xSpacer}"
                            x2="{$xPos}" y2="0" style="stroke:black; stroke-width:35"/>
                    </xsl:when>
                </xsl:choose>
            </g>
        </svg>


    </xsl:template>
</xsl:stylesheet>
