<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="report"                        -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   October 2016  (Created October 2016)              -->
<!--             Delivered as file                                 -->
<!--             "element-citation-report-pre-edit.sch"            -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="report">      -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR <element-citation publication-type="report">
     in the pre-edit stage.
     
     report-10: 
     warn if <publisher-loc> not present.

-->

<pattern
   id="element-citation-report-pre-edit-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="report" Pre-edit Tests</title>

             
  <rule context="element-citation[@publication-type='report']" id="elem-citation-report-pre-edit">
     
    <assert test="count(publisher-loc) = 1"
      role="warning" 
      id="warning-elem-cit-report-10">[warning-elem-cit-report-10]
      There should be a &lt;publisher-loc> element within a &lt;element-citation> of type 'report'.
      Reference '<value-of select="ancestor::ref/@id"/>' does not have one &lt;publisher-loc> element.</assert>

  </rule>

 
</pattern>

<!-- ============= End Element Citation Journal Pre-edit Tests ============ -->