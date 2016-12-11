<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <!--GLOBAL VARIABLES-->
    <xsl:variable name="graveyardFile" select="document('graveyardInfo-TEI.xml')"/>
    <xsl:variable name="numPeople" select="count(//person[@role = 'occupant'])"/>
    <xsl:variable name="allAges"
        select="//person[@role = 'occupant']//age"/>
    <xsl:variable name="minAge"
        select="number(min(//person[@role = 'occupant']//age))"/>
    <xsl:variable name="maxAge"
        select="number(max(//person[@role = 'occupant']//age))"/>
    <xsl:variable name="distinctAges"
        select="distinct-values(//person[@role = 'occupant']//age)"/>
    <xsl:variable name="xSpacer" select="10"/>
    <xsl:variable name="ySpacer" select="30"/>
</xsl:stylesheet>