<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="journal"                       -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file                                 -->
<!--             "element-citation-journal-pre-edit.sch"           -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="journal">     -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR <element-citation publication-type="journal">
     in the pre-edit stage.
     
     Journal-5:
     2. Warning if neither <volume> nor <comment>In press</comment> present.

     Journal-6:
     8. Warning if <fpage> is present but <lpage> is not.
     9. Warning if content of either <fpage> or <lpage> not all numeric.
     10. Warning to check for update if <comment>In press</comment> present.
     
     Journal-9:
     2. If there is no <pub-id pub-id-type="doi"> or warning to get missing DOI unless 
     <source> matches one of the journals listed in "Journals without DOIs" 
     and the numeric portion of the content of  <year> is within the range 
     specified in that tab.
     The information is in the document journal-DOI.xml.

-->

<pattern
   id="element-citation-journal-pre-edit-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="journal" Pre-edit Tests</title>

             
  <rule context="element-citation[@publication-type='journal']" id="elem-citation-journal-pre-edit">
    <let name="journal-doi" value="'journal-DOI.xml'"/> 
    <assert test="count(volume) = 1 or comment/text()='In press'"
      role="warning" 
      id="warning-elem-cit-journal-5-2">[warning-elem-cit-journal-5-2]
      There should be either a &lt;volume> element within a &lt;element-citation> of type 'journal',
      or a &lt;comment> with content 'In press'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has neither.</assert>
    
    <report test="fpage and not(lpage)"
      role="warning" 
      id="warning-elem-cit-journal-6-8">[warning-elem-cit-journal-6-8]
      If &lt;fpage> is present, &lt;lpage> should also be present.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not have an &lt;lpage> element.</report>
    
    <report test="matches(fpage,'\D') or matches(lpage, '\D')"
      role="warning" 
      id="warning-elem-cit-journal-6-9">[warning-elem-cit-journal-6-9]
      The content of both &lt;fpage> and &lt;lpage> should be all numeric.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      &lt;fpage>: <xsl:value-of select="fpage"/> and &lt;lpage>: <xsl:value-of select="lpage"/>.</report>
    
    <report test="comment/text()='In press'"
      role="warning" 
      id="warning-elem-cit-journal-6-10">[warning-elem-cit-journal-6-10]
      This citation has a &lt;comment> with content 'In press' in 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>'. Check for updates.</report>
    
    <assert test="pub-id/@pub-id-type='doi' or
      (normalize-space(document($journal-doi)/journals/journal[name=normalize-space(current()/source)]/year) > substring(normalize-space(year),1,4))"
      role="warning" 
      id="warning-elem-cit-journal-9-2">[warning-elem-cit-journal-9-2]
      The citation does not have a pub-id with pub-id-type of 'doi', and the source is not one 
      known to not have a DOI. Check for the missing DOI for 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      with &lt;source> '<xsl:value-of select="source"/>' and &lt;year> 
      <xsl:value-of select="year"/>
    </assert>

  </rule>

 
</pattern>

<!-- ============= End Element Citation Journal Pre-edit Tests ============ -->