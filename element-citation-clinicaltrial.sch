<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="clinicaltrial"                 -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file                                 -->
<!--             "element-citation-clinicaltrial.sch"              -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--         <element-citation publication-type="clinicaltrial">   -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="clinicaltrial">

       clinicaltrial-2: 
       1. There must be one and only one <person-group>.
       2. The @person-group-type is required and may be any of these values: 
       author, collaborator, or sponsor
     
       clinicaltrial-8: 
       1. <article-title> must occur once and only once
       2. <article-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>
       
       clinicaltrial-10:
       1. The <ext-link element is required.
       2. <ext-link> must contain @xlink:href.
       3. The value of @xlink:href must start with either "http://" or "https://"
       4. The value of @xlink:href must be the same as the element content of <ext-link>.
       
       clinicaltrial-11:
       The only tags that are allowed as children of <element-citation> with the publication-type="clinicaltrial" are:
       <person-group>, <year>, <article-title>, <source>, and <ext-link>. 
 
-->

<pattern
   id="element-citation-clinicaltrial-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron">

<title>element-citation publication-type="clinicaltrial" Tests</title>
             
  <rule context="element-citation[@publication-type='clinicaltrial']" id="elem-citation-clinicaltrial">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-clinicaltrial-2-1">[err-elem-cit-clinicaltrial-2-1]
      Each  &lt;element-citation> of type 'clinicaltrial' must contain one and
      only one &lt;person-group> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="person-group[@person-group-type=('author', 'collaborator', 'sponsor')]"
              role="error" 
              id="err-elem-cit-clinicaltrial-2-2">[err-elem-cit-clinicaltrial-2-2]
Each  &lt;element-citation> of type 'clinicaltrial' must contain one &lt;person-group> 
with the attribute person-group-type set to 'author', 'collaborator', or 'sponsor'. Reference 
'<value-of select="ancestor::ref/@id"/>' has a  &lt;person-group> type of 
'<value-of select="person-group/@person-group-type"/>'.</assert> 

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-clinicaltrial-8-1">[err-elem-cit-clinicaltrial-8-1]
        Each  &lt;element-citation> of type 'clinicaltrial' must contain one and
        only one &lt;article-title> element.
        Reference '<value-of select="ancestor::ref/@id"/>' has 
        <value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(ext-link)=1"
      role="error" 
      id="err-elem-cit-clinicaltrial-10-1">[err-elem-cit-clinicaltrial-10-1]
      Each  &lt;element-citation> of type 'clinicaltrial' must contain one and
      only one &lt;ext-link> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(ext-link)"/> &lt;ext-link> elements.</assert>
    
    <assert test="count(*) = count(person-group| year| article-title| source| ext-link)"
      role="error" 
      id="err-elem-cit-clinicaltrial-11">[err-elem-cit-clinicaltrial-11]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="clinicaltrial" are:
        &lt;person-group>, &lt;year>, &lt;article-title>, &lt;source>, and &lt;ext-link>
      Reference '<value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='clinicaltrial']/article-title" id="elem-citation-clinicaltrial-article-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-clinicaltrial-8-2">[err-elem-cit-clinicaltrial-8-2]
      An &lt;article-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='clinicaltrial']/ext-link" id="elem-citation-clinicaltrial-ext-link"> 
    
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-clinicaltrial-10-2">[err-elem-cit-clinicaltrial-10-2]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-clinicaltrial-10-3">[err-elem-cit-clinicaltrial-10-3]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      is '<value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-clinicaltrial-10-4">[err-elem-cit-clinicaltrial-10-4]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<value-of select="@xlink:href"/>' and content '<value-of select="."/>'.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Clinical Trial Tests ============ -->