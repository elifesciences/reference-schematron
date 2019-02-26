<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Driver Schematron element-citation driver   -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   October 2016  (Created August 2016)               -->
<!--             Delivered as file                                 -->
<!--               "eLife-element-citation-driver-pre-edit.sch"    -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Controller Schematron to call in (include) all    -->
<!--             the eLife Schematron modules for checking         -->
<!--             element citations, at the pre-edit stage.         -->
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
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   queryBinding="xslt2">
    
  <title>eLife Driver Schematron element-citation journals</title>
  <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  <ns uri="https://elifesciences.org/ns/functions" prefix="e"/>
  
  <!-- FA: xsl:function which determines the citation format -->
  <xsl:function name="e:citation-format">
    <xsl:param name="year"/>
    <xsl:choose>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 1) and $year/ancestor::element-citation/person-group[1]/name">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/name/surname,', ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 1) and $year/ancestor::element-citation/person-group[1]/collab">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/collab,', ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 2) and (count($year/ancestor::element-citation/person-group[1]/name) = 1) and $year/ancestor::element-citation/person-group[1]/*[1]/local-name() = 'collab'">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/collab,' and ',$year/ancestor::element-citation/person-group[1]/name/surname,' ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 2) and (count($year/ancestor::element-citation/person-group[1]/name) = 1) and $year/ancestor::element-citation/person-group[1]/*[1]/local-name() = 'name'">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/name/surname,' and ',$year/ancestor::element-citation/person-group[1]/collab,' ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 2) and (count($year/ancestor::element-citation/person-group[1]/name) = 2)">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/name[1]/surname,' and ',$year/ancestor::element-citation/person-group[1]/name[2]/surname,' ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) = 2) and (count($year/ancestor::element-citation/person-group[1]/collab) = 2)">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/collab[1],' and ',$year/ancestor::element-citation/person-group[1]/collab[2],' ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) ge 2) and $year/ancestor::element-citation/person-group[1]/*[1]/local-name() = 'collab'">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/collab[1], ' et al., ',$year)"/>
      </xsl:when>
      <xsl:when test="(count($year/ancestor::element-citation/person-group[1]/*) ge 2) and $year/ancestor::element-citation/person-group[1]/*[1]/local-name() = 'name'">
        <xsl:value-of select="concat($year/ancestor::element-citation/person-group[1]/name[1]/surname, ' et al., ',$year)"/>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="'undetermined'"/></xsl:otherwise>
    </xsl:choose>
  </xsl:function>

<!-- <element-citation> General Tests (applicable to all publication types) -->
  <include href="element-citation-general.sch"/>
  
  <!-- <element-citation> General Pre-edit Tests (applicable to all publication types) -->
  <include href="element-citation-general-pre-edit.sch"/>
   
<!--     <element-citation> High Tests                             -->
  <include href="element-citation-high.sch"/>
  
<!--     <element-citation publication-type="journal"> Tests     -->
     <include href="element-citation-journal.sch"/>        
  
 <!--     <element-citation publication-type="journal"> Pre-edit Tests     -->
  <include href="element-citation-journal-pre-edit.sch"/>        

  <!--     <element-citation publication-type="book"> Tests     -->
  <include href="element-citation-book.sch"/>   
  
  <!--     <element-citation publication-type="data"> Tests     -->
  <include href="element-citation-data.sch"/>        
  
  <!--     <element-citation publication-type="data"> Pre-edit Tests     -->
  <include href="element-citation-data-pre-edit.sch"/>
  
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
  
  <!--     <element-citation publication-type="book"> Pre-edit Tests     -->
  <include href="element-citation-report-pre-edit.sch"/>
  
  <!--     <element-citation publication-type="confproc"> Tests          -->
  <include href="element-citation-confproc.sch"/>  
  
  <!--     <element-citation publication-type="thesis"> Tests          -->
  <include href="element-citation-thesis.sch"/>  
  
  <!--     <element-citation publication-type="periodical"> Tests          -->
  <include href="element-citation-periodical.sch"/>  
  
</schema>
<!-- ============= End eLife Driver element-citation pre-edit stage tests ==== -->
