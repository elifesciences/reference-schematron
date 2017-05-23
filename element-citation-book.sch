<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="book"                          -->
<!--  VERSION    1.1                                               -->
<!--  LAST MOD   February 2017  (Created August 2016)              -->
<!--             Delivered as file "element-citation-book.sch"     -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="book">        -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="book">

       Book-2: 
       1. <person-group> must have a @person-group-type attribute
       2. the only values allowed for @person-group-type are "author" and "editor"
       3. only 1 person-group is allowed (either author or editor) 
          3a. UNLESS there is an <edition> element in the <element-citation>, 
          in which case there may be one with @person-group-type="author" 
          and one with @person-group-type=editor, or 
          3b. if there is a <chapter-title> element see Book-22
          ---- UPDATED to allow author AND editor even if chapter not present ----
     
       Book-10: 
       1. <source> must occur once and only once 
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> 
          
       Book-12:
       See pre-edit tests.
       
       Book-13:
       1. <publisher-name> is required and only one is allowed.
       2. No elements allowed inside <publisher-name>
       3. Warn if the content of <publisher-name> ends with a string from an external file of 
       common publisher locations.  
       
       Book-15: 
       No elements allowed inside <edition>.
       
       Book-16:
       Neither <fpage> nor <lpage> is allowed unless there is a <chapter-title>.
       
       Book-17:
       Each <pub-id>, if present, must have a @pub-id-type of one of these values: doi, pmid, isbn.

       Book-18:
       If <pub-id pub-id-type="pmid"> the content must be all numeric.
       
       Book-22:
       If there is a <chapter-title> element there must be a <person-group person-group-type="author">.
       
       Book-28:
       1. If <chapter-title> is present, <person-group person-group-type="editor"> is allowed.
       2. See the pre-edit tests.
       
       Book-31:
       <chapter-title> may contain text; no elements other than <italic>, <sub>, and <sup>  are 
       allowed inside <chapter-title>.
       
       Book-36:
       1. If both <fpage> and <lpage> are present, the value of <fpage> must be less than the value of <lpage>.
       2. If <lpage> is present, <fpage> must be present.
       3-5. See pre-edit tests.
       6. There is at most one <lpage> and one <fpage> element. (Added in February 2017)
       
       Book-40:
       The only elements that are allowed as children of <element-citation> if the publication-type="book" are:
       <person-group>, <year>,  <source>,<chapter-title>, <publisher-loc>, <publisher-name>, <volume>, 
       <edition>, <fpage>, <lpage>, <pub-id>. 
       
-->

