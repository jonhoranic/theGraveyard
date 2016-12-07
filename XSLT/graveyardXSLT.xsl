<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Graveyard TEI Formatting XSLT</title>
                        <respStmt>
                            <resp>Data Acquisition by</resp>
                            <persName xml:id="JMH">Jonathan Horanic</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Markup by</resp>
                            <persName xml:id="LMM">Lauren McGuigan</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Photographing by</resp>
                            <persName xml:id="JLK">Jared Kramer</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Transformation to TEI by</resp>
                            <persName xml:id="JMH">Jonathan Horanic</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Visulizations by</resp>
                            <persName xml:id="LMM">Lauren McGuigan</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Web Development by</resp>
                            <persName xml:id="JLK">Jared Kramer</persName>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <authority>Prepared in TEI P5 by The Graveyard project team on newtFire.org. GitHub
                            repository: <ref target="https://github.com/jonhoranic/theGraveyard"/>. Date last
                            worked on: <date when="2016-06-12">6 December 2016</date></authority>
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
                                        <support>Groups of <material>paper </material><objectType>burial records </objectType>are kept inside of labled lot <material>manila folders</material>.
                                        </support>
                                        <support>Groups of <material>cardstock </material><objectType>ownership and interment cards </objectType>are kept inside of labled card catalog box.
                                        </support>
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
                                        <layout>A hilltop section of the graveyard that is approximately <measureGrp><measure unit="square feet"># </measure>square feet</measureGrp>, comprised of # headstones and two mausoleums.</layout>
                                    </layoutDesc>
                                </objectDesc>
                            </physDesc>    
                            <!--<history>
                                <origin>
                                    <origPlace>Place of origin</origPlace>
                                    <origDate>Date of origin</origDate>
                                </origin>
                                <provenance type="found"> Findspot and circumstances/context </provenance>
                                <provenance type="observed">Modern location(s) (if different from repository,
                                    above) </provenance>
                            </history>-->
                            <additional>
                                <adminInfo>
                                    <!--<custodialHist>
                                        <custEvent type="photography"/>
                                    </custodialHist>-->
                                </adminInfo>
                            </additional>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            
            
            
            <!--<facsimile>
                <graphic url="graveyard map photo URL"/>
                <graphic url="another photo or diagram of the area etc"/>
            </facsimile>-->
            <text>
                <body>
                    <div>
                        <xsl:for-each select="//listPerson">
                        <listPerson xml:id="lot3"><!--Each listPerson represents a single "lot" of people. You want an attribute value to hold this info. Let's use an @xml:id.-->
                            <head>Lot 3 refers to a group of gravestones bordered on the southeastern side by a shrub. 
                                <geo><!--Stick a pair of whitespace-separated geocoordinates here. Look up how to do this in the TEI.--></geo>
                            </head>
                            <person xml:id="who1" sex="f">
                                <persName><surname/>
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
                                <!--<geo></geo>-->
                            </person>
                        </listPerson>
                        </xsl:for-each>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
</xsl:stylesheet>