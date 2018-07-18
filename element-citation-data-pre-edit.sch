<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="data"                          -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   September 2016  (Created August 2016)             -->
<!--             Delivered as file                                 -->
<!--             "element-citation-data-pre-edit.sch"              -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="data">        -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR <element-citation publication-type="data">
     in the pre-edit stage.
     
     data-2:
     1. Warn if there is no <person-group> element.
     2. The only valid @person-group-type values are author,compiler, curator.

     data-11:
     1. Warning if <source> is not present: 
     MESSAGE TEXT: "Please provide the name of the repository where this data is stored"

-->

<pattern
   id="element-citation-data-pre-edit-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron">

<title>element-citation publication-type="data" Pre-edit Tests</title>
        
  <rule context="element-citation[@publication-type='data']" id="elem-citation-data-pre-edit">

    <assert test="person-group"
      role="warning" 
      id="warning-elem-cit-data-2-1">[warning-elem-cit-data-2-1]
      There should be at least one &lt;person-group> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has none.</assert>
    
    <assert test="source"
      role="warning" 
      id="warning-elem-cit-data-11">[warning-elem-cit-data-11]
      Please provide the name of the repository where this data is stored.</assert>    

  </rule>

  <rule context="element-citation[@publication-type='data']/person-group" id="elem-citation-data-person-group-pre-edit">
  <assert test="@person-group-type=('author','compiler', 'curator')"
    role="warning" 
    id="warning-elem-cit-data-2-2">[warning-elem-cit-data-2-2]
    The only valid @person-group-type values are author,compiler, curator.
    Reference '<value-of select="ancestor::ref/@id"/>' has a &lt;person-group> element with type
    '<value-of select="@person-group-type"/>'.</assert>
  </rule>
</pattern>

<!-- ============= End Element Citation Data Pre-edit Tests ============ -->