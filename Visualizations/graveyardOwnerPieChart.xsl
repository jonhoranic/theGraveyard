<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:variable name="ownTotal" select="count(//person[@role='owner'])"/>
        <xsl:variable name="mTotal" select="count(//person[@role='owner'][@sex='m'])"/>
        <xsl:variable name="fTotal" select="count(//person[@role='owner'][@sex='f'])"/>
        <xsl:variable name="naTotal" select="count(//person[@role='owner'][@sex='na'])"/>
        <xsl:variable name="uTotal" select="count(//person[@role='owner'][@sex='u'])"/>
        
        <xsl:comment>The total number of owners is: <xsl:value-of select="$ownTotal"/>.</xsl:comment>
        <xsl:comment>The total number of male owners is: <xsl:value-of select="$mTotal"/>.</xsl:comment>
        <xsl:comment>The total number of female owners is: <xsl:value-of select="$fTotal"/>.</xsl:comment>
        <xsl:comment>The total number of N/A gendered owners is: <xsl:value-of select="$naTotal"/>.</xsl:comment>
        <xsl:comment>The total number of unknown gendered owners is: <xsl:value-of select="$uTotal"/>.</xsl:comment>
        
        <xsl:variable name="radius" select="250"/>
        
        <xsl:variable name="sliceType1" select="17 div $ownTotal"/>
        <xsl:variable name="sliceType2" select="24 div $ownTotal"/>
        <xsl:variable name="sliceType3" select="17 div $ownTotal"/>
        <xsl:variable name="sliceType4" select="1 div $ownTotal"/>
        
        <xsl:comment>
            1. Ratios for male owners: <xsl:value-of select="$sliceType1"/>
            2. Ratios for female owners: <xsl:value-of select="$sliceType2"/>
            3. Ratios for N/A gendered owners: <xsl:value-of select="$sliceType3"/>
            4. Ratios for unknown gendered owners: <xsl:value-of select="$sliceType4"/>
        </xsl:comment>
        
        <xsl:variable name="flagSweepT1">
            <xsl:choose><xsl:when test="$sliceType1 lt .5">0</xsl:when> 
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="flagSweepT2">
            <xsl:choose><xsl:when test="$sliceType2 lt .5">0</xsl:when> 
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="flagSweepT3">
            <xsl:choose><xsl:when test="$sliceType3 lt .5">0</xsl:when> 
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="flagSweepT4">
            <xsl:choose><xsl:when test="$sliceType4 lt .5">0</xsl:when> 
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="sliceM" select="$sliceType1 * (2 * math:pi())"/>
        <xsl:variable name="sliceF" select="$sliceM + ($sliceType2 * (2 * math:pi()))"/>
        <xsl:variable name="sliceNA" select="$sliceF + ($sliceType3 * (2 * math:pi()))"/>
        <xsl:variable name="sliceU" select="$sliceNA + ($sliceType4 * (2 * math:pi()))"/>
        
        <xsl:comment>
            1. Radian of male slice: <xsl:value-of select="$sliceM"/>
            2. Radian of female slice: <xsl:value-of select="$sliceF"/>
            3. Radian of NA slice: <xsl:value-of select="$sliceNA"/>
            4. Radian of unknown slice: <xsl:value-of select="$sliceU"/>
        </xsl:comment>
        
        <xsl:variable name="cosM" select="math:cos($sliceM)"/>
        <xsl:variable name="cosF" select="math:cos($sliceF)"/>
        <xsl:variable name="cosNA" select="math:cos($sliceNA)"/>
        <xsl:variable name="cosU" select="math:cos($sliceU)"/>
        
        <xsl:comment>
            1. Cosine of male slice: <xsl:value-of select="$cosM"/>
            2. Cosine of female slice: <xsl:value-of select="$cosF"/>
            3. Cosine of NA slice: <xsl:value-of select="$cosNA"/>
            4. Cosine of unknown slice: <xsl:value-of select="$cosU"/>
        </xsl:comment>
        
        <xsl:variable name="sinM" select="math:sin($sliceM)"/>
        <xsl:variable name="sinF" select="math:sin($sliceF)"/>
        <xsl:variable name="sinNA" select="math:sin($sliceNA)"/>
        <xsl:variable name="sinU" select="math:sin($sliceU)"/>
        
        <xsl:comment>
            1. Sine of male slice: <xsl:value-of select="$sinM"/>
            2. Sine of female slice: <xsl:value-of select="$sinF"/>
            3. Sine of NA slice: <xsl:value-of select="$sinNA"/>
            4. Sine of unknown slice: <xsl:value-of select="$sinU"/>
        </xsl:comment>
        
        <xsl:variable name="XM" select="$cosM * $radius"/>
        <xsl:variable name="XF" select="$cosF * $radius"/>
        <xsl:variable name="XNA" select="$cosNA * $radius"/>
        <xsl:variable name="XU" select="$cosU * $radius"/>
        
        <xsl:comment>
            1. X value for male slice: <xsl:value-of select="$XM"/>
            2. X value for female slice: <xsl:value-of select="$XF"/>
            3. X value for NA slice: <xsl:value-of select="$XNA"/>
            4. X value for unknown slice: <xsl:value-of select="$XU"/>
        </xsl:comment>
        
        <xsl:variable name="YM" select="$sinM * $radius"/>
        <xsl:variable name="YF" select="$sinF * $radius"/>
        <xsl:variable name="YNA" select="$sinNA * $radius"/>
        <xsl:variable name="YU" select="$sinU * $radius"/>
        
        <xsl:comment>
            1. Y value for male slice: <xsl:value-of select="$YM"/>
            2. Y value for female slice: <xsl:value-of select="$YF"/>
            3. Y value for NA slice: <xsl:value-of select="$YNA"/>
            4. Y value for unknown slice: <xsl:value-of select="$YU"/>
        </xsl:comment>
        
        <svg width="700" height="700">
            <g transform="translate(350 350)">
                <circle cx="0" cy="0" r="{$radius}" style="stroke:black; stroke-width:3; fill:none"/>
                <text x="0" y="-290" font-size="35px" text-anchor="middle" text-decoration="underline">Distribution of Owner Genders</text>
                
                <xsl:comment>This is the male slice in the off-blue</xsl:comment>
                <path d="M0,0
                    L{$radius},0
                    A{$radius},{$radius} 0 {$flagSweepT1},1 {$XM},{$YM}
                    Z"
                    style="stroke:black; stroke-width:3; fill: #506F7D"/>
                
                <xsl:comment>This is the female slice in the brown</xsl:comment>
                <path d="M0,0
                    L{$XM},{$YM}
                    A{$radius},{$radius} 0 {$flagSweepT2},1 {$XF},{$YF}
                    Z"
                    style="stroke:black; stroke-width:3; fill: #544547"/>
                
                <xsl:comment>This is the N/A slice in the off-grey</xsl:comment>
                <path d="M0,0
                    L{$XF},{$YF}
                    A{$radius},{$radius} 0 {$flagSweepT3},1 {$XNA},{$YNA}
                    Z"
                    style="stroke:black; stroke-width:3; fill: #999999"/>
                
                <xsl:comment>This is the unknown slice in the white</xsl:comment>
                <path d="M0,0
                    L{$XNA},{$YNA}
                    A{$radius},{$radius} 0 {$flagSweepT4},1 {$XU},{$YU}
                    Z"
                    style="stroke:black; stroke-width:3; fill: white"/>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>