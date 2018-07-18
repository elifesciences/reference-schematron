<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation> for           -->
<!--             @publication-type="periodical"                    -->
<!--  VERSION    1.0                                               -->
<!--  LAST MOD   November 2016  (Created August 2016)              -->
<!--          Delivered as file "element-citation-periodical.sch"  -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     Schematron tests specific to                      -->
<!--             <element-citation publication-type="periodical">  -->
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

<!-- DESIGN NOTES FOR <element-citation publication-type="periodical">

       periodical-2: 
       1. There must be one and only one person-group in an 
       element-citation. 
       2. the person-group-type must be "author".
       
       periodical-7:
       1. <year> is required.
       2. <year> must have @iso-8601-date (see Date-1-3).
       3. @iso-8601-date value on <year> must include 4-digit year, 2-digit month, and (optionally) a 2-digit day.
       4. The <year> element content must begin with a 4-digit year between 1700 and the current year. (see Date-1-2)
       5. The value of the 4-digit year in the <year> element content must match the 4-digit year portion of the 
       @iso-8601-date (see Date-1-5).
       6. If the <year> element contains the letter 'a' after the digits, there must be another reference with 
       the same first author surname with a letter "b" after the year. 
       7. If the <year> element contains any letter other than 'a' after the digits, there must be another 
       reference with the same first author surname with the preceding letter after the year. 
       8. Letter suffixes must be unique for the combination of year and first author surname. 
     
       periodical-8: 
       1. <article-title> must occur once and only once.
       2. <article-title> may contain characters and only these elements: 
       <italic>, <sub>, <sup>.
       These rules only apply to the <article-title> element in the 
       context of <element-citation>, not to any other context. 
       
       periodical-9:
       1. <source> must occur once and only once.
       2. <source> must contain at least 2 characters and may only contain <sub>, <sup> and <italic> .
       
       periodical-10: 
       1. <volume> must contain at least 1 character and may not contain any elements. It
       is optional, and may occur once per element-citation.
       2. Defined for pre-edit stage.
       3. There may be 0 or 1 <volume> elements.
       
       periodical-11:
       Page identification is optional.
       1. If <lpage> is present, <fpage> must also be present.
       2. No more than one of each element is allowed.
       3. First page must always have a larger value than last page.
       4. The content of the elements can contain any alpha numeric value but no formatting is allowed.
       5. If the content of <fpage> begins with a letter, then the content of <lpage> must begin with 
       the same letter.
       The reverse, however, is not true - can have a <fpage> starting with a number and a <lpage> 
       that starts with a letter.

       periodical-13:
       The only tags that are allowed as children of <element-citation> with the publication-type="periodical" are:
       <person-group>, <year>, <string-date>, <article-title>, <source>, <volume>, <fpage>, and <lpage>. 
 
       Periodical-14: 
       1. string-date is required; there must be one and only one.
       2. Child elements month and year are required; one of each.
       3. The child element day is optional.
       4. The content of month must be the month, written out, with correct capitalization.
       5. The content of month must match the content of the month section of @iso-8601-date on the 
       sibling year element.
       6. The content of day, if present, must be the day, in digits, with no zeroes.
       7. The content of day, if present, must match the content of the day section of @iso-8601-date 
       on the sibling year element.
       8. The order of content must be <month> <day>, <year>.
       
-->

<pattern
   id="element-citation-periodical-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron">

<title>element-citation publication-type="periodical" Tests</title>
             
  <rule context="element-citation[@publication-type='periodical']" id="elem-citation-periodical">

    <assert test="count(person-group)=1"
      role="error" 
      id="err-elem-cit-periodical-2-1">[err-elem-cit-periodical-2-1]
      Each  &lt;element-citation> of type 'periodical' must contain one and
      only one &lt;person-group> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(person-group)"/> &lt;person-group> elements.</assert>
    
      <assert test="person-group[@person-group-type='author']"
              role="error" 
              id="err-elem-cit-periodical-2-2">[err-elem-cit-periodical-2-2]
