<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation>               -->
<!--  VERSION    1.1                                               -->
<!--  LAST MOD   February 2017  (Created August 2016)              -->
<!--             Delivered as file "element-citation-general.sch"  -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Basic Schematron tests for all types of           -->
<!--             <element-citation>s.                              -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES ELEMENT CITATION GENERAL
     These tests are applicable to all <element-citation> elements,
     no matter which @publication-type they have.

      Name-2: 
      1. Each name must contain a surname. 
      2. See pre-edit.
      
      Name-3: 
      1. <person-group> must contain at least 1 <name> (or <collab>, if allowed)
      2. <collab> may contain characters and <italic>, <sub>, and <sup>. 
      No other elements are allowed inside <collab> 
      
      Name-4: If <suffix> occurs the content must match one of the specified values
      Jnr, Snr, I, II, III, VI, V, VI, VII, VIII, IX, X
      
      Name-5: The <etal> element is not allowed.
      
      Date-1: These rules apply to all <year> elements in all <element-citation>s.
      1. The content of <year> must be a 4 digit number, possibly followed by one (but not more) 
      lower case letters.
      2. The numeric value must be between 1700 and the current year + 5 years, inclusive.
      See also pre-edit.
      3. <year> must have an @iso-8601-date attribute.
      4. The value of the @iso-8601-date must be a number between 1900 and the current year + 5 years, inclusive.
      5. The value of the first 4 digits of the element content must match the year in 
      the @iso-8601-date attribute.
      In the following 3 requirements, the term 'same author information' means for citations with
      one author, the names (or collab) are the same. For citations with two authors, 
      it is if both surnames (or collabs) are the same, in the same sequence. For three or more 
      authors, it is if the first surname (or the collab) is the same.
      6. If a lower-case letter "a" follows the digits, there must be another reference with 
      the same author information with a letter "b" after the year.
      7. If a lower-case letter other than "a" follows digits, there must be another reference 
      with the same author information and the previous letter.
      8. Letter suffixes must be unique for the combination of year and author information.
      Added in February 2017:
      9. There may be at most one <year> element.

-->

<pattern 
   id="element-citation-general-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<title>General Tests for 'element-citation'</title>
  
  <!-- Name rules -->

<rule context="element-citation" id="elem-citation-general">

       <report test="person-group/name[not(surname)]"
               role="error" 
               id="err-elem-cit-gen-name-2">[err-elem-cit-gen-name-2]
