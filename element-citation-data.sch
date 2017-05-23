<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="data"                          -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   September 2016  (Created August 2016)             -->
<!--             Delivered as file "element-citation-data.sch"  -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="data">        -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="data">

       Data-2: 
       See the pre-edit tests.
     
       Data-3: 
       1. only 1 person-group of each type allowed (author, compiler, curator)
       2. at least one person-group required 
       
       Data-10:
       Must contain a <data-title> element.
       
       Data-11:
       1. See pre-edit stage. 
       2. <source> must occur once and only once.
       3. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 

       Data-13:
       1. There must be at least one pub-id OR an <ext-link>. There may be more than one pub-id.
       2. A pub-id must have one of these types: accession, archive, ark, or doi. Data-15 
       further allows assigning-authority.

       Data-14:
       1. if the pub-id is of any pub-id-type except doi, it must have an @xlink:href. 
       2. if the pub-id is of pub-id-type doi, it may not have an @xlink-href.
       
       Data-15:
       A pub-id of type @assigning-authority is allowed. (Subsumed into Data-13-2).
       
       Data-17:
       1. The <ext-link element is required if there is no <pub-id>.
       2. <ext-link> must contain @xlink:href.
       3. The value of @xlink:href must start with either "http://" or "https://"
       4. The value of @xlink:href must be the same as the element content of <ext-link>.
       
       Data-18:
       The only tags that are allowed as children of <element-citation> with the publication-type="Data" are:
       <person-group>, <data-title>, <source>, <year>, <pub-id>, <version>, and <ext-link>. 
 
-->


<pattern
   id="element-citation-data-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xlink="http://www.w3.org/1999/xlink">

