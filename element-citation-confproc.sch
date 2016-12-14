<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="confproc"                      -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created October 2016)             -->
<!--             Delivered as file "element-citation-confproc.sch" -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="confproc">    -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="confproc">
     
       confproc-2:
       1. There must be one and only one person-group in an 
       element-citation. 
       2. the person-group-type must be "author"
       
       confproc-8:
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>
       These rules only apply to the <article-title> element in the 
       context of <element-citation>, not to any other context. 
       
       confproc-9: 
       1. <source> is optional. 
       2. <source>, if present, must contain at least 2 characters and may only contain <sub>, <sup> and <italic>.
       
       confproc-10:
       1. <conf-name> is required.
       2. <conf-name> may have text content only; no internal elements.
       
       confproc-11:
       1. <conf-loc> is optional
       2. <conf-loc> may have text content only; no internal elements.
       
       confproc-12:
       Page identification is optional, but if present must be one of the below scenarios:
       <fpage>/ <lpage>
       <fpage>
       <elocation-id>
       1. Mixtures of the above scenarios are not allowed.
       2. No more than one of each element is allowed.
       3. The first page must always have a larger value than last page.
       4. The content of the elements can contain any alpha numeric value but no formatting is allowed.
       5. If the content of <fpage> begins with a letter, then the content of <lpage> must begin with 
      the same letter.
       The reverse, however, is not true - can have a <fpage> starting with a number and a <lpage> 
       that starts with a letter.
       
       confproc-14:
       1. <ext-link>, if present, must contain @xlink:href.
       2. The value of @xlink:href must start with either "http://" or "https://".
       3. The value of @xlink:href must equal the element content of <ext-link>.
       
       confproc-15:
       1. There may be at most one <pub-id>.
       2. The <pub-id>, if present, must have @pub-id-type='doi' or 'pmid'.
       
       confproc-15:
       The only elements that are allowed as children of <element-citation> if the publication-type="confproc" are:
       <person-group>, <year>,  <source>, <publisher-loc>, <publisher-name>, <pub-id>, and <ext-link>. 
-->

