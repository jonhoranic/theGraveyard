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
                        <title>Title of this document</title>
                        <!--You can include a respStmt to indicate various responsibilities, one for each name on your project team.-->
                        <respStmt>
                            <resp>Markup by</resp>
                            
                            <persName xml:id="lmm">Lauren McGuigan</persName>
                            <persName></persName>
                        </respStmt>
                        <respStmt><resp>Transformation to TEI by</resp>
                        <persName xml:id="jmh">Jonathan Horanic</persName>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <authority>Prepared in TEI P5 by The Graveyard project team on newtFire.org. GitHub
                            repository: <ref target="https://github.com/jonhoranic/theGraveyard"/>. Date last
                            worked on: <date when="2016-11-10">10 November 2016</date></authority>
                        <availability>
                            <licence><!--Choose and identify a Creative Commons license for distribution. Look here: https://creativecommons.org/share-your-work/--></licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <!--ebb: This is the part where you want to elaborate on your sources of information, the layout of the graveyard, your photography, the provenance of the documents you are working with. We're looking at EpiDoc as a model here. I'm drawing on EpiDoc as a model here.-->
                        <msDesc>
                            <msIdentifier>
                                <repository>museum/archive</repository>
                                <idno>inventory number</idno>
                            </msIdentifier>
                            <physDesc>
                                <objectDesc>
                                    <supportDesc>
                                        <support>description of information resources: documents and monuments (may
                                            include <material>paper</material>, <material>concrete</material>,
                                            <material>granite</material>, etc. and <objectType>burial
                                                records</objectType> information. The following are optional, but you
                                            can include <dimensions>
                                                <height/>
                                                <width/>
                                                <depth/>
                                            </dimensions> of particular objects here, or you may want to simply
                                            <measureGrp><measure>measurements</measure></measureGrp>
                                            etc.)</support>
                                        
                                    </supportDesc>
                                    <layoutDesc>
                                        <layout>description of text field/campus. You can include as many measure
                                            groups as you need to define the layout. <measureGrp><measure unit="yard"
                                                >measurement</measure></measureGrp> here.</layout>
                                    </layoutDesc>
                                </objectDesc>
                            </physDesc>    
                            <history>
                                <origin>
                                    <origPlace>Place of origin</origPlace>
                                    <origDate>Date of origin</origDate>
                                </origin>
                                <provenance type="found"> Findspot and circumstances/context </provenance>
                                <provenance type="observed">Modern location(s) (if different from repository,
                                    above) </provenance>
                            </history>
                            <additional>
                                <adminInfo>
                                    <custodialHist>
                                        <custEvent type="photography"/>
                                    </custodialHist>
                                </adminInfo>
                            </additional>
                        </msDesc>
                        
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <facsimile>
                <graphic url="graveyard map photo URL"/>
                <graphic url="another photo or diagram of the area etc"/>
            </facsimile>
            <text>
                <body>
                    <div><!--ebb: The div sets the section level. This needs either an attribute or a child <head> element to define the section.--> 
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
                                <birth notBefore="2016-01-01" notAfter="2016-02-05"><placeName>Mount Pleasant,
                                    PA</placeName></birth>
                                <death when="2016-09-09"><note type="cause">natural
                                    causes</note><placeName>Greensburg, PA</placeName></death>
                                <event>
                                    
                                    <desc>Stuff</desc>
                                </event>
                                <occupation/>
                                <trait type="racial">
                                    <label>white</label>
                                </trait>
                                <graphic url="photo.jpg"/>
                                <geo><!--Look up how to properly set geocoordinates in here.--></geo>
                            </person>
                        </listPerson>
                    </div>
                </body>
            </text>
        </TEI>
        
        
        
        
        
    </xsl:template>
</xsl:stylesheet>