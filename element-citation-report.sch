<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="report"                        -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   October 2016  (Created October 2016)              -->
<!--             Delivered as file "element-citation-report.sch"   -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="report">      -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="report">
     
       report-2:
       1. There must be one and only one person-group in an 
       element-citation. 
       2. the person-group-type must be "author"
       
       report-9: 
       1. <source> must occur once and only once 
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 
       
       report-10:
       see pre-edit
       
       report-11:
       1. <publisher-name> is required
       2. No elements allowed inside <publisher-name>
       3. Warn if the content of <publisher-name> ends with a string from an external file of 
       common publisher locations. 
       
       report-12:
       Each <pub-id>, if present, must have a @pub-id-type of one of these values: doi, isbn.
       
       report-14:
       1. <ext-link> must contain @xlink:href.
       2. The value of @xlink:href must start with either "http://" or "https://".
       3. The value of @xlink:href must equal the element content of <ext-link>.
       
       report-15:
       The only elements that are allowed as children of <element-citation> if the publication-type="report" are:
       <person-group>, <year>,  <source>, <publisher-loc>, <publisher-name>, <pub-id>, and <ext-link>. 
-->

<pattern
   id="element-citation-report-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="report" Tests</title>
             
  <rule context="element-citation[@publication-type='report']" id="elem-citation-report">
    <let name="publisher-locations" value="'publisher-locations.xml'"/> 
    
    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-report-2-1">[err-elem-cit-report-2-1]
      One and only one person-group element is allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="count(source)=1"
      role="error" 
      id="err-elem-cit-report-9-1">[err-elem-report-report-9-1]
      Each  &lt;element-citation> of type 'report' must contain one and
      only one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(publisher-name)=1"
      role="error" 
      id="err-elem-cit-report-11-1">[err-elem-cit-report-11-1]
      &lt;publisher-name> is required.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(publisher-name)"/>
      &lt;publisher-name> elements.</assert>
    
    <report test="some $p in document($publisher-locations)/locations/location/text()
      satisfies ends-with(publisher-name,$p)"
      role="warning" 
      id="warning-elem-cit-report-11-3">[warning-elem-cit-report-11-3]
      The content of &lt;publisher-name> may not end with a publisher location. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' contains the string <xsl:value-of select="publisher-name"/>,
      which ends with a publisher location.</report>
    
    <assert test="count(*) = count(person-group| year| source| publisher-loc|publisher-name| ext-link| pub-id)"
      role="error" 
      id="err-elem-cit-report-15">[err-elem-cit-report-15]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="report" are:
      &lt;person-group>, &lt;year>, &lt;source>, &lt;publisher-loc>, &lt;publisher-name>, &lt;ext-link>, and &lt;pub-id>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='report']/person-group" id="elem-citation-report-preson-group">
    <assert test="@person-group-type='author'"
      role="error" 
      id="err-elem-cit-report-2-2">[err-elem-cit-report-2-2]
      Each &lt;person-group> must have a @person-group-type attribute of type 'author'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;person-group> 
      element with @person-group-type attribute '<xsl:value-of select="@person-group-type"/>'.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='report']/source" id="elem-citation-report-source">
  <assert test="(./string-length() + sum(*/string-length()) ge 2)"
    role="error" 
    id="err-elem-cit-report-9-2-1">[err-elem-cit-report-9-2-1]
    A  &lt;source> element within a &lt;element-citation> of type 'report' must contain 
    at least two characters.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
  
  <assert test="count(*)=count(italic | sub | sup)"
    role="error" 
    id="err-elem-cit-report-9-2-2">[err-elem-cit-report-9-2-2]
    A  &lt;source> element within a &lt;element-citation> of type 'report' may only contain the child 
    elements&lt;italic>, &lt;sub>, and &lt;sup>. 
    No other elements are allowed.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements that are not allowed.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='report']/publisher-name" id="elem-citation-report-publisher-name">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-report-11-2">[err-elem-cit-report-11-2]
      No elements are allowed inside &lt;publisher-name>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;publisher-name> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='report']/pub-id" id="elem-citation-report-pub-id">
    
    <assert test="@pub-id-type='doi' or @pub-id-type='isbn'"
      role="error" 
      id="err-elem-cit-report-12-2">[err-elem-cit-report-12-2]
      The only allowed pub-id types are 'doi' and 'isbn'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a pub-id type of 
      '<xsl:value-of select="@pub-id-type"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='report']/ext-link" id="elem-citation-report-ext-link"> 
    
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-report-14-1">[err-elem-cit-report-14-1]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-report-14-2">[err-elem-cit-report-14-2]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is '<xsl:value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-report-14-3">[err-elem-cit-report-14-3]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<xsl:value-of select="@xlink:href"/>' and content '<xsl:value-of select="."/>'.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Technical Report Tests ============ -->