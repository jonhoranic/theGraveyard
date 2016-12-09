<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="ownTotal" select="count(//person[@role='owner'])"/>
    
    <xsl:template match="/">
        <xsl:comment>The total number of owners is: <xsl:value-of select="$ownTotal"/>.</xsl:comment>
    </xsl:template>
    
</xsl:stylesheet>