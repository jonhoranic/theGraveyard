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
    <xsl:variable name="xSpacer" select="10"/>
    <xsl:variable name="ySpacer" select="40"/>
    <xsl:variable name="X-decade" select="floor((($maxYear - $minYear) div 10))"/>
    <xsl:variable name="XMax" select="($maxYear - $minYear)"/>
    <xsl:variable name="XMin" select="-10"/>

    <xsl:template match="/">

        <svg width="100%" height="100%">

            <g transform="translate(100 350)">
                <text x="{(($XMax + 2) * $xSpacer) div 2}" y="-320" text-anchor="middle"
                    font-size="20px"> Number of Recorded Deaths in Brush Creek Cemetery (section I data) from the 20th Century to Present Day</text>

                <!--X-AXIS-->
                <line x1="{$XMin}" y1="0" x2="{($XMax + 2) * $xSpacer}" y2="0" stroke="black"
                    stroke-width="3"/>
                <text x="{$XMin}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1910</text>
                <text x="{$XMin + 100}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1920</text>
                <line x1="{$XMin + 100}" y1="0" x2="{$XMin + 100}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 200}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1930</text>
                <line x1="{$XMin + 200}" y1="0" x2="{$XMin + 200}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 300}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1940</text>
                <line x1="{$XMin + 300}" y1="0" x2="{$XMin + 300}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 400}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1950</text>
                <line x1="{$XMin + 400}" y1="0" x2="{$XMin + 400}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 500}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1960</text>
                <line x1="{$XMin + 500}" y1="0" x2="{$XMin + 500}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 600}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1970</text>
                <line x1="{$XMin + 600}" y1="0" x2="{$XMin + 600}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 700}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1980</text>
                <line x1="{$XMin + 700}" y1="0" x2="{$XMin + 700}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 800}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">1990</text>
                <line x1="{$XMin + 800}" y1="0" x2="{$XMin + 800}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 900}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">2000</text>
                <line x1="{$XMin + 900}" y1="0" x2="{$XMin + 900}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <text x="{$XMin + 1000}" y="10" text-anchor="start"
                    style="writing-mode: tb;" font-size="18px">2010</text>
                <line x1="{$XMin + 1000}" y1="0" x2="{$XMin + 1000}" y2="-{7 * $ySpacer}" stroke="#725d5f" stroke-width="1.5"
                    stroke-dasharray="10"/>
                <!--Y-AXIS-->
                <line x1="{$XMin}" y1="0" x2="{$XMin}" y2="-{7 * $ySpacer}" stroke="black"
                    stroke-width="3"/>
                <text x="-60" y="-{(7 * $ySpacer) div 2}" text-anchor="middle"
                    style="writing-mode: tb;" font-size="18px"> Number of Deaths </text>
                <!-- DOTS -->
                <xsl:for-each select="$distinctYears">
                    <xsl:sort/>
                    <xsl:variable name="xPos"
                        select="xs:integer($XMax) - (xs:integer($maxYear) - xs:integer(current()))"/>
                    <xsl:variable name="yearCount"
                        select="count($graveyardFile//person//death[tokenize(@when, '-')[1] = tokenize(current(), '-')[1]])"/>


                    <circle fill="#acc1ca" r="5" cx="{$xPos * $xSpacer}"
                        cy="-{$yearCount * $ySpacer}"/>
                    <text x="{$xPos * $xSpacer}" y="{-($yearCount * $ySpacer) - 2}"
                        text-anchor="end" style="writing-mode: tb;" font-size="10px">
                        <xsl:value-of select="current()"/>
                    </text>
                </xsl:for-each>


                <!-- Y-AXIS MARKS (# OF DEATHS) -->
                <xsl:for-each select="1 to 6">
                    <text x="-20" y="-{current() * $ySpacer}" text-anchor="middle">
                        <xsl:value-of select="current()"/>
                    </text>
                    <line x1="{$XMin}" y1="-{current() * $ySpacer}" x2="{($XMax + 2) * $xSpacer}"
                        y2="-{current() * $ySpacer}" stroke="#725d5f" stroke-width=".5"
                        stroke-dasharray="20"/>
                </xsl:for-each>

            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
