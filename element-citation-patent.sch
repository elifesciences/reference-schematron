<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="patent"                        -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   September 2016  (Created August 2016)             -->
<!--             Delivered as file "element-citation-patent.sch"  -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="patent">      -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="patent">

       patent-2: 
       1. There must be one person-group with @person-group-type="inventor". 
       3. The only allowable values of @person-group-type are "inventor" and "assignee".
       2A. There may be zero or one person-group with @person-group-type="assignee".
       
       patent-8:
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these tags: <italic>, <sub>, <sup>
       
       patent-9:
       1. <source> must occur once.
       UPDATE: <source> is actually a required element - rule changed accordingly
       
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 
       
       patent-10:
       1. The element <patent> is required. 
       2. The @country attribute not required, but if present must have values from the list.

       patent-11:
       1. The element <ext-link> is REQUIRED
       2. <ext-link> must contain @xlink:href 
       3. The value of @xlink:href must start with either "http://" or "https://" 
       4. The value of @xlink:href must equal the element content of <ext-link>
       
       patent-12:
       the only tags that are allowed as children of <element-citation> if the publication-type="patent" are:
        <person-group>, <year>,  <article-title>, <source>, <patent>, <ext-link>.
 
-->


<pattern
   id="element-citation-patent-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xlink="http://www.w3.org/1999/xlink">

<title>element-citation publication-type="patent" Tests</title>
  
  <rule context="element-citation[@publication-type='patent']" id="elem-citation-patent">

    <assert test="count(person-group[@person-group-type='inventor'])=1"
      role="error" 
      id="err-elem-cit-patent-2-1">[err-elem-cit-patent-2-1]
      There must be one person-group with @person-group-type="inventor". 
      Reference '<value-of select="ancestor::ref/@id"/>' has
      <value-of select="count(person-group[@person-group-type='inventor'])"/> &lt;person-group> 
      elements of type 'inventor'.</assert>
    
    <assert test="every $type in person-group/@person-group-type
      satisfies $type = ('assignee','inventor')"
      role="error" 
      id="err-elem-cit-patent-2-3">[err-elem-cit-patent-2-3]
      The only allowed types of person-group elements are "assignee" and "inventor".
      Reference '<value-of select="ancestor::ref/@id"/>' has &lt;person-group> elements of other types.</assert>
    
    <assert test="count(person-group[@person-group-type='assignee']) le 1"
      role="error" 
      id="err-elem-cit-patent-2A">[err-elem-cit-patent-2A]
      There may be zero or one person-group elements with @person-group-type="assignee" 
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(person-group[@person-group-type='assignee'])"/> &lt;person-group> elements of type
      'assignee'.</assert>

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-patent-8-1">[err-elem-cit-patent-8-1]
        Each  &lt;element-citation> of type 'patent' must contain one and
        only one &lt;article-title> element.
        Reference '<value-of select="ancestor::ref/@id"/>' has 
        <value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(source) = 1"
      role="error" 
      id="err-elem-cit-patent-9-1">[err-elem-cit-patent-9-1]
      Each  &lt;element-citation> of type 'patent' must contain one and only one &lt;source> elements.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="patent"
      role="error" 
      id="err-elem-cit-patent-10-1-1">[err-elem-cit-patent-10-1-1]
      The  &lt;patent> element is required. 
      Reference '<value-of select="ancestor::ref/@id"/>' has no &lt;patent> elements.</assert>
    
    <assert test="ext-link"
      role="error" 
      id="err-elem-cit-patent-11-1">[err-elem-cit-patent-11-1]
      The &lt;ext-link> element is required.
      Reference '<value-of select="ancestor::ref/@id"/>' has no &lt;ext-link> elements.</assert>

    <assert test="count(*) = count(person-group| article-title| source| year| patent| ext-link)"
      role="error" 
      id="err-elem-cit-patent-18">[err-elem-cit-patent-18]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="patent" are:
      &lt;person-group>, &lt;article-title>, &lt;source>, &lt;year>, &lt;patent>, and &lt;ext-link>.
      Reference '<value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>

  <rule context="element-citation[@publication-type='patent']/ext-link" id="elem-citation-patent-ext-link"> 
        
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-patent-11-2">[err-elem-cit-patent-11-2]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-patent-11-3">[err-elem-cit-patent-11-3]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      is '<value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-patent-11-4">[err-elem-cit-patent-11-4]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<value-of select="@xlink:href"/>' and content '<value-of select="."/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='patent']/article-title" id="elem-citation-patent-article-title"> 
  <assert test="./string-length() + sum(*/string-length()) ge 2"
    role="error" 
    id="err-elem-cit-patent-8-2-1">[err-elem-cit-patent-8-2-1]
    A  &lt;article-title> element within a &lt;element-citation> of type 'patent' must contain 
    at least two characters.
    Reference '<value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
  
  <assert test="count(*)=count(italic | sub | sup)"
    role="error" 
    id="err-elem-cit-patent-8-2-2">[err-elem-cit-patent-8-2-2]
    A  &lt;article-title> element within a &lt;element-citation> of type 'patent' may only contain the child 
    elements&lt;italic>, &lt;sub>, and &lt;sup>. 
    No other elements are allowed.
    Reference '<value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='patent']/source" id="elem-citation-patent-source"> 
    <assert test="./string-length() + sum(*/string-length()) ge 2"
      role="error" 
      id="err-elem-cit-patent-9-2-1">[err-elem-cit-patent-9-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'patent' must contain 
      at least two characters.
      Reference '<value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(*)=count(italic | sub | sup)"
      role="error" 
      id="err-elem-cit-patent-9-2-2">[err-elem-cit-patent-9-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'patent' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='patent']/patent" id="elem-citation-patent-patent"> 
    <let name="countries" value="'countries.xml'"/>
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-patent-10-1-2">[err-elem-cit-patent-10-1-2]
      The  &lt;patent> element may not have child elements.
      Reference '<value-of select="ancestor::ref/@id"/>' has child elements.</assert>
    
    <assert test="some $x in document($countries)/countries/country satisfies ($x=@country)"
      role="error" 
      id="err-elem-cit-patent-10-2">[err-elem-cit-patent-10-2]
      The &lt;patent> element must have a country attribute, the value of which must be an allowed value.
      Reference '<value-of select="ancestor::ref/@id"/>' has a patent/@country attribute with the value 
      '<value-of select="@country"/>', which is not in the list.</assert>

  </rule>
</pattern>

<!-- ============= End Element Citation Patent Tests ============ -->