<pattern
   id="element-citation-confproc-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="confproc" Tests</title>
             
  <rule context="element-citation[@publication-type='confproc']" id="elem-citation-confproc"> 
    
    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-confproc-2-1">[err-elem-cit-confproc-2-1]
      One and only one person-group element is allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="count(article-title)=1"
      role="error" 
      id="err-elem-cit-confproc-8-1">[err-elem-cit-confproc-8-1]
      Each  &lt;element-citation> of type 'confproc' must contain one and
      only one &lt;article-title> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(source) le 1"
      role="error" 
      id="err-elem-cit-confproc-9-1">[err-elem-confproc-confproc-9-1]
      Each  &lt;element-citation> of type 'confproc' may contain one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(conf-name)=1"
      role="error" 
      id="err-elem-cit-confproc-10-1">[err-elem-cit-confproc-10-1]
      &lt;conf-name> is required.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(conf-name)"/>
      &lt;conf-name> elements.</assert>
    
    <report test="(fpage and elocation-id) or (lpage and elocation-id)"
      role="error" 
      id="err-elem-cit-confproc-12-1">[err-elem-cit-confproc-12-1]
      The citation may contain &lt;fpage> and &lt;lpage>, only &lt;fpage>, or only &lt;elocation-id> elements, but not a mixture.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(fpage)"/>
      &lt;fpage> elements,  <xsl:value-of select="count(lpage)"/> &lt;lpage> elements, and 
      <xsl:value-of select="count(elocation-id)"/> &lt;elocation-id> elements.</report>
    
    <report test="count(fpage) gt 1 or count(lpage) gt 1 or count(elocation-id) gt 1"
      role="error" 
      id="err-elem-cit-confproc-12-2">[err-elem-cit-confproc-12-2]
      The citation may contain no more than one of any of &lt;fpage>, &lt;lpage>, and &lt;elocation-id> elements.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(fpage)"/>
      &lt;fpage> elements,  <xsl:value-of select="count(lpage)"/> &lt;lpage> elements, and 
      <xsl:value-of select="count(elocation-id)"/> &lt;elocation-id> elements.</report>
    
    <report test="(lpage and fpage) and (fpage ge lpage)"
      role="error" 
      id="err-elem-cit-confproc-12-3">[err-elem-cit-confproc-12-3]
      If both &lt;lpage> and &lt;fpage> are present, the value of &lt;fpage> must be less than the value of &lt;lpage>. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;lpage> <xsl:value-of select="lpage"/>, which is 
      less than or equal to &lt;fpage> <xsl:value-of select="fpage"/>.</report>
    
    <assert test="count(fpage/*)=0 and count(lpage/*)=0"
      role="error" 
      id="err-elem-cit-confproc-12-4">[err-elem-cit-confproc-12-4]
      The content of the &lt;fpage> and &lt;lpage> elements can contain any alpha numeric value but no child elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(fpage/*)"/> child elements in
      &lt;fpage> and  <xsl:value-of select="count(lpage/*)"/> child elements in &lt;lpage>.</assert>     
    
    <assert test="count(pub-id) le 1"
      role="error" 
      id="err-elem-cit-confproc-16-1">[err-elem-cit-confproc-16-1]
      A maximum of one &lt;pub-id> element is allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(pub-id)"/>
      &lt;pub-id> elements.</assert>
    
    <assert test="count(*) = count(person-group | article-title | year| source | conf-loc | conf-name | lpage | 
      fpage | elocation-id | ext-link | pub-id)"
      role="error" 
      id="err-elem-cit-confproc-17">[err-elem-cit-confproc-17]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="confproc" are:
      &lt;person-group>, &lt;year>, &lt;article-title>, &lt;source>, &lt;conf-loc>, &lt;conf-name>, 
      &lt;fpage>, &lt;lpage>, &lt;elocation-id>, &lt;ext-link>, and &lt;pub-id>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/person-group" id="elem-citation-confproc-preson-group">
    <assert test="@person-group-type='author'"
      role="error" 
      id="err-elem-cit-confproc-2-2">[err-elem-cit-confproc-2-2]
      Each &lt;person-group> must have a @person-group-type attribute of type 'author'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;person-group> 
      element with @person-group-type attribute '<xsl:value-of select="@person-group-type"/>'.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/source" id="elem-citation-confproc-source">
  <assert test="(./string-length() + sum(*/string-length()) ge 2)"
    role="error" 
    id="err-elem-cit-confproc-9-2-1">[err-elem-cit-confproc-9-2-1]
    A  &lt;source> element within a &lt;element-citation> of type 'confproc' must contain 
    at least two characters.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
  
  <assert test="count(*)=count(italic | sub | sup)"
    role="error" 
    id="err-elem-cit-confproc-9-2-2">[err-elem-cit-confproc-9-2-2]
    A  &lt;source> element within a &lt;element-citation> of type 'confproc' may may only contain the child 
    elements&lt;italic>, &lt;sub>, and &lt;sup>. 
    No other elements are allowed.
    Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements that are not allowed.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/article-title" id="elem-citation-confproc-article-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-confproc-8-2">[err-elem-cit-confproc-8-2]
      An &lt;article-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/conf-name" id="elem-citation-confproc-conf-name">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-confproc-10-2">[err-elem-cit-confproc-10-2]
      No elements are allowed inside &lt;conf-name>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;conf-name> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/conf-loc" id="elem-citation-confproc-conf-loc">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-confproc-11-2">[err-elem-cit-confproc-11-2]
      No elements are allowed inside &lt;conf-loc>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;conf-loc> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/fpage" id="elem-citation-confproc-fpage">
    
    <assert test="matches(normalize-space(.),'^\d.*') or (substring(normalize-space(../lpage),1,1) = substring(normalize-space(.),1,1))"
      role="error" 
      id="err-elem-cit-confproc-12-5">[err-elem-cit-confproc-12-5]
      If the content of &lt;fpage> begins with a letter, then the content of &lt;lpage> must begin with 
      the same letter. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;fpage>='<xsl:value-of select="."/>'
      and &lt;lpage>='<xsl:value-of select="../lpage"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/pub-id" id="elem-citation-confproc-pub-id">
    
    <assert test="@pub-id-type='doi' or @pub-id-type='pmid'"
      role="error" 
      id="err-elem-cit-confproc-16-2">[err-elem-cit-confproc-16-2]
      The only allowed pub-id types are 'doi' pr 'pmid'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a pub-id type of 
      '<xsl:value-of select="@pub-id-type"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='confproc']/ext-link" id="elem-citation-confproc-ext-link"> 
    
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-confproc-14-1">[err-elem-cit-confproc-14-1]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-confproc-14-2">[err-elem-cit-confproc-14-2]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is '<xsl:value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-confproc-14-3">[err-elem-cit-confproc-14-3]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<xsl:value-of select="@xlink:href"/>' and content '<xsl:value-of select="."/>'.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation confproc Tests ============ -->