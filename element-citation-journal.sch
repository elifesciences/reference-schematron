<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="journal"                       -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file "element-citation-journal.sch"  -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="journal">     -->
<!--             These rules are called in both the pre-edit and   -->
<!--             final stages.                                     -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR <element-citation publication-type="journal">

       Journal-2: 
       1. There must be one and only one person-group in an 
       element-citation. 
       2. the person-group-type must be "author"
     
       Journal-3: 
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>
       These rules only apply to the <article-title> element in the 
       context of <element-citation>, not to any other context. 
       
       Journal-4:
       1. <source> must occur once and only once
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 
       
       Journal-5: 
       1. <volume> must contain at least 1 character and may not contain any elements. It
       is optional, and may occur once per element-citation.
       2. Defined for pre-edit stage.
       3. There may be 0 or 1 <volume> elements
       
       Journal-6:
       Assumption: comment elements with content other than 'In press' are not allowed.
       1. Warning that page/elocation information is missing if none of the following are present: 
           a. <fpage>
           b. <elocation-id>
           c. <comment>In press</comment> (string value must be exact, including case)
       2. if <fpage> is present then neither <elocation-id> nor <comment>In press</comment> are allowed. 
       3. if <elocation-id> is present then neither <fpage> nor <comment>In press</comment> are allowed 
       4. if <comment>In press</comment> is present then neither <elocation-id> nor <fpage> are allowed 
       5. <lpage> is only allowed if <fpage> is present and must be greater than <fpage>
       6. If the content of <fpage> begins with a letter, then the content of  <lpage> must begin with 
       the same letter.
       7. The following tags may not occur more than once in an <element-citation>: <fpage>, 
       <lpage>, <elocation-id>, and <comment>In press</comment>.
       Journal-9:
       1. Each <pub-id>, if present, must have a @pub-id-type of either "doi" or "pmid".
       Other requirements in the pre-edit rules.
       Journal-10:
       If <pub-id pub-id-type="pmid"> the content must be all numeric.
       Journal-11:
       Moot
       Journal-12:
       The only tags that are allowed as children of <element-citation> with the publication-type="journal" are:
       <person-group>, <year>, <article-title>, <source>, <volume>, <fpage>, <lpage>, <elocation-id>, 
       <comment>, and <pub-id>. 
       Journal-13:
       The only <comment> element allowed contains exactly the string "In press".
 
-->

<pattern
   id="element-citation-journal-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="journal" Tests</title>
             
  <rule context="element-citation[@publication-type='journal']" id="elem-citation-journal">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-journal-2-1">[err-elem-cit-journal-2-1]
      Each  &lt;element-citation> of type 'journal' must contain one and
      only one &lt;person-group> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
      <assert test="person-group[@person-group-type='author']"
              role="error" 
              id="err-elem-cit-journal-2-2">[err-elem-cit-journal-2-2]
