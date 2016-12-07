<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" version="3.0">

    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Graveyard TEI Formatting XSLT</title>
                        <respStmt>
                            <resp>Data Acquisition and XML Markup Transformation to TEI by</resp>
                            <persName xml:id="JMH">Jonathan Horanic</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Data Visulizations and XML Markup by</resp>
                            <persName xml:id="LMM">Lauren McGuigan</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Photographing and Web Development by</resp>
                            <persName xml:id="JLK">Jared Kramer</persName>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <authority>Prepared in TEI P5 by The Graveyard project team on newtFire.org.
                            GitHub repository: <ref
                                target="https://github.com/jonhoranic/theGraveyard"/>. Date last
                            worked on: <date when="2016-12-15">6 December 2016</date></authority>
                        <availability>
                            <licence><!--Creative Commons License HERE https://creativecommons.org/share-your-work/--></licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <!--ebb: This is the part where you want to elaborate on your sources of information, the layout of the graveyard, your photography, the provenance of the documents you are working with. We're looking at EpiDoc as a model here. I'm drawing on EpiDoc as a model here.-->
                        <msDesc>
                            <msIdentifier>
                                <country>USA</country>
                                <region>Pennsylvania</region>
                                <settlement>Iriwn</settlement>
                                <repository>Brush Creek Cemetery - Main Office</repository>
                                <collection>Office Files</collection>
                                <idno>S-I</idno>
                            </msIdentifier>
                            <physDesc>
                                <objectDesc>
                                    <supportDesc>
                                        <support>Groups of <material>paper</material>
                                            <objectType>burial records</objectType> are kept inside
                                            of labled lot <material>manila folders</material>.
                                            Groups of <material>cardstock</material>
                                            <objectType>ownership and interment cards</objectType>
                                            are kept inside of labled card catalog box. </support>
                                        <!--<support> Gravestones
                                            <dimensions>
                                                <height/>
                                                <width/>
                                                <depth/>
                                            </dimensions> of particular objects here, or you may want to simply
                                            <measureGrp>
                                                <measure>measurements</measure>
                                            </measureGrp>
                                        </support>-->
                                    </supportDesc>
                                    <layoutDesc>
                                        <layout>A hilltop section of the graveyard that is
                                            approximately <measureGrp><measure
                                                  ># square feet<xsl:comment>FILL THIS IN!</xsl:comment></measure>
                                                square feet</measureGrp>, comprised of
                                            #<xsl:comment>FILL THIS IN!</xsl:comment> headstones and
                                            two mausoleums.</layout>
                                    </layoutDesc>
                                </objectDesc>
                            </physDesc>
                            <xsl:comment><history>
                                <origin>
                                    <origPlace>Place of origin</origPlace>
                                    <origDate>Date of origin</origDate>
                                </origin>
                                <provenance type="found"> Findspot and circumstances/context </provenance>
                                <provenance type="observed">Modern location(s) (if different from repository,
                                    above) </provenance>
                            </history></xsl:comment>
                            <additional>
                                <adminInfo>
                                    <xsl:comment><custodialHist>
                                        <custEvent type="photography"/>
                                    </custodialHist></xsl:comment>
                                </adminInfo>
                            </additional>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <facsimile>
                <graphic url="cemeteryPictures/WhiteMap1.jpg"/>
                <graphic url="cemeteryPictures/WhiteMapSectionI.jpg"/>
            </facsimile>
            <text>
                <body>
                    <div>
                        <xsl:for-each select="descendant::lot">
                            <listPerson xml:id="lotNo{@number}">
                                <!--Each listPerson represents a single "lot" of people. You want an attribute value to hold this info. Let's use an @xml:id.-->
                                <head>
                                    <xsl:comment>Describe Lot</xsl:comment>
                                    <geo>
                                        <xsl:comment>whitespace-separated geocoordinates look up how to do this in the TEI</xsl:comment>
                                    </geo>
                                    <xsl:if test="./child::img">
                                        <graphic url="{./child::img/@src}"/>
                                    </xsl:if>
                                </head>
                                <xsl:apply-templates select="./child::firstOwner"/>                               
                                <xsl:if test="child::secondOwner">
                                    <xsl:apply-templates select="./child::secondOwner"/>
                                </xsl:if>
                                <xsl:if test="child::thirdOwner">
                                    <xsl:apply-templates select="./child::thirdOwner"/>
                                </xsl:if>
                                <xsl:apply-templates select="./child::occupant"/>
                            </listPerson>
                        </xsl:for-each>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="firstOwner">
        <person role="owner" n="1">
            <xsl:apply-templates select="persName"/>
            
        </person>
    </xsl:template>
    <xsl:template match="secondOwner">
        <person role="owner" n="2">
            <xsl:apply-templates select="persName"/>
            
        </person>
    </xsl:template>
    <xsl:template match="thirdOwner">
        <person role="owner" n="2">
            <xsl:apply-templates select="persName"/>
            
        </person>
    </xsl:template>
    <xsl:template match="occupant">
        <person xml:id="L{./parent::lot/@number}P{descendant::lotLocation}" role="occupant">
            <xsl:apply-templates select="child::persName"/>
        </person>
    </xsl:template>
    <xsl:template match="persName">
        <persName>
                <xsl:apply-templates select="child::surName"/>
                <xsl:apply-templates select="child::firstName"/>
            <xsl:choose>
                <xsl:when test="child::MI">
                        <xsl:apply-templates select="child::MI"/>
                </xsl:when>
                <xsl:when test="child::middleName">
                    <xsl:apply-templates select="child::middleName"/>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:if test="child::genName">
                    <xsl:apply-templates select="child::genName"/>                
            </xsl:if>
            <xsl:if test="child::title[@type = 'military']">
                    <xsl:apply-templates select="child::title[@type = 'military']"/>
            </xsl:if>
        </persName>
        <xsl:if test="child::nickName">
                <xsl:apply-templates select="child::nickName"/>
        </xsl:if>
        <xsl:if test="child::purchased">
            <xsl:apply-templates select="child::purchased"/>
        </xsl:if>

    </xsl:template>
    <xsl:template match="surName">
        <surname>
            <xsl:apply-templates/>
        </surname>
    </xsl:template>
    <xsl:template match="firstName">
        <forename type="first">
            <xsl:apply-templates/>
        </forename>
    </xsl:template>
    <xsl:template match="MI">
                <forename type="middle">
                    <xsl:apply-templates/>
                </forename>
    </xsl:template>
    <xsl:template match="middleName">
            <forename type="middle">
                <xsl:apply-templates/>
            </forename>
    </xsl:template>
    <xsl:template match="genName">
        <genName>
            <xsl:apply-templates/>
        </genName>
    </xsl:template>
    <xsl:template match="title[@type='military']">
        <roleName>
            <xsl:apply-templates/>
            <desc>
                <xsl:apply-templates select="following-sibling::desc[@type = 'military']"/>
            </desc>
        </roleName>
    </xsl:template>
    <xsl:template match="nickName">
        <persName>
            <xsl:apply-templates/>
        </persName>
    </xsl:template>
    <xsl:template match="purchased">
        <note type="purchased"><date when="{child::date}"/></note>
    </xsl:template>
    <!--<xsl:template match="note">
    </xsl:template>-->
    <!-- <person xml:id="" sex="f">
        <persName>
            <surname/>
            <forename/>
            <forename/>
            <roleName/>
        </persName>
        <birth notBefore="2016-01-01" notAfter="2016-02-05">
            <placeName>Mount Pleasant, PA</placeName>
        </birth>
        <death when="2016-09-09">
            <note type="cause">natural causes</note>
            <placeName>Greensburg, PA</placeName>
        </death>
        <event>
            <desc>Stuff</desc>
        </event>
        <occupation/>
        <trait type="racial">
            <label>white</label>
        </trait>
        <graphic url="photo.jpg"/>
        <!-\-<geo></geo>-\->
    </person>-->
</xsl:stylesheet>
