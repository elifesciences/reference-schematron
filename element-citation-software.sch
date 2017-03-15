<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="software"                      -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--             Delivered as file                                 -->
<!--             "element-citation-software.sch"                   -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="software">    -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="software">

       software-2: 
       1. There must be one and only one <person-group>.
       2. The @person-group-type is required and must be any of these values: 
       author or curator
     
       software-10: 
       1. <data-title> may occur once and is optional.
       2. <data-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>
       
       software-15:
       1. <ext-link> must contain @xlink:href.
       2. The value of @xlink:href must start with either "http://" or "https://"
       3. The value of @xlink:href must be the same as the element content of <ext-link>.
       
       software-16:
       The only tags that are allowed as children of <element-citation> with the publication-type="software" are:
       <person-group>, <year>, data-title>, <source>, <version>, <publisher-name>, <publisher-loc>, and <ext-link>. 
 
-->

<pattern
   id="element-citation-software-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="software" Tests</title>
             
  <rule context="element-citation[@publication-type='software']" id="elem-citation-software">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-software-2-1">[err-elem-cit-software-2-1]
      Each  &lt;element-citation> of type 'software' must contain one and
      only one &lt;person-group> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="person-group[@person-group-type=('author', 'curator')]"
              role="error" 
              id="err-elem-cit-software-2-2">[err-elem-cit-software-2-2]
Each  &lt;element-citation> of type 'software' must contain one &lt;person-group> 
with the attribute person-group-type set to 'author'or 'curator'. Reference 
'<xsl:value-of select="ancestor::ref/@id"/>' has a  &lt;person-group> type of 
'<xsl:value-of select="person-group/@person-group-type"/>'.</assert> 

      <report test="count(data-title)>1"
        role="error" 
        id="err-elem-cit-software-10-1">[err-elem-cit-software-10-1]
        Each  &lt;element-citation> of type 'software' may contain one and
        only one &lt;data-title> element.
        Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
        <xsl:value-of select="count(data-title)"/> &lt;data-title> elements.</report>
    
    <assert test="count(*) = count(person-group| year| data-title| source|version| publisher-name|publisher-loc|ext-link)"
      role="error" 
      id="err-elem-cit-software-16">[err-elem-cit-software-16]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="software" are:
      &lt;person-group>, &lt;year>, &lt;data-title>, &lt;source>, &lt;version>, &lt;publisher-name>, &lt;publisher-loc>, 
      and &lt;ext-link>
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='software']/data-title" id="elem-citation-software-data-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-software-10-2">[err-elem-cit-software-10-2]
      An &lt;data-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='software']/ext-link" id="elem-citation-software-ext-link"> 
    
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-software-15-1">[err-elem-cit-software-15-1]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-software-15-2">[err-elem-cit-software-15-2]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is '<xsl:value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-software-15-3">[err-elem-cit-software-15-3]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<xsl:value-of select="@xlink:href"/>' and content '<xsl:value-of select="."/>'.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Software Trial Tests ============ -->