Each  &lt;element-citation> of type 'periodical' must contain one &lt;person-group> 
with the attribute person-group-type set to 'author'. Reference 
'<value-of select="ancestor::ref/@id"/>' has a  &lt;person-group> type of 
'<value-of select="person-group/@person-group-type"/>'.</assert> 
    
    <assert test="count(string-date/year)=1"
      role="error" 
      id="err-elem-cit-periodical-7-1">[err-elem-cit-periodical-7-1]
      There must be one and only one &lt;year> element in a &lt;string-date> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(year)"/>
      &lt;year> elements in the &lt;string-date> element.</assert>

      <assert test="count(article-title)=1"
        role="error" 
        id="err-elem-cit-periodical-8-1">[err-elem-cit-periodical-8-1]
        Each  &lt;element-citation> of type 'periodical' must contain one and
        only one &lt;article-title> element.
        Reference '<value-of select="ancestor::ref/@id"/>' has 
        <value-of select="count(article-title)"/> &lt;article-title> elements.</assert>
    
    <assert test="count(source)=1"
      role="error" 
      id="err-elem-cit-periodical-9-1">[err-elem-cit-periodical-9-1]
      Each  &lt;element-citation> of type 'periodical' must contain one and
      only one &lt;source> element.
      Reference '<value-of select="ancestor::ref/@id"/>' has 
      <value-of select="count(source)"/> &lt;source> elements.</assert>
    
    <assert test="count(source)=1 and (source/string-length() + sum(descendant::source/*/string-length()) ge 2)"
      role="error" 
      id="err-elem-cit-periodical-9-2-1">[err-elem-cit-periodical-9-2-1]
      A  &lt;source> element within a &lt;element-citation> of type 'periodical' must contain 
      at least two characters.
      Reference '<value-of select="ancestor::ref/@id"/>' has too few characters.</assert>
    
    <assert test="count(source)=1 and count(source/*)=count(source/(italic | sub | sup))"
      role="error" 
      id="err-elem-cit-periodical-9-2-2">[err-elem-cit-periodical-9-2-2]
      A  &lt;source> element within a &lt;element-citation> of type 'periodical' may only contain the child 
      elements&lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has disallowed child elements.</assert>
    
    <assert test="count(volume) le 1"
      role="error" 
      id="err-elem-cit-periodical-10-1-3">[err-elem-cit-periodical-10-1-3]
      There may be at most one  &lt;volume> element within a &lt;element-citation> of type 'periodical'.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(volume)"/>
      &lt;volume> elements.</assert>
    
    <report test="lpage and not(fpage)"
      role="error" 
      id="err-elem-cit-periodical-11-1">[err-elem-cit-periodical-11-1]
      If &lt;lpage> is present, &lt;fpage> must also be present.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(fpage)"/>
      &lt;fpage> elements,  <value-of select="count(lpage)"/> &lt;lpage> elements, and 
      <value-of select="count(elocation-id)"/> &lt;elocation-id> elements.</report>
    
    <report test="count(fpage) gt 1 or count(lpage) gt 1"
      role="error" 
      id="err-elem-cit-periodical-11-2">[err-elem-cit-periodical-11-2]
      The citation may contain no more than one &lt;fpage> or &lt;lpage> elements.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(fpage)"/>
      &lt;fpage> elements and <value-of select="count(lpage)"/> &lt;lpage> elements.</report>
    
    <report test="(lpage and fpage) and (fpage ge lpage)"
      role="error" 
      id="err-elem-cit-periodical-11-3">[err-elem-cit-periodical-11-3]
      If both &lt;lpage> and &lt;fpage> are present, the value of &lt;fpage> must be less than the value of &lt;lpage>. 
      Reference '<value-of select="ancestor::ref/@id"/>' has &lt;lpage> <value-of select="lpage"/>, which is 
      less than or equal to &lt;fpage> <value-of select="fpage"/>.</report>
    
    <assert test="count(fpage/*)=0 and count(lpage/*)=0"
      role="error" 
      id="err-elem-cit-periodical-11-4">[err-elem-cit-periodical-11-4]
      The content of the &lt;fpage> and &lt;lpage> elements can contain any alpha numeric value but no child elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(fpage/*)"/> child elements in
      &lt;fpage> and  <value-of select="count(lpage/*)"/> child elements in &lt;lpage>.</assert>     
    
    <assert test="count(*) = count(person-group | year | string-date | article-title | source | volume | fpage | lpage)"
      role="error" 
      id="err-elem-cit-periodical-13">[err-elem-cit-periodical-13]
      The only tags that are allowed as children of &lt;element-citation> with the publication-type="periodical" are:
        &lt;person-group>, &lt;year>, &lt;string-date>, &lt;article-title>, &lt;source>, &lt;volume>, &lt;fpage>, and &lt;lpage>.
      Reference '<value-of select="ancestor::ref/@id"/>' has other elements.</assert>
    
    <assert test="count(string-date)=1"
      role="error" 
      id="err-elem-cit-periodical-14-1">[err-elem-cit-periodical-14-1]
      There must be one and only one &lt;string-date> element within a &lt;element-citation> of type 'periodical'.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="count(string-date)"/>
      &lt;string-date> elements.</assert>

  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/string-date/year" id="elem-citation-periodical-year">
    
    <let name="YYYY" value="substring(normalize-space(.), 1, 4)"/>
    <let name="current-year" value="year-from-date(current-date())"/>
    
    <assert test="./@iso-8601-date"
      role="error" 
      id="err-elem-cit-periodical-7-2">[err-elem-cit-periodical-7-2]
      The &lt;year> element must have an @iso-8601-date attribute.
      Reference '<value-of select="ancestor::ref/@id"/>' does not.
    </assert>
    
    <assert test="matches(normalize-space(@iso-8601-date),'(^\d{4}-\d{2}-\d{2})|(^\d{4}-\d{2})')"
      role="error" 
      id="err-elem-cit-periodical-7-3">[err-elem-cit-periodical-7-3]
      The @iso-8601-date value must include 4 digit year, 2 digit month, and (optionally) a 2 digit day.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="@iso-8601-date"/>'.
    </assert>

    <assert test="matches(normalize-space(.),'(^\d{4}[a-z]?)')"
      role="error" 
      id="err-elem-cit-periodical-7-4-1">[err-elem-cit-periodical-7-4-1]
      The &lt;year> element in a reference must contain 4 digits, possibly followed by one (but not more) lower-case letter.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="."/>'.
    </assert>
    
    <assert test="(1700 le number($YYYY)) and (number($YYYY) le $current-year)"
      role="error" 
      id="err-elem-cit-periodical-7-4-2">[err-elem-cit-periodical-7-4-2]
      The numeric value of the first 4 digits of the &lt;year> element must be between 1700 and the current year (inclusive).
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value '<value-of select="."/>'.
    </assert>
    
    <assert test="not(./@iso-8601-date) or substring(normalize-space(./@iso-8601-date),1,4) = $YYYY"
      role="error" 
      id="err-elem-cit-periodical-7-5">[err-elem-cit-periodical-7-5]
      The numeric value of the first 4 digits of the @iso-8601-date attribute must match the first 4 digits on the 
      &lt;year> element.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as the element contains
      the value '<value-of select="."/>' and the attribute contains the value 
      '<value-of select="./@iso-8601-date"/>'.
    </assert>
    
    <assert test="not(concat($YYYY, 'a')=.) or (concat($YYYY, 'a')=. and 
      (some $y in //element-citation/descendant::year 
      satisfies (normalize-space($y) = concat($YYYY,'b')) 
      and ancestor::element-citation/person-group[1]/name[1]/surname = $y/ancestor::element-citation/person-group[1]/name[1]/surname)
      )"
      role="error" 
      id="err-elem-cit-periodical-7-6">[err-elem-cit-periodical-7-6]
      If the &lt;year> element contains the letter 'a' after the digits, there must be another reference with 
      the same first author surname with a letter "b" after the year. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement.</assert>
    
    <assert test="not(starts-with(.,$YYYY) and matches(normalize-space(.),('\d{4}[b-z]'))) or
      (some $y in //element-citation/descendant::year 
      satisfies (normalize-space($y) = concat($YYYY,translate(substring(normalize-space(.),5,1),'bcdefghijklmnopqrstuvwxyz',
      'abcdefghijklmnopqrstuvwxy'))) 
      and ancestor::element-citation/person-group[1]/name[1]/surname = $y/ancestor::element-citation/person-group[1]/name[1]/surname)
      "
      role="error" 
      id="err-elem-cit-periodical-7-7">[err-elem-cit-periodical-7-7]
      If the &lt;year> element contains any letter other than 'a' after the digits, there must be another 
      reference with the same first author surname with the preceding letter after the year. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement.</assert>
    
    <report test=". = preceding::year and 
      ancestor::element-citation/person-group[1]/name[1]/surname = preceding::year/ancestor::element-citation/person-group[1]/name[1]/surname"
      role="error" 
      id="err-elem-cit-periodical-7-8">[err-elem-cit-periodical-7-8]
      Letter suffixes must be unique for the combination of year and first author surname. 
      Reference '<value-of select="ancestor::ref/@id"/>' does not fulfill this requirement as it 
      contains the &lt;year> '<value-of select="."/>' more than once for the same first author surname
      '<value-of select="ancestor::element-citation/person-group[1]/name[1]/surname"/>'.</report>

  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/article-title" id="elem-citation-periodical-article-title">
    
    <assert test="count(*) = count(sub|sup|italic)"
      role="error" 
      id="err-elem-cit-periodical-8-2">[err-elem-cit-periodical-8-2]
      An &lt;article-title> element in a reference may contain characters and &lt;italic>, &lt;sub>, and &lt;sup>. 
      No other elements are allowed.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement.</assert>
    
  </rule>

  <rule context="element-citation[@publication-type='periodical']/volume" id="elem-citation-periodical-volume">
  <assert test="count(*)=0 and (string-length(text()) ge 1)"
    role="error" 
    id="err-elem-cit-periodical-10-1-2">[err-elem-cit-periodical-10-1-2]
    A  &lt;volume> element within a &lt;element-citation> of type 'periodical' must contain 
    at least one character and may not contain child elements.
    Reference '<value-of select="ancestor::ref/@id"/>' has too few characters and/or
    child elements.</assert>
  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/fpage" id="elem-citation-periodical-fpage">
    
    <assert test="matches(normalize-space(.),'^\d.*') or (substring(normalize-space(../lpage),1,1) = substring(normalize-space(.),1,1))"
      role="error" 
      id="err-elem-cit-periodical-11-5">[err-elem-cit-periodical-11-4]
      If the content of &lt;fpage> begins with a letter, then the content of  &lt;lpage> must begin with 
      the same letter. 
      Reference '<value-of select="ancestor::ref/@id"/>' has &lt;fpage>='<value-of select="."/>'
      and &lt;lpage>='<value-of select="../lpage"/>'.</assert>
    
  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/string-date" id="elem-citation-periodical-string-date">
    
    <assert test="count(month)=1 and count(year)=1"
      role="error" 
      id="err-elem-cit-periodical-14-2">[err-elem-cit-periodical-14-2]
      The &lt;string-date> element must include one of each of &lt;month> and &lt;year> 
      elements.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      <value-of select="count(month)"/> &lt;month> elements and <value-of select="count(year)"/> &lt;year> elements.
    </assert>
    
    <assert test="count(day) le 1"
      role="error" 
      id="err-elem-cit-periodical-14-3">[err-elem-cit-periodical-14-3]
      The &lt;string-date> element may include one &lt;day> element.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      <value-of select="count(day)"/> &lt;day> elements.
    </assert> 
    
    <assert test="(name(child::node()[1])='month' and replace(child::node()[2],'\s+',' ')=' ' and 
      name(child::node()[3])='day' and replace(child::node()[4],'\s+',' ')=', ' and name(*[position()=last()])='year') or
      (name(child::node()[1])='month' and replace(child::node()[2],'\s+',' ')=', ' and name(*[position()=last()])='year')"
      role="error" 
      id="err-elem-cit-periodical-14-8">[err-elem-cit-periodical-14-8]
      The format of the element content must match &lt;month>, space, &lt;day>, comma, &lt;year>, or &lt;month>, comma, &lt;year>.
      Reference '<value-of select="ancestor::ref/@id"/>' has <value-of select="."/>.</assert>    
     
  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/string-date/month" id="elem-citation-periodical-month">
    
    <assert test=".=('January','February','March','April','May','June','July','August','September','October','November','December')"
      role="error" 
      id="err-elem-cit-periodical-14-4">[err-elem-cit-periodical-14-4]
      The content of &lt;month> must be the month, written out, with correct capitalization.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value  &lt;month>='<value-of select="."/>'.
    </assert>
    
    <assert test=".=format-date(xs:date(../year/@iso-8601-date), '[MNn]')"
      role="error" 
      id="err-elem-cit-periodical-14-5">[err-elem-cit-periodical-14-5]
      The content of &lt;month> must match the content of the month section of @iso-8601-date on the 
      sibling year element.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value &lt;month>='<value-of select="."/>' but &lt;year>/@iso-8601-date='<value-of select="../year/@iso-8601-date"/>'.
    </assert>

  </rule>
  
  <rule context="element-citation[@publication-type='periodical']/string-date/day" id="elem-citation-periodical-day">
    
    <assert test="matches(normalize-space(.),'([1-9])|([1-2][0-9])|(3[0-1])')"
      role="error" 
      id="err-elem-cit-periodical-14-6">[err-elem-cit-periodical-14-6]
      The content of &lt;day>, if present, must be the day, in digits, with no zeroes.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value  &lt;day>='<value-of select="."/>'.
    </assert>
    
    <assert test=".=format-date(xs:date(../year/@iso-8601-date), '[D]')"
      role="error" 
      id="err-elem-cit-periodical-14-7">[err-elem-cit-periodical-14-7]
      The content of &lt;day>, if present, must match the content of the day section of @iso-8601-date on the 
      sibling year element.
      Reference '<value-of select="ancestor::ref/@id"/>' does not meet this requirement as it contains
      the value &lt;day>='<value-of select="."/>' but &lt;year>/@iso-8601-date='<value-of select="../year/@iso-8601-date"/>'.
    </assert>
    
  </rule>

</pattern>

<!-- ============= End Element Citation Periodical Tests ============ -->