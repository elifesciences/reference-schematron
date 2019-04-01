<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="web"                           -->
<!--  VERSION    1.1                                               -->
<!--  LAST MOD   February 2017  (Created August 2016)              -->
<!--             Delivered as file "element-citation-web.sch"      -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="web">         -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="web">

       web-2: 
       1. There must be one and only one person-group in an element-citation. 
       2. the person-group-type must be "author"
       
       web-8:
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these tags: <italic>, <sub>, <sup>
       
       web-9:
       1. <source> may occur zero or one time.
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 

       web-10:
       1. The element <ext-link> is REQUIRED.
       2. If present, <ext-link> must contain @xlink:href 
       3. The value of @xlink:href must start with either "http://" or "https://" 
       4. The value of @xlink:href must equal the element content of <ext-link>
       
       web-11:
       1. date-in-citation is required.
       2. The attribute @iso-8601-date is required.
       3. The format of the element content must match month, space, day, comma, year.
       4. The element content date must match the @iso-8601-date value.
       
       web-12:
       The only elements that are allowed as children of <element-citation> if the publication-type="web" are:
        <person-group>, <year>,  <article-title>, <source>, <ext-link>, and <date-in-citation>.
 
-->


<pattern
   id="element-citation-web-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xlink="http://www.w3.org/1999/xlink">

<title>element-citation publication-type="web" Tests</title>
  
  <rule context="element-citation[@publication-type='web']" id="elem-citation-web">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-web-2-1">[err-elem-cit-web-2-1]
      There must be one and only one person-group. 
      Reference '<value-of select="ancestor::ref/@id"/>' has
      <value-of select="count(person-group)"/> &lt;person-group> 
      elements.</assert>

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-web-8-1">[err-elem-cit-web-8-1]
        Each  &lt;element-citation> of type 'web' must contain one and
        only one &lt;article-title> element.
        Reference '<value-of select="ancestor::ref/@id"/>' has 
        <value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <report test="count(source) > 1"
      role="error" 
      id="err-elem-cit-web-9-1">[err-elem-cit-web-9-1]
      Each  &lt;element-citation> of type 'web' may contain one and only one &lt;source> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(source)"/> &lt;source> elements.</report>
    
    <assert test="count(ext-link)=1"
      role="error" 
      id="err-elem-cit-web-10-1">[err-elem-cit-web-10-1]
      One and only one &lt;ext-link> element is required.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(ext-link)"/> 
      &lt;ext-link> elements.</assert>
    
    <assert test="count(date-in-citation)=1"
      role="error" 
      id="err-elem-cit-web-11-1">[err-elem-cit-web-11-1]
      One and only one &lt;date-in-citation> element is required.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(date-in-citation)"/> 
      &lt;date-in-citation> elements.</assert>

    <assert test="count(*) = count(person-group|article-title|source|year|ext-link|date-in-citation)"
      role="error" 
      id="err-elem-cit-web-12">[err-elem-cit-web-12]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="web" are:
      &lt;person-group>, &lt;article-title>, &lt;source>, &lt;year>, &lt;ext-link> and &lt;date-in-citation>.
      Reference '<value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='web']/person-group" id="elem-citation-web-person-group"> 
    
    <assert test="@person-group-type='author'"
      role="error" 
      id="err-elem-cit-web-2-2">[err-elem-cit-web-2-2]
      The &lt;person-group> element must contain @person-group-type='author'. The &lt;person-group> element in 
      Reference '<value-of select="ancestor::ref/@id"/>' contains @person-group-type='<value-of select="@person-group-type"/>'.</assert>
    
  </rule>

  <rule context="element-citation[@publication-type='web']/ext-link" id="elem-citation-web-ext-link"> 
        
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-web-10-2">[err-elem-cit-web-10-2]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-web-10-3">[err-elem-cit-web-10-3]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      is '<value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-web-10-4">[err-elem-cit-web-10-4]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<value-of select="@xlink:href"/>' and content '<value-of select="."/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='web']/article-title" id="elem-citation-web-article-title"> 
  <assert test="./string-length() + sum(*/string-length()) ge 2"
    role="error" 
    id="err-elem-cit-web-8-2-1">[err-elem-cit-web-8-2-1]
    A  &lt;article-title> element within a &lt;element-citation> of type 'web' must contain 
    at least two characters.
    Reference '<value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
  
  <assert test="count(*)=count(italic | sub | sup)"
    role="error" 
    id="err-elem-cit-web-8-2-2">[err-elem-cit-web-8-2-2]
    A  &lt;article-title> element within a &lt;element-citation> of type 'web' may only contain the child 
    elements&lt;italic>, &lt;sub>, and &lt;sup>. 
    No other elements are allowed.
    Reference '<value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='web']/source" id="elem-citation-web-source"> 
    <assert test="./string-length() + sum(*/string-length()) ge 2"
      role="error" 
      id="err-elem-cit-web-9-2-1">[err-elem-cit-web-9-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'web' must contain 
      at least two characters.
      Reference '<value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(*)=count(italic | sub | sup)"
      role="error" 
      id="err-elem-cit-web-9-2-2">[err-elem-cit-web-9-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'web' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='web']/date-in-citation" id="elem-citation-web-date-in-citation"> 
    <assert test="./@iso-8601-date"
      role="error" 
      id="err-elem-cit-web-11-2-1">[err-elem-cit-web-11-2-1]
      The &lt;date-in-citation> element must have an @iso-8601-date attribute.
      Reference '<value-of select="ancestor::ref/@id"/>' does not.
    </assert>
    
    <assert test="matches(./@iso-8601-date,'^\d{4}-\d{2}-\d{2}$')"
      role="error" 
      id="err-elem-cit-web-11-2-2">[err-elem-cit-web-11-2-2]
      The &lt;date-in-citation> element's @iso-8601-date attribute must have the format
      'YYYY-MM-DD'.
      Reference '<value-of select="ancestor::ref/@id"/>' has '<value-of select="@iso-8601-date"/>',
      which does not have that format.
    </assert>

    <assert test="matches(normalize-space(.),'^(January|February|March|April|May|June|July|August|September|October|November|December) \d{1,2}, \d{4}')"
      role="error" 
      id="err-elem-cit-web-11-3">[err-elem-cit-web-11-3]
      The format of the element content must match month, space, day, comma, year.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="."/>.</assert>
    
    <!-- issue 5 on the eLife lists -->
    <report test="if (string-length(@iso-8601-date) = 10) then format-date(xs:date(@iso-8601-date), '[MNn] [D], [Y]')!=.
      else (string-length(@iso-8601-date) &lt; 10)" role="error" id="err-elem-cit-web-11-4">[err-elem-cit-web-11-4]
      The element content date must match the @iso-8601-date value.
      Reference '<value-of select="ancestor::ref/@id"/>' has element content of 
      <value-of select="."/> but an @iso-8601-date value of 
      <value-of select="@iso-8601-date"/>.</report>
    
  </rule>
  
</pattern>

<!-- ============= End Element Citation web Tests ============ -->
