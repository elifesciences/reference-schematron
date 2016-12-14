<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="preprint"                      -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   October 2016  (Created August 2016)               -->
<!--             Delivered as file "element-citation-preprint.sch" -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="preprint">    -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="preprint">

       preprint-2: 
       1. There must be one and only one person-group in an element-citation. 
       2. the person-group-type must be "author"
       
       preprint-8:
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these tags: <italic>, <sub>, <sup>
       
       preprint-9:
       1. <source> may occur zero or one time.
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 
       
       preprint-10:
       1. Only one pub-id element is allowed.
       2. If pub-id is present, the pub-id-type must be 'doi'.
       3. If no pub-id is present, the ext-link element is required.

       preprint-11:
       1. The element <ext-link> is REQUIRED if there is no pub-id with pub-id-type='doi'.
       2. If present, <ext-link> must contain @xlink:href 
       3. The value of @xlink:href must start with either "http://" or "https://" 
       4. The value of @xlink:href must equal the element content of <ext-link>
       
       preprint-13:
       the only tags that are allowed as children of <element-citation> if the publication-type="preprint" are:
        <person-group>, <year>,  <article-title>, <source>, <pub-id>, <ext-link>.
 
-->


<pattern
   id="element-citation-preprint-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xlink="http://www.w3.org/1999/xlink">

<title>element-citation publication-type="preprint" Tests</title>
  
  <rule context="element-citation[@publication-type='preprint']" id="elem-citation-preprint">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-preprint-2-1">[err-elem-cit-preprint-2-1]
      There must be one and only one person-group. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has
      <xsl:value-of select="count(person-group)"/> &lt;person-group> 
      elements.</assert>

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-preprint-8-1">[err-elem-cit-preprint-8-1]
        Each  &lt;element-citation> of type 'preprint' must contain one and
        only one &lt;article-title> element.
        Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
        <xsl:value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(source) = 1"
      role="error" 
      id="err-elem-cit-preprint-9-1">[err-elem-cit-preprint-9-1]
      Each  &lt;element-citation> of type 'preprint' must contain one and only one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(pub-id) le 1"
      role="error" 
      id="err-elem-cit-preprint-10-1">[err-elem-cit-preprint-10-1]
      One &lt;pub-id> element is allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(pub-id)"/> &lt;pub-id> elements.</assert>
    
    <assert test="count(pub-id)=1 or count(ext-link)=1"
      role="error" 
      id="err-elem-cit-preprint-10-3">[err-elem-cit-preprint-10-3]
      Either one &lt;pub-id> or one &lt;ext-link> element is required.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(pub-id)"/> &lt;pub-id> elements
      and <xsl:value-of select="count(ext-link)"/> &lt;ext-link> elements.</assert>

    <assert test="count(*) = count(person-group| article-title| source| year| pub-id| ext-link)"
      role="error" 
      id="err-elem-cit-preprint-13">[err-elem-cit-preprint-13]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="preprint" are:
      &lt;person-group>, &lt;article-title>, &lt;source>, &lt;year>, &lt;pub-id>, and &lt;ext-link>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='preprint']/person-group" id="elem-citation-preprint-person-group"> 
    
    <assert test="@person-group-type='author'"
      role="error" 
      id="err-elem-cit-preprint-2-2">[err-elem-cit-preprint-2-2]
      The &lt;person-group> element must contain @person-group-type='author'. The &lt;person-group> element in 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' contains @person-group-type='<xsl:value-of select="@person-group-type"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='preprint']/pub-id" id="elem-citation-preprint-pub-id"> 
    
    <assert test="@pub-id-type='doi'"
      role="error" 
      id="err-elem-cit-preprint-10-2">[err-elem-cit-preprint-10-2]
      If present, the &lt;pub-id> element must contain @pub-id-type='doi'. The &lt;pub-id> element in 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' contains 
      @pub-id-type='<xsl:value-of select="@pub-id-type"/>'.</assert>
    
  </rule>

  <rule context="element-citation[@publication-type='preprint']/ext-link" id="elem-citation-preprint-ext-link"> 
        
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-preprint-11-1">[err-elem-cit-preprint-11-1]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-preprint-11-2">[err-elem-cit-preprint-11-2]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is '<xsl:value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-preprint-11-3">[err-elem-cit-preprint-11-3]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<xsl:value-of select="@xlink:href"/>' and content '<xsl:value-of select="."/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='preprint']/article-title" id="elem-citation-preprint-article-title"> 
  <assert test="./string-length() + sum(*/string-length()) ge 2"
    role="error" 
    id="err-elem-cit-preprint-8-2-1">[err-elem-cit-preprint-8-2-1]
    A  &lt;article-title> element within a &lt;element-citation> of type 'preprint' must contain 
    at least two characters.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
  
  <assert test="count(*)=count(italic | sub | sup)"
    role="error" 
    id="err-elem-cit-preprint-8-2-2">[err-elem-cit-preprint-8-2-2]
    A  &lt;article-title> element within a &lt;element-citation> of type 'preprint' may only contain the child 
    elements&lt;italic>, &lt;sub>, and &lt;sup>. 
    No other elements are allowed.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='preprint']/source" id="elem-citation-preprint-source"> 
    <assert test="./string-length() + sum(*/string-length()) ge 2"
      role="error" 
      id="err-elem-cit-preprint-9-2-1">[err-elem-cit-preprint-9-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'preprint' must contain 
      at least two characters.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(*)=count(italic | sub | sup)"
      role="error" 
      id="err-elem-cit-preprint-9-2-2">[err-elem-cit-preprint-9-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'preprint' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
  </rule>
  
</pattern>

<!-- ============= End Element Citation Preprint Tests ============ -->