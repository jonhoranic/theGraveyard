<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/> 
    
    <xsl:variable name="numChapters" select="count(//chapter)"/>
    <xsl:variable name="xSpacer" select="100"/>
    <xsl:variable name="maxXVAL" select="$numChapters * $xSpacer"/>
    <xsl:variable name="maxSpeeches" select="max(//chapter//count(descendant::q[@sp='alice']))"/>
    <xsl:variable name="ySpacer" select="10"/>
    <xsl:variable name="maxYVAL" select="$maxSpeeches * $ySpacer"/>
    
    <xsl:template match="/">
        <xsl:comment>The total number of chapters is: <xsl:value-of select="$numChapters"/>
            The total length of my X axis is now set to: <xsl:value-of select="$maxXVAL"/>
            The maximum number of Alice'a speeches in any chapter is: <xsl:value-of select="$maxSpeeches"/>
            The total length of my Y axis is now set to: <xsl:value-of select="$maxYVAL"/>
        </xsl:comment>
        
        <svg width="100%" height="100%">
            
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
            
            
        </svg>
    </xsl:template>
</xsl:stylesheet>