Each  &lt;element-citation> of type 'journal' must contain one &lt;person-group> 
with the attribute person-group-type set to 'author'. Reference 
'<xsl:value-of select="ancestor::ref/@id"/>' has a  &lt;person-group> type of 
'<xsl:value-of select="person-group/@person-group-type"/>'.</assert> 

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-journal-3-1">[err-elem-cit-journal-3-1]
        Each  &lt;element-citation> of type 'journal' must contain one and
        only one &lt;article-title> element.
        Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
        <xsl:value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(source)=1"
      role="error" 
      id="err-elem-cit-journal-4-1">[err-elem-cit-journal-4-1]
      Each  &lt;element-citation> of type 'journal' must contain one and
      only one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(source)=1 and (source/string-length() + sum(descendant::source/*/string-length()) ge 2)"
      role="error" 
      id="err-elem-cit-journal-4-2-1">[err-elem-cit-journal-4-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'journal' must contain 
      at least two characters.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(source)=1 and count(source/*)=count(source/(italic | sub | sup))"
      role="error" 
      id="err-elem-cit-journal-4-2-2">[err-elem-cit-journal-4-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'journal' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
    <assert test="count(volume) le 1"
      role="error" 
      id="err-elem-cit-journal-5-1-3">[err-elem-cit-journal-5-1-3]
      There may be at most one  &lt;volume> element within a &lt;element-citation> of type 'journal'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(volume)"/>
      &lt;volume> elements.</assert>
    
    <assert test="(count(fpage) eq 1) or (count(elocation-id) eq 1) or (count(comment/text()='In press') eq 1)"
      role="warning" 
      id="warning-elem-cit-journal-6-1">[warning-elem-cit-journal-6-1]
      One of &lt;fpage>, &lt;elocation-id>, or &lt;comment>In press&lt;/comment> should be present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has missing page or elocation information.</assert>
    
    <report test="lpage and not(fpage)"
      role="error" 
      id="err-elem-cit-journal-6-5-1">[err-elem-cit-journal-6-5-1]
      &lt;lpage> is only allowed if &lt;fpage> is present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;lpage> but no &lt;fpage>.</report>
    
    <report test="lpage and (number(fpage) >= number(lpage))"
      role="error" 
      id="err-elem-cit-journal-6-5-2">[err-elem-cit-journal-6-5-2]
      &lt;lpage> must be larger than &lt;fpage>, if present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has first page &lt;fpage> = '<xsl:value-of select="fpage"/>' 
      but last page &lt;lpage> = '<xsl:value-of select="lpage"/>'.</report>
    
    <report test="count(fpage) gt 1 or count(lpage) gt 1 or count(elocation-id) gt 1 or count(comment) gt 1"
      role="error" 
      id="err-elem-cit-journal-6-7">[err-elem-cit-journal-6-7]
      The following tags may not occur more than once in an &lt;element-citation>: &lt;fpage>, &lt;lpage>, 
      &lt;elocation-id>, and &lt;comment>In press&lt;/comment>. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(fpage)"/> &lt;fpage>, <xsl:value-of select="count(lpage)"/> &lt;lpage>,
      <xsl:value-of select="count(elocation-id)"/> &lt;elocation-id>, and 
      <xsl:value-of select="count(comment)"/> &lt;comment> elements.</report>
    
    <assert test="count(*) = count(person-group| year| article-title| source| volume| fpage| lpage| elocation-id| comment| pub-id)"
      role="error" 
      id="err-elem-cit-journal-12">[err-elem-cit-journal-12]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="journal" are:
        &lt;person-group>, &lt;year>, &lt;article-title>, &lt;source>, &lt;volume>, &lt;fpage>, &lt;lpage>, 
        &lt;elocation-id>, &lt;comment>, and &lt;pub-id>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='journal']/article-title" id="elem-citation-journal-article-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-journal-3-2">[err-elem-cit-journal-3-2]
      An &lt;article-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>

  <rule context="element-citation[@publication-type='journal']/volume" id="elem-citation-journal-volume">
  <assert test="count(*)=0 and (string-length(text()) ge 1)"
    role="error" 
    id="err-elem-cit-journal-5-1-2">[err-elem-cit-journal-5-1-2]
    A  &lt;volume> element within a &lt;element-citation> of type 'journal' must contain 
    at least one character and may not contain child elements.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters and/or
    child elements.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='journal']/fpage" id="elem-citation-journal-fpage">
    
    <assert test="count(../elocation-id) eq 0 and count(../comment) eq 0"
      role="error" 
      id="err-elem-cit-journal-6-2">[err-elem-cit-journal-6-2]
      If &lt;fpage> is present, neither &lt;elocation-id> nor &lt;comment>In press&lt;/comment> may be present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;fpage> and one of those elements.</assert>
    
    <assert test="matches(normalize-space(.),'^\d.*') or (substring(normalize-space(../lpage),1,1) = substring(normalize-space(.),1,1)) or count(../lpage) eq 0"
      role="error" 
      id="err-elem-cit-journal-6-6">[err-elem-cit-journal-6-6]
      If the content of &lt;fpage> begins with a letter, then the content of  &lt;lpage> must begin with 
      the same letter. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='journal']/elocation-id" id="elem-citation-journal-elocation-id">
    
    <assert test="count(../fpage) eq 0 and count(../comment) eq 0"
      role="error" 
      id="err-elem-cit-journal-6-3">[err-elem-cit-journal-6-3]
      If &lt;elocation-id> is present, neither &lt;fpage> nor &lt;comment>In press&lt;/comment> may be present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;elocation-id> and one of those elements.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='journal']/comment" id="elem-citation-journal-comment">
    
    <assert test="count(../fpage) eq 0 and count(../elocation-id) eq 0"
      role="error" 
      id="err-elem-cit-journal-6-4">[err-elem-cit-journal-6-4]
      If &lt;comment>In press&lt;/comment> is present, neither &lt;fpage> nor &lt;elocation-id> may be present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has one of those elements.</assert>
    
    <assert test="text() = 'In press'"
      role="error" 
      id="err-elem-cit-journal-13">[err-elem-cit-journal-13] 
      Comment elements with content other than 'In press' are not allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has such a &lt;comment> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='journal']/pub-id[@pub-id-type='pmid']" id="elem-citation-journal-pub-id-pmid">
    
    <report test="matches(.,'\D')"
      role="error" 
      id="err-elem-cit-journal-10">[err-elem-cit-journal-10]
      If &lt;pub-id pub-id-type="pmid"> the content must be all numeric. The content of 
      &lt;pub-id pub-id-type="pmid"> in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is <xsl:value-of select="."/>.</report>
    
  </rule>
  
  <rule context="element-citation[@publication-type='journal']/pub-id" id="elem-citation-journal-pub-id">
    
    <assert test="@pub-id-type='doi' or @pub-id-type='pmid'"
      role="error" 
      id="err-elem-cit-journal-9-1">[err-elem-cit-journal-9-1]
      Each &lt;pub-id>, if present, must have a @pub-id-type of either "doi" or "pmid". The pub-id-type
      attribute on &lt;pub-id> in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is <xsl:value-of select="@pub-id-type"/>.</assert>
    
  </rule>
  

</pattern>

<!-- ============= End Element Citation Journal Tests ============ -->