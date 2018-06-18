<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="thesis"                        -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   October 2016  (Created October 2016)              -->
<!--             Delivered as file "element-citation-thesis.sch"   -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="thesis">      -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="thesis">
     
       thesis-2:
       1. There must be one and only one person-group in an 
       element-citation. 
       2. The person-group-type must be "author".
       3. Only one author is allowed.
       
       thesis-3:
       <collab> is not allowed.
       
       thesis-6:
       <etal> is not allowed.
       
       thesis-8:
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>
       These rules only apply to the <article-title> element in the 
       context of <element-citation>, not to any other context. 
       
       thesis-9:
       1. <publisher-name> is required.
       2. <publisher-name> may have text content only; no internal elements.
       
       thesis-10:
       1. <publisher-loc> is optional
       2. <publisher-loc> may have text content only; no internal elements.
       
       thesis-11:
       1. There may be at most one <pub-id>.
       2. The <pub-id>, if present, must have @pub-id-type='doi'.
       
       thesis-12:
       1. <ext-link>, if present, must contain @xlink:href.
       2. The value of @xlink:href must start with either "http://" or "https://".
       3. The value of @xlink:href must equal the element content of <ext-link>.
       
       thesis-13:
       The only elements that are allowed as children of <element-citation> if the publication-type="thesis" are:
       <person-group>, <year>,  <source>, <publisher-loc>, <publisher-name>, <pub-id>, and <ext-link>. 
-->

<pattern
   id="element-citation-thesis-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="thesis" Tests</title>
             
  <rule context="element-citation[@publication-type='thesis']" id="elem-citation-thesis"> 
    
    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-thesis-2-1">[err-elem-cit-thesis-2-1]
      One and only one person-group element is allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="count(collab)=0"
      role="error" 
      id="err-elem-cit-thesis-3">[err-elem-cit-thesis-3]
      No &lt;collab> elements are allowed in thesis citations.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(collab)"/> &lt;collab> elements.</assert>
    
    <assert test="count(etal)=0"
      role="error" 
      id="err-elem-cit-thesis-6">[err-elem-cit-thesis-6]
      No &lt;etal> elements are allowed in thesis citations.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(etal)"/> &lt;etal> elements.</assert>
    
    <assert test="count(article-title)=1"
      role="error" 
      id="err-elem-cit-thesis-8-1">[err-elem-cit-thesis-8-1]
      Each  &lt;element-citation> of type 'thesis' must contain one and
      only one &lt;article-title> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(publisher-name)=1"
      role="error" 
      id="err-elem-cit-thesis-9-1">[err-elem-cit-thesis-9-1]
      &lt;publisher-name> is required.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(publisher-name)"/>
      &lt;publisher-name> elements.</assert>
            
    <assert test="count(pub-id) le 1"
      role="error" 
      id="err-elem-cit-thesis-11-1">[err-elem-cit-thesis-11-1]
      A maximum of one &lt;pub-id> element is allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(pub-id)"/>
      &lt;pub-id> elements.</assert>
    
    <assert test="count(*) = count(person-group | article-title | year| source | publisher-loc | publisher-name | ext-link | pub-id)"
      role="error" 
      id="err-elem-cit-thesis-13">[err-elem-cit-thesis-13]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="thesis" are:
      &lt;person-group>, &lt;year>, &lt;article-title>, &lt;source>, &lt;publisher-loc>, &lt;publisher-name>, 
      &lt;ext-link>, and &lt;pub-id>.
      Reference '<value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/person-group" id="elem-citation-thesis-preson-group">
    
    <assert test="@person-group-type='author'"
      role="error" 
      id="err-elem-cit-thesis-2-2">[err-elem-cit-thesis-2-2]
      Each &lt;person-group> must have a @person-group-type attribute of type 'author'.
      Reference '<value-of select="ancestor::ref/@id"/>' has a &lt;person-group> 
      element with @person-group-type attribute '<value-of select="@person-group-type"/>'.</assert>
    
    <assert test="count(name)=1"
      role="error" 
      id="err-elem-cit-thesis-2-3">[err-elem-cit-thesis-2-3]
      Each thesis citation must have one and only one author.
      Reference '<value-of select="ancestor::ref/@id"/>' has a thesis citation 
      with <value-of select="count(name)"/> authors.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/article-title" id="elem-citation-thesis-article-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-thesis-8-2">[err-elem-cit-thesis-8-2]
      An &lt;article-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/publisher-name" id="elem-citation-thesis-publisher-name">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-thesis-9-2">[err-elem-cit-thesis-9-2]
      No elements are allowed inside &lt;publisher-name>.
      Reference '<value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;publisher-name> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/publisher-loc" id="elem-citation-thesis-publisher-loc">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-thesis-10-2">[err-elem-cit-thesis-10-2]
      No elements are allowed inside &lt;publisher-loc>.
      Reference '<value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;publisher-loc> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/pub-id" id="elem-citation-thesis-pub-id">
    
    <assert test="@pub-id-type='doi'"
      role="error" 
      id="err-elem-cit-thesis-11-2">[err-elem-cit-thesis-11-2]
      The only allowed pub-id type is 'doi'.
      Reference '<value-of select="ancestor::ref/@id"/>' has a pub-id type of 
      '<value-of select="@pub-id-type"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='thesis']/ext-link" id="elem-citation-thesis-ext-link"> 
    
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-thesis-12-1">[err-elem-cit-thesis-12-1]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-thesis-12-2">[err-elem-cit-thesis-12-2]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      is '<value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-thesis-12-3">[err-elem-cit-thesis-12-3]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<value-of select="@xlink:href"/>' and content '<value-of select="."/>'.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Thesis Tests ============ -->