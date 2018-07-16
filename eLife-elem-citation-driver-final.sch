<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Driver Schematron element-citation driver   -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file                                 -->
<!--                  "eLife-element-citation-driver-final.sch"    -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Controller Schematron to call in (include) all    -->
<!--             the eLife Schematron modules for checking         -->
<!--             element citations, at the final stage.            -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<schema  id="Driver-Schematron-element-citation"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   queryBinding="xslt2">
    
  <title>eLife Driver Schematron element-citation journals</title>
  <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

<!--     <element-citation> General Tests                          -->
  <!--     (applicable to all publication types)                   -->
  <include href="element-citation-general.sch"/>
   
<!--     <element-citation> High Tests                             -->
  <include href="element-citation-high.sch"/>
  
<!--     <element-citation publication-type="journal"> Tests       -->
     <include href="element-citation-journal.sch"/>            

<!--     <element-citation publication-type="book"> Tests          -->
  <include href="element-citation-book.sch"/>            
  
<!--     <element-citation publication-type="data"> Tests          -->
  <include href="element-citation-data.sch"/>            
  
<!--     <element-citation publication-type="patent"> Tests          -->
  <include href="element-citation-patent.sch"/>  
  
  <!--     <element-citation publication-type="clinicaltrial"> Tests - excluded due to changes in reference guidelines  -->
  <!-- <include href="element-citation-clinicaltrial.sch"/>  -->
  
  <!--     <element-citation publication-type="software"> Tests          -->
  <include href="element-citation-software.sch"/>  
  
  <!--     <element-citation publication-type="preprint"> Tests          -->
  <include href="element-citation-preprint.sch"/>  
  
  <!--     <element-citation publication-type="web"> Tests          -->
  <include href="element-citation-web.sch"/>  
  
  <!--     <element-citation publication-type="report"> Tests          -->
  <include href="element-citation-report.sch"/>  
  
  <!--     <element-citation publication-type="confproc"> Tests          -->
  <include href="element-citation-confproc.sch"/>  
  
  <!--     <element-citation publication-type="thesis"> Tests            -->
  <include href="element-citation-thesis.sch"/>  
  
  <!--     <element-citation publication-type="periodical"> Tests         -->
  <include href="element-citation-periodical.sch"/>  
  
</schema>
<!-- ============= End eLife Driver element-citation final stage tests ==== -->