Each &lt;name> element in a reference must contain a &lt;surname> element. 
Reference '<value-of select="ancestor::ref/@id"/>' does not.</report>
  
  <report test="descendant::etal"
    role="error" 
    id="err-elem-cit-gen-name-5">[err-elem-cit-gen-name-5]
    The &lt;etal> element in a reference is not allowed.
    Reference '<value-of select="ancestor::ref/@id"/>' contains it.</report>
  
  <report test="count(year)>1 "
    role="error" 
    id="err-elem-cit-gen-date-1-9">[err-elem-cit-gen-date-1-9]
    There may be at most one &lt;year> element.
    Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(year)"/>
    &lt;year> elements.
  </report>

  </rule> 
  
  <rule context="element-citation/person-group" id="elem-citation-gen-name-3-1">
    
    <report test=".[not (name or collab)]"
      role="error" 
      id="err-elem-cit-gen-name-3-1">[err-elem-cit-gen-name-3-1]
      Each &lt;person-group> element in a reference must contain at least one
      &lt;name> or, if allowed, &lt;collab> element. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not.</report>
    
  </rule>
  
  <rule context="element-citation/person-group/collab" id="elem-citation-gen-name-3-2">
    
    <assert test="count(*) = count(italic | sub | sup)"
      role="error" 
      id="err-elem-cit-gen-name-3-2">[err-elem-cit-gen-name-3-2]
      A &lt;collab> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' contains addiitonal elements.</assert>
    
  </rule>

  <rule context="element-citation/person-group/name" id="elem-citation-gen-name-4">
    
    <assert test="not(suffix) or .[suffix=('Jnr', 'Snr', 'I', 'II', 'III', 'VI', 'V', 'VI', 'VII', 'VIII', 'IX', 'X')] "
      role="error" 
      id="err-elem-cit-gen-name-4">[err-elem-cit-gen-name-4]
      The &lt;suffix> element in a reference may only contain one of the specified values
      Jnr, Snr, I, II, III, VI, V, VI, VII, VIII, IX, X.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement
      as it contains the value '<value-of select="suffix"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation/year" id="elem-citation-year">
    <let name="YYYY" value="substring(normalize-space(.), 1, 4)"/>
    <let name="current-year" value="year-from-date(current-date())"/>
    
    <assert test="matches(normalize-space(.),'(^\d{4}[a-z]?)')"
      role="error" 
      id="err-elem-cit-gen-date-1-1">[err-elem-cit-gen-date-1-1]
      The &lt;year> element in a reference must contain 4 digits, possibly followed by one (and only one) lower-case letter.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="."/>'.
    </assert>
    
    <assert test="(1700 le number($YYYY)) and (number($YYYY) le ($current-year + 5))"
      role="error" 
      id="err-elem-cit-gen-date-1-2">[err-elem-cit-gen-date-1-2]
      The numeric value of the first 4 digits of the &lt;year> element must be between 1700 and the current year + 5 years (inclusive).
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="."/>'.
    </assert>
    
    <assert test="./@iso-8601-date"
      role="error" 
      id="err-elem-cit-gen-date-1-3">[err-elem-cit-gen-date-1-3]
      All &lt;year> elements must have @iso-8601-date attributes.
      Reference '<value-of select="ancestor::ref/@id"/>' does not.
    </assert>
    
    <assert test="not(./@iso-8601-date) or (1700 le number(substring(normalize-space(@iso-8601-date),1,4)) and number(substring(normalize-space(@iso-8601-date),1,4)) le ($current-year + 5))"
      role="error" 
      id="err-elem-cit-gen-date-1-4">[err-elem-cit-gen-date-1-4]
      The numeric value of the first 4 digits of the @iso-8601-date attribute on the &lt;year> element must be between 
      1700 and the current year + 5 years (inclusive).
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as the attribute contains the value 
      '<value-of select="./@iso-8601-date"/>'.
    </assert>
    
    <assert test="not(./@iso-8601-date) or substring(normalize-space(./@iso-8601-date),1,4) = $YYYY"
      role="error" 
      id="err-elem-cit-gen-date-1-5">[err-elem-cit-gen-date-1-5]
      The numeric value of the first 4 digits of the @iso-8601-date attribute must match the first 4 digits on the 
      &lt;year> element.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as the element contains
      the value '<value-of select="."/>' and the attribute contains the value 
      '<value-of select="./@iso-8601-date"/>'.
    </assert>
    
    <assert test="not(concat($YYYY, 'a')=.) or (concat($YYYY, 'a')=. and 
      (some $y in //element-citation/descendant::year 
      satisfies (normalize-space($y) = concat($YYYY,'b')) 
      and (ancestor::element-citation/person-group[1]/name[1]/surname = $y/ancestor::element-citation/person-group[1]/name[1]/surname
      or ancestor::element-citation/person-group[1]/collab[1] = $y/ancestor::element-citation/person-group[1]/collab[1]
      )))"
      role="error" 
      id="err-elem-cit-gen-date-1-6">[err-elem-cit-gen-date-1-6]
      If the &lt;year> element contains the letter 'a' after the digits, there must be another reference with 
      the same first author surname (or collab) with a letter "b" after the year. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement.</assert>
    
    <assert test="not(starts-with(.,$YYYY) and matches(normalize-space(.),('\d{4}[b-z]'))) or
      (some $y in //element-citation/descendant::year 
      satisfies (normalize-space($y) = concat($YYYY,translate(substring(normalize-space(.),5,1),'bcdefghijklmnopqrstuvwxyz',
      'abcdefghijklmnopqrstuvwxy'))) 
      and (ancestor::element-citation/person-group[1]/name[1]/surname = $y/ancestor::element-citation/person-group[1]/name[1]/surname
      or ancestor::element-citation/person-group[1]/collab[1] = $y/ancestor::element-citation/person-group[1]/collab[1]
      ))"
      role="error" 
      id="err-elem-cit-gen-date-1-7">[err-elem-cit-gen-date-1-7]
      If the &lt;year> element contains any letter other than 'a' after the digits, there must be another 
      reference with the same first author surname (or collab) with the preceding letter after the year. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement.</assert>
    
    <report test="some $x in (preceding::year)
      satisfies (((count(ancestor::element-citation/person-group[1]/*)=1 and 
      count($x/ancestor::element-citation/person-group[1]/*)=1) and 
      ((ancestor::element-citation/person-group[1]/name[1]/surname and 
      concat($x,'+',$x/ancestor::element-citation/person-group[1]/name[1]/surname)
      = concat(current(),'+',ancestor::element-citation/person-group[1]/name[1]/surname))
      or
      (ancestor::element-citation/person-group[1]/collab[1] and 
      concat($x,'+',$x/ancestor::element-citation/person-group[1]/collab[1])
      = concat(current(),'+',ancestor::element-citation/person-group[1]/collab[1]))))
      or ((count(ancestor::element-citation/person-group[1]/*) ge 3 and 
      count($x/ancestor::element-citation/person-group[1]/*) ge 3)  and 
      ((ancestor::element-citation/person-group[1]/name[1]/surname and 
      concat($x,'+',$x/ancestor::element-citation/person-group[1]/name[1]/surname)
      = concat(current(),'+',ancestor::element-citation/person-group[1]/name[1]/surname))
      or
      (ancestor::element-citation/person-group[1]/collab[1] and 
      concat($x,'+',$x/ancestor::element-citation/person-group[1]/collab[1])
      = concat(current(),'+',ancestor::element-citation/person-group[1]/collab[1]))))
      or
      ((count(ancestor::element-citation/person-group[1]/*)=2 and 
      count($x/ancestor::element-citation/person-group[1]/*)=2)  and 
      ((ancestor::element-citation/person-group[1]/name[1]/surname=$x/ancestor::element-citation/person-group[1]/name[1]/surname
      and
      (ancestor::element-citation/person-group[1]/name[2]/surname=$x/ancestor::element-citation/person-group[1]/name[2]/surname
      or
      ancestor::element-citation/person-group[1]/*[2]=$x/ancestor::element-citation/person-group[1]/*[2]))
      or
      (ancestor::element-citation/person-group[1]/*[1]=$x/ancestor::element-citation/person-group[1]/*[1]
      and
      (ancestor::element-citation/person-group[1]/name[2]/surname=$x/ancestor::element-citation/person-group[1]/name[2]/surname
      or
      ancestor::element-citation/person-group[1]/*[2]=$x/ancestor::element-citation/person-group[1]/*[2])))
      and $x=current())
      )"
      role="error" 
      id="err-elem-cit-gen-date-1-8">[err-elem-cit-gen-date-1-8]
      Letter suffixes must be unique for the combination of year and author information. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement as it 
      contains the &lt;year> '<value-of select="."/>' for the author information
      '<value-of select="ancestor::element-citation/person-group[1]/name[1]/surname"/>', which occurs in at least one other reference.</report>
    
  </rule>
  
</pattern>

<!-- ============= End Element Citation General Tests ============ -->
