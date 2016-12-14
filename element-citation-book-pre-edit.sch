<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="book"                          -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   September 2016  (Created September 2016)          -->
<!--             Delivered as file                                 -->
<!--             "element-citation-book-pre-edit.sch"              -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="book">        -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES FOR <element-citation publication-type="book">
     in the pre-edit stage.
     
     Book-12: 
     warn if <publisher-loc> not present

     Book-28:
     4. Warning if <chapter-title> is present and there is no 
     <person-group person-group-type="editor"> 
     
     Book-36:
     3. warn if <chapter-title> present but no <fpage> and <lpage>
     4. warn if <fpage> but no <lpage>
     5. warn if any non-numeric characters in either <fpage> or <lpage> - commented out after review

-->

<pattern
   id="element-citation-book-pre-edit-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>element-citation publication-type="book" Pre-edit Tests</title>

             
  <rule context="element-citation[@publication-type='book']" id="elem-citation-book-pre-edit">
     
    <assert test="count(publisher-loc) = 1"
      role="warning" 
      id="warning-elem-cit-book-12">[warning-elem-cit-book-12]
      There should be a &lt;publisher-loc> element within a &lt;element-citation> of type 'book'.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not have one &lt;publisher-loc> element.</assert>
    
    <report test="chapter-title and not(person-group[@person-group-type='editor'])"
      role="warning" 
      id="warning-elem-cit-book-28">[warning-elem-cit-book-28]
      If &lt;chapter-title> is present, there should be a &lt;person-group> element of type 'editor' present.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has &lt;chapter-title> but no &lt;person-group> of type 'editor'.</report>
    
    <report test="chapter-title and not(lpage) and not(fpage)"
      role="warning" 
      id="warning-elem-cit-book-36-3">[warning-elem-cit-book-36-3]
      If &lt;chapter-title> is present, &lt;fpage> and &lt;lpage> should also be present.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' is missing &lt;fpage>, &lt;lpage>, or both.</report>
    
    <report test="fpage and not(lpage)"
      role="warning" 
      id="warning-elem-cit-book-36-4">[warning-elem-cit-book-36-4]
      If &lt;fpage> is present, &lt;lpage> should also be present.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' does not have an &lt;lpage> element.</report>
    
   <!-- <report test="matches(fpage,'\D') or matches(lpage, '\D')"
      role="warning" 
      id="warning-elem-cit-book-36-5">[warning-elem-cit-book-36-5]
      The content of both &lt;fpage> and &lt;lpage> should be all numeric.
      Reference '<xsl:value-of select="ancestor::ref/@id"/>' has 
      &lt;fpage>: <xsl:value-of select="fpage"/> and &lt;lpage>: <xsl:value-of select="lpage"/>.</report>-->

  </rule>

 
</pattern>

<!-- ============= End Element Citation Journal Pre-edit Tests ============ -->