<pattern
   id="element-citation-book-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="book" Tests</title>
             
  <rule context="element-citation[@publication-type='book']" id="elem-citation-book">
    <let name="publisher-locations" value="'publisher-locations.xml'"/>

    <assert test="person-group[@person-group-type='author'] or person-group[@person-group-type='editor']"
      role="error" 
      id="err-elem-cit-book-2-2">[err-elem-cit-book-2-2]
      The only values allowed for @person-group-type in book references are "author" and "editor".
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;person-group> type of 
      '<xsl:value-of select="person-group/@person-group-type"/>'.</assert> 
    
    <assert test="count(person-group)=1 or (count(person-group/@person-group-type='author')+
      count(person-group/@person-group-type='editor')=2)"
      role="error" 
      id="err-elem-cit-book-2-3">[err-elem-cit-book-2-3]
      In a book reference, there should be a single person-group element (either author or editor) or
      one person-group with @person-group-type="author" and one person-group with @person-group-type=editor.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
    <assert test="count(source)=1"
      role="error" 
      id="err-elem-cit-book-10-1">[err-elem-book-book-10-1]
      Each  &lt;element-citation> of type 'book' must contain one and
      only one &lt;source> element.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      <xsl:value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(source)=1 and (source/string-length() + sum(descendant::source/*/string-length()) ge 2)"
      role="error" 
      id="err-elem-cit-book-10-2-1">[err-elem-cit-book-10-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'book' must contain 
      at least two characters.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(source)=1 and count(source/*)=count(source/(italic | sub | sup))"
      role="error" 
      id="err-elem-cit-book-10-2-2">[err-elem-cit-book-10-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'book' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements that are not allowed.</assert>
    
    <assert test="count(publisher-name)=1"
      role="error" 
      id="err-elem-cit-book-13-1">[err-elem-cit-book-13-1]
      One and only one &lt;publisher-name> is required in a book reference.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(publisher-name)"/>
      &lt;publisher-name> elements.</assert>
    
    <report test="some $p in document($publisher-locations)/locations/location/text()
      satisfies ends-with(publisher-name[1],$p)"
      role="warning" 
      id="warning-elem-cit-book-13-3">[warning-elem-cit-book-13-3]
      The content of &lt;publisher-name> may not end with a publisher location. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' contains the string <xsl:value-of select="publisher-name"/>,
      which ends with a publisher location.</report>
    
    <report test="(lpage or fpage) and not(chapter-title)"
      role="error" 
      id="err-elem-cit-book-16">[err-elem-cit-book-16]
      In a book reference, &lt;lpage> and &lt;fpage> are allowed only if &lt;chapter-title> is present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;lpage> or &lt;fpage> but no &lt;chapter-title>.</report>
    
    <report test="(lpage and fpage) and (fpage ge lpage[1])"
      role="error" 
      id="err-elem-cit-book-36">[err-elem-cit-book-36-1]
      If both &lt;lpage> and &lt;fpage> are present, the value of &lt;fpage> must be less than the value of &lt;lpage>. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;lpage> <xsl:value-of select="lpage"/>, which is 
      less than or equal to &lt;fpage> <xsl:value-of select="fpage"/>.</report>
    
    <report test="lpage and not (fpage)"
      role="error" 
      id="err-elem-cit-book-36-2">[err-elem-cit-book-36-2]
      If &lt;lpage> is present, &lt;fpage> must also be present. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;lpage> but not &lt;fpage>.</report>
    
    <report test="count(lpage) > 1 or count(fpage) > 1"
      role="error" 
      id="err-elem-cit-book-36-6">[err-elem-cit-book-36-6]
      At most one &lt;lpage> and one &lt;fpage> are allowed. 
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has <xsl:value-of select="count(lpage)"/> &lt;lpage> 
      elements and <xsl:value-of select="count(fpage)"/> &lt;fpage> elements.</report>
    
    <assert test="count(*) = count(person-group| year| source| chapter-title| publisher-loc|publisher-name|volume| 
      edition| fpage| lpage| pub-id)"
      role="error" 
      id="err-elem-cit-book-40">[err-elem-cit-book-40]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="book" are:
      &lt;person-group>, &lt;year>, &lt;source>, &lt;chapter-title>, &lt;publisher-loc>, &lt;publisher-name>, 
      &lt;volume>, &lt;edition>, &lt;fpage>, &lt;lpage>, and &lt;pub-id>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has other elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='book']/person-group">
    <assert test="@person-group-type"
      role="error" 
      id="err-elem-cit-book-2-1">[err-elem-cit-book-2-1]
      Each &lt;person-group> must have a @person-group-type attribute.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has a &lt;person-group> 
      element with no @person-group-type attribute.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='book']/chapter-title" id="elem-citation-book-chapter-title">
    
    <assert test="count(../person-group[@person-group-type='author'])=1"
      role="error" 
      id="err-elem-cit-book-22">[err-elem-cit-book-22]
      If there is a &lt;chapter-title> element there must be one and only one &lt;person-group person-group-type="author">.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
      
    <assert test="count(../person-group[@person-group-type='editor']) le 1"
      role="error" 
      id="err-elem-cit-book-28-1">[err-elem-cit-book-28-1]
      If there is a &lt;chapter-title> element there may be a maximum of one &lt;person-group person-group-type="editor">.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-book-31">[err-elem-cit-book-31]
      A &lt;chapter-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='book']/publisher-name" id="elem-citation-book-publisher-name">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-book-13-2">[err-elem-cit-book-13-2]
      No elements are allowed inside &lt;publisher-name>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;publisher-name> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='book']/edition" id="elem-citation-book-edition">
    
    <assert test="count(*)=0"
      role="error" 
      id="err-elem-cit-book-15">[err-elem-cit-book-15]
      No elements are allowed inside &lt;edition>.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has child elements within the
      &lt;edition> element.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='book']/pub-id[@pub-id-type='pmid']" id="elem-citation-book-pub-id-pmid">
    
    <report test="matches(.,'\D')"
      role="error" 
      id="err-elem-cit-book-18">[err-elem-cit-book-18]
      If &lt;pub-id pub-id-type="pmid"> is present, the content must be all numeric. The content of 
      &lt;pub-id pub-id-type="pmid"> in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is <xsl:value-of select="."/>.</report>
    
  </rule>
  
  <rule context="element-citation[@publication-type='book']/pub-id" id="elem-citation-book-pub-id">
    
    <assert test="@pub-id-type='doi' or @pub-id-type='pmid' or @pub-id-type='isbn'"
      role="error" 
      id="err-elem-cit-book-17">[err-elem-cit-book-17]
      Each &lt;pub-id>, if present in a book reference, must have a @pub-id-type of one of these values: doi, pmid, isbn. 
      The pub-id-type attribute on &lt;pub-id> in Reference '<xsl:value-of select="ancestor::ref/@id"/>' 
      is <xsl:value-of select="@pub-id-type"/>.</assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Book Tests ============ -->