<title>element-citation publication-type="data" Tests</title>
  
  <rule context="element-citation[@publication-type='data']" id="elem-citation-data">

    <assert test="count(person-group[@person-group-type='author']) le 1 and
      count(person-group[@person-group-type='compiler']) le 1 and
      count(person-group[@person-group-type='curator']) le 1"
      role="error" 
      id="err-elem-cit-data-3-1">[err-elem-cit-data-3-1]
      Only one person-group of each type (author, compiler, curator) is allowed. 
      Reference 
      '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group[@person-group-type='author'])"/>  &lt;person-group> elements of type of 
      'author', <xsl:value-of select="count(person-group[@person-group-type='author'])"/>  &lt;person-group> elements of type of 
      'compiler', <xsl:value-of select="count(person-group[@person-group-type='author'])"/>  &lt;person-group> elements of type of 
      'curator', and <xsl:value-of select="count(person-group[@person-group-type!='author' and @person-group-type!='compiler' and @person-group-type!='curator'])"/>
      &lt;person-group> elements of some other type.</assert>
    
    <assert test="count(person-group) ge 1"
      role="error" 
      id="err-elem-cit-data-3-2">[err-elem-cit-data-3-2]
      Each  &lt;element-citation> of type 'data' must contain at least one &lt;person-group> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>

      <assert test="count(data-title)=1"
        role="error" 
        id="err-elem-cit-data-10">[err-elem-cit-data-10]
        Each  &lt;element-citation> of type 'data' must contain one and only one &lt;data-title> element.
        Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
        <xsl:value-of select="count(data-title)"/> &lt;data-title> elements.</assert>
    
    <assert test="count(source)=1"
      role="error" 
      id="err-elem-cit-data-11-2">[err-elem-cit-data-11-2]
      Each  &lt;element-citation> of type 'data' must contain one and only one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(source)=1 and (source/string-length() + sum(descendant::source/*/string-length()) ge 2)"
      role="error" 
      id="err-elem-cit-data-11-3-1">[err-elem-cit-data-11-3-1]
      A &lt;source> element within a &lt;element-citation> of type 'data' must contain 
      at least two characters.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(source)=1 and count(source/*)=count(source/(italic | sub | sup))"
      role="error" 
      id="err-elem-cit-data-11-3-2">[err-elem-cit-data-11-3-2]
      A  &lt;source> element within a &lt;element-citation> of type 'data' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
    <assert test="pub-id or ext-link"
      role="error" 
      id="err-elem-cit-data-13-1">[err-elem-cit-data-13-1]
      There must be at least one pub-id OR an &lt;ext-link>. There may be more than one pub-id.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(pub-id)"/> &lt;pub-id elements
      and <xsl:value-of select="count(ext-link)"/>  &lt;ext-link> elements.</assert>
    
    <assert test="count(pub-id) ge 1 or count(ext-link) ge 1"
      role="error" 
      id="err-elem-cit-data-17-1">[err-elem-cit-data-17-1]
      The &lt;ext-link> element is required if there is no &lt;pub-id>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(pub-id)"/> &lt;pub-id> elements
      and <xsl:value-of select="count(ext-link)"/>  &lt;ext-link> elements.</assert>

    <assert test="count(*) = count(person-group| data-title| source| year| pub-id| version| ext-link)"
      role="error" 
      id="err-elem-cit-data-18">[err-elem-cit-data-18]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="data" are:
      &lt;person-group>, &lt;data-title>, &lt;source>, &lt;year>, &lt;pub-id>, &lt;version>, and &lt;ext-link>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>

  <rule context="element-citation[@publication-type='data']/pub-id[@pub-id-type='doi']" id="elem-citation-data-pub-id-doi">
    
    <assert test="not(@xlink:href)"
      role="error" 
      id="err-elem-cit-data-14-2">[err-elem-cit-data-14-2]
      If the pub-id is of pub-id-type doi, it may not have an @xlink:href.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;pub-id element with type doi and an
      @link-href with value '<xsl:value-of select="@link-href"/>'.</assert>
    
  </rule>

  <rule context="element-citation[@publication-type='data']/pub-id" id="elem-citation-data-pub-id">

    <assert test="@pub-id-type=('accession', 'archive', 'ark', 'doi')"
      role="error" 
      id="err-elem-cit-data-13-2">[err-elem-cit-data-13-2]
      Each pub-id element must have one of these types: accession, archive, ark, assigning-authority or doi. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;pub-id element with types 
      '<xsl:value-of select="@pub-id-type"/>'.</assert>
    
    <assert test="if (@pub-id-type ne 'doi') then @xlink:href else ()"
      role="error" 
      id="err-elem-cit-data-14-1">[err-elem-cit-data-14-1]
      If the pub-id is of any pub-id-type except doi, it must have an @xlink:href. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;pub-id element with type 
      '<xsl:value-of select="@pub-id-type"/>' but no @xlink-href.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='data']/ext-link" id="elem-citation-data-ext-link"> 
        
    <assert test="@xlink:href"
      role="error" 
      id="err-elem-cit-data-17-2">[err-elem-cit-data-17-2]
      Each &lt;ext-link> element must contain @xlink:href. The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      does not.</assert>
    
    <assert test="starts-with(@xlink:href, 'http://') or starts-with(@xlink:href, 'https://')"
      role="error" 
      id="err-elem-cit-data-17-3">[err-elem-cit-data-17-3]
      The value of @xlink:href must start with either "http://" or "https://". 
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is '<xsl:value-of select="@xlink:href"/>', which does not.</assert>  
    
    <assert test="normalize-space(@xlink:href)=normalize-space(.)"
      role="error" 
      id="err-elem-cit-data-17-4">[err-elem-cit-data-17-4]
      The value of @xlink:href must be the same as the element content of &lt;ext-link>.
      The &lt;ext-link> element in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      has @xlink:href='<xsl:value-of select="@xlink:href"/>' and content '<xsl:value-of select="."/>'.</assert>
    
  </rule>
  

</pattern>


<!-- ============= End Element Citation Data Tests ============ -->
