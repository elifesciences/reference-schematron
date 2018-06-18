<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             all @publication-types                            -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file                                 -->
<!--             "element-citation-general-pre-edit.sch"           -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     General Schematron tests for all citations        -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR all <element-citation> elements in the pre-edit stage.
     
     Name-2: 
     2. Warn if a name does not contain a <given-names>. 
     (Note: DTD requires one or the other but not both)

     Date-1:
     2. Warning if value of <year> is not between 1900 and the current year + 5 years.

-->

<pattern
   id="element-citation-general-pre-edit-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation General Pre-edit Tests</title>
        
  <rule context="element-citation" id="elem-citation-general-pre-edit">

    <report test="person-group/name[not(given-names)]"
      role="warning" 
      id="warn-elem-cit-gen-name-2">[warning-elem-cit-gen-name-2]
      Each &lt;name> element in a reference must contain a &lt;given-names> element. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not.</report>    

  </rule>
  
  <rule context="element-citation/year" id="elem-citation-general-year-pre-edit">
    <let name="YYYY" value="substring(normalize-space(.), 1, 4)"/>
    <let name="current-year" value="year-from-date(current-date())"/>
    
    <assert test="(1900 le number($YYYY)) and (number($YYYY) le ($current-year + 5))"
      role="warning" 
      id="warn-elem-cit-gen-date-1-2">[warn-elem-cit-gen-date-1-2]
      The numeric value of the first 4 digits of the &lt;year> element should be between 1900 and the current year + 5 years (inclusive).
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="."/>'.
    </assert>    
    
  </rule>

</pattern>

<!-- ============= End Element Citation General Pre-edit Tests ============ -->