<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  TITLE      eLife Schematron <element-citation>               -->
<!--  VERSION    1.1                                               -->
<!--  LAST MOD   February 2017  (Created August 2016)              -->
<!--             Delivered as file "element-citation-high.sch"     -->        
<!--                                                               -->
<!-- SYSTEM:     eLife JATS Schematron Tests                       -->
<!--                                                               -->
<!-- PURPOSE     High-level Schematron tests for all types of      -->
<!--             <element-citation>s.                              -->
<!--                                                               -->
<!-- SPONSOR     eLife Sciences Publications Ltd.                  -->
<!-- CREATED FOR This Schematron is in the public domain. An       -->
<!--             organization that wishes to create its own        -->
<!--             Schematron from the suite may do so without       -->
<!--             permission from eLife.                            -->
<!-- DEVELOPED   Mulberry Technologies, Inc.                       -->
<!-- ============================================================= -->

<!-- DESIGN NOTES ELEMENT CITATION HIGH TESTS
  
      High-1: The only element that is allowed as a child of <ref> is
      <element-citation>
      
      High-2: 
      1. References to the same author(s) in the same year must be arranged in the same order
      as the citations in the text.      
      2. The sequence of <element-citation> elements within the <ref> element is 
      arranged alphabetically by first author’s surname (or collab), then date. In the case of
      two authors, the sequence is arranged by both authors' surnames, then date. For
      three or more authors, the sequence is the first author's surname, then date.
      each ref: first author surname must be ge previous author surname (or collab).
      
      High-3:
      1. Check for presence of @id on <ref>
      2. Check style of id value ('bib' followed by a number)
      3. Check sequence of ids (the number increases monotonically).
      
      High-4:
      1. if an element-citation/person-group contains one <name>, 
      the content of the <surname> inside that name must appear in the 
      content of all <xref>s that point to the <element-citation>. 
      2. If an element-citation/person-group contains 2 <name>s, the content 
      of the first <surname> of the first <name>, followed by the string “ and “, 
      followed by the content of the <surname> of the second <name> must appear 
      in the content of all <xref>s that point to the <element-citation>.
      3. If there are more than 2 <name>s in the <person-group>, <xref> that 
      point to that citation must contain the content of only the first 
      of the <surname>s (check that the content of the other surnames 
      are not there), followed by the text "et al." Non-breaking spaces (&#160; and &#x00A0;)
      are allowed.
      
      High-5:
      All xrefs to <ref>s, which contain <element-citations, should contain, as the last part 
      of their content, the string ", " followed by the content of the year element in the 
      <element-citation>, or the year in parentheses. 

      High-6: Each <element-citation> element must have a @publication-type 
        attribute, which may only take the values 'journal', 'book', 'data', 
        'patent', 'clinicaltrial' [REMOVED], 'software', 'preprint', 'web', 
        'periodical', 'report', 'confproc', and 'thesis'.  

-->

<pattern 
   id="element-citation-high-tests"
   xmlns="http://purl.oclc.org/dsdl/schematron">

<title>High-level Tests for 'element-citation'</title>
  
  <rule context="ref-list" id="ref-list">
  
  </rule>
  
  <rule context="ref" id="ref">
    <let name="name" value="lower-case(if (local-name(element-citation/person-group[1]/*[1])='name')
      then (element-citation/person-group[1]/name[1]/surname)
      else (element-citation/person-group[1]/*[1]))"/>
    <let name="name" value="replace($name, '&#x00E0;', 'a')"/> <!-- Converting à to a -->
    <let name="name" value="replace($name, '&#x00E1;', 'a')"/> <!-- Converting á to a -->
    <let name="name" value="replace($name, '&#x00E2;', 'a')"/> <!-- Converting â to a -->
    <let name="name" value="replace($name, '&#x00E3;', 'a')"/> <!-- Converting ã to a -->   
    <let name="name" value="replace($name, '&#x00E4;', 'a')"/> <!-- Converting ä to a -->   
    <let name="name" value="replace($name, '&#x00E5;', 'a')"/> <!-- Converting å to a -->     
    <let name="name" value="replace($name, '&#x00E6;', 'ae')"/> <!-- Converting æ to ae -->     
    <let name="name" value="replace($name, '&#x00E7;', 'c')"/> <!-- Converting ç to c -->     
    <let name="name" value="replace($name, '&#x00E8;', 'e')"/> <!-- Converting è to e -->
    <let name="name" value="replace($name, '&#x00E9;', 'e')"/> <!-- Converting é to e -->     
    <let name="name" value="replace($name, '&#x00EA;', 'e')"/> <!-- Converting ê to e -->     
    <let name="name" value="replace($name, '&#x00EB;', 'e')"/> <!-- Converting ë to e -->    
    <let name="name" value="replace($name, '&#x0127;', 'h')"/> <!-- Converting ħ to h -->     
    <let name="name" value="replace($name, '&#x00EC;', 'i')"/> <!-- Converting ì to i -->     
    <let name="name" value="replace($name, '&#x00ED;', 'i')"/> <!-- Converting í to i -->
    <let name="name" value="replace($name, '&#x00EE;', 'i')"/> <!-- Converting î to i -->
    <let name="name" value="replace($name, '&#x00EF;', 'i')"/> <!-- Converting ï to i -->
    <let name="name" value="replace($name, '&#x0142;', 'l')"/> <!-- Converting ł to i -->
    <let name="name" value="replace($name, '&#x00F1;', 'n')"/> <!-- Converting ñ to n -->
    <let name="name" value="replace($name, '&#x00F2;', 'o')"/> <!-- Converting ò to o -->
    <let name="name" value="replace($name, '&#x00F3;', 'o')"/> <!-- Converting ó to o -->
    <let name="name" value="replace($name, '&#x00F4;', 'o')"/> <!-- Converting ô to o -->
    <let name="name" value="replace($name, '&#x00F5;', 'o')"/> <!-- Converting õ to o -->
    <let name="name" value="replace($name, '&#x00F6;', 'o')"/> <!-- Converting ö to o -->
    <let name="name" value="replace($name, '&#x00F8;', 'o')"/> <!-- Converting ø to o -->
    <let name="name" value="replace($name, '&#x00F9;', 'u')"/> <!-- Converting ù to u -->
    <let name="name" value="replace($name, '&#x00FA;', 'u')"/> <!-- Converting ú to u -->
    <let name="name" value="replace($name, '&#x00FB;', 'u')"/> <!-- Converting û to u -->
    <let name="name" value="replace($name, '&#x00FC;', 'u')"/> <!-- Converting ü to u -->
    <let name="name" value="replace($name, '&#x00FD;', 'y')"/> <!-- Converting ý to y -->
    <let name="name" value="replace($name, '&#x00FF;', 'y')"/> <!-- Converting ÿ to y -->
    
    <let name="name2" value="lower-case(if (local-name(element-citation/person-group[1]/*[2])='name')
      then (element-citation/person-group[1]/*[2]/surname)
      else (element-citation/person-group[1]/*[2]))"/>
    <let name="name2" value="replace($name2, '&#x00E0;', 'a')"/> <!-- Converting à to a -->
    <let name="name2" value="replace($name2, '&#x00E1;', 'a')"/> <!-- Converting á to a -->
    <let name="name2" value="replace($name2, '&#x00E2;', 'a')"/> <!-- Converting â to a -->
    <let name="name2" value="replace($name2, '&#x00E3;', 'a')"/> <!-- Converting ã to a -->   
    <let name="name2" value="replace($name2, '&#x00E4;', 'a')"/> <!-- Converting ä to a -->   
    <let name="name2" value="replace($name2, '&#x00E5;', 'a')"/> <!-- Converting å to a -->     
    <let name="name2" value="replace($name2, '&#x00E6;', 'ae')"/> <!-- Converting æ to ae -->     
    <let name="name2" value="replace($name2, '&#x00E7;', 'c')"/> <!-- Converting ç to c -->     
    <let name="name2" value="replace($name2, '&#x00E8;', 'e')"/> <!-- Converting è to e -->
    <let name="name2" value="replace($name2, '&#x00E9;', 'e')"/> <!-- Converting é to e -->     
    <let name="name2" value="replace($name2, '&#x00EA;', 'e')"/> <!-- Converting ê to e -->     
    <let name="name2" value="replace($name2, '&#x00EB;', 'e')"/> <!-- Converting ë to e -->   
    <let name="name2" value="replace($name2, '&#x0127;', 'h')"/> <!-- Converting ħ to h -->     
    <let name="name2" value="replace($name2, '&#x00EC;', 'i')"/> <!-- Converting ì to i -->     
    <let name="name2" value="replace($name2, '&#x00ED;', 'i')"/> <!-- Converting í to i -->
    <let name="name2" value="replace($name2, '&#x00EE;', 'i')"/> <!-- Converting î to i -->
    <let name="name2" value="replace($name2, '&#x00EF;', 'i')"/> <!-- Converting ï to i -->
    <let name="name2" value="replace($name2, '&#x0142;', 'l')"/> <!-- Converting ł to i -->
    <let name="name2" value="replace($name2, '&#x00F1;', 'n')"/> <!-- Converting ñ to n -->
    <let name="name2" value="replace($name2, '&#x00F2;', 'o')"/> <!-- Converting ò to o -->
    <let name="name2" value="replace($name2, '&#x00F3;', 'o')"/> <!-- Converting ó to o -->
    <let name="name2" value="replace($name2, '&#x00F4;', 'o')"/> <!-- Converting ô to o -->
    <let name="name2" value="replace($name2, '&#x00F5;', 'o')"/> <!-- Converting õ to o -->
    <let name="name2" value="replace($name2, '&#x00F6;', 'o')"/> <!-- Converting ö to o -->
    <let name="name2" value="replace($name2, '&#x00F8;', 'o')"/> <!-- Converting ø to o -->
    <let name="name2" value="replace($name2, '&#x00F9;', 'u')"/> <!-- Converting ù to u -->
    <let name="name2" value="replace($name2, '&#x00FA;', 'u')"/> <!-- Converting ú to u -->
    <let name="name2" value="replace($name2, '&#x00FB;', 'u')"/> <!-- Converting û to u -->
    <let name="name2" value="replace($name2, '&#x00FC;', 'u')"/> <!-- Converting ü to u -->
    <let name="name2" value="replace($name2, '&#x00FD;', 'y')"/> <!-- Converting ý to y -->
    <let name="name2" value="replace($name2, '&#x00FF;', 'y')"/> <!-- Converting ÿ to y -->
    
    <let name="preceding-name" value="lower-case(if (preceding-sibling::ref[1] and
      local-name(preceding-sibling::ref[1]/element-citation/person-group[1]/*[1])='name')
      then (preceding-sibling::ref[1]/element-citation/person-group[1]/name[1]/surname)
      else (preceding-sibling::ref[1]/element-citation/person-group[1]/*[1]))"/>
    <let name="preceding-name" value="replace($preceding-name, '&#x00E0;', 'a')"/> <!-- Converting à to a -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00E1;', 'a')"/> <!-- Converting á to a -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00E2;', 'a')"/> <!-- Converting â to a -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00E3;', 'a')"/> <!-- Converting ã to a -->   
    <let name="preceding-name" value="replace($preceding-name, '&#x00E4;', 'a')"/> <!-- Converting ä to a -->   
    <let name="preceding-name" value="replace($preceding-name, '&#x00E5;', 'a')"/> <!-- Converting å to a -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00E6;', 'ae')"/> <!-- Converting æ to ae -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00E7;', 'c')"/> <!-- Converting ç to c -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00E8;', 'e')"/> <!-- Converting è to e -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00E9;', 'e')"/> <!-- Converting é to e -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00EA;', 'e')"/> <!-- Converting ê to e -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00EB;', 'e')"/> <!-- Converting ë to e -->   
    <let name="preceding-name" value="replace($preceding-name, '&#x0127;', 'h')"/> <!-- Converting ħ to h -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00EC;', 'i')"/> <!-- Converting ì to i -->     
    <let name="preceding-name" value="replace($preceding-name, '&#x00ED;', 'i')"/> <!-- Converting í to i -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00EE;', 'i')"/> <!-- Converting î to i -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00EF;', 'i')"/> <!-- Converting ï to i -->
    <let name="preceding-name" value="replace($preceding-name, '&#x0142;', 'l')"/> <!-- Converting ł to i -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F1;', 'n')"/> <!-- Converting ñ to n -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F2;', 'o')"/> <!-- Converting ò to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F3;', 'o')"/> <!-- Converting ó to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F4;', 'o')"/> <!-- Converting ô to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F5;', 'o')"/> <!-- Converting õ to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F6;', 'o')"/> <!-- Converting ö to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F8;', 'o')"/> <!-- Converting ø to o -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00F9;', 'u')"/> <!-- Converting ù to u -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00FA;', 'u')"/> <!-- Converting ú to u -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00FB;', 'u')"/> <!-- Converting û to u -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00FC;', 'u')"/> <!-- Converting ü to u -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00FD;', 'y')"/> <!-- Converting ý to y -->
    <let name="preceding-name" value="replace($preceding-name, '&#x00FF;', 'y')"/> <!-- Converting ÿ to y -->

    <let name="preceding-name2" value="lower-case(if (preceding-sibling::ref[1] and
      local-name(preceding-sibling::ref[1]/element-citation/person-group[1]/*[2])='name')
      then (preceding-sibling::ref[1]/element-citation/person-group[1]/*[2]/surname)
      else (preceding-sibling::ref[1]/element-citation/person-group[1]/*[2]))"/>
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E0;', 'a')"/> <!-- Converting à to a -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E1;', 'a')"/> <!-- Converting á to a -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E2;', 'a')"/> <!-- Converting â to a -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E3;', 'a')"/> <!-- Converting ã to a -->   
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E4;', 'a')"/> <!-- Converting ä to a -->   
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E5;', 'a')"/> <!-- Converting å to a -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E6;', 'ae')"/> <!-- Converting æ to ae -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E7;', 'c')"/> <!-- Converting ç to c -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E8;', 'e')"/> <!-- Converting è to e --> 
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00E9;', 'e')"/> <!-- Converting é to e -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00EA;', 'e')"/> <!-- Converting ê to e -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00EB;', 'e')"/> <!-- Converting ë to e -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x0127;', 'h')"/> <!-- Converting ħ to h -->       
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00EC;', 'i')"/> <!-- Converting ì to i -->     
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00ED;', 'i')"/> <!-- Converting í to i -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00EE;', 'i')"/> <!-- Converting î to i -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00EF;', 'i')"/> <!-- Converting ï to i -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x0142;', 'l')"/> <!-- Converting ł to i -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F1;', 'n')"/> <!-- Converting ñ to n -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F2;', 'o')"/> <!-- Converting ò to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F3;', 'o')"/> <!-- Converting ó to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F4;', 'o')"/> <!-- Converting ô to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F5;', 'o')"/> <!-- Converting õ to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F6;', 'o')"/> <!-- Converting ö to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F8;', 'o')"/> <!-- Converting ø to o -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00F9;', 'u')"/> <!-- Converting ù to u -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00FA;', 'u')"/> <!-- Converting ú to u -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00FB;', 'u')"/> <!-- Converting û to u -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00FC;', 'u')"/> <!-- Converting ü to u -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00FD;', 'y')"/> <!-- Converting ý to y -->
    <let name="preceding-name2" value="replace($preceding-name2, '&#x00FF;', 'y')"/> <!-- Converting ÿ to y -->

    <assert test="count(*) = count(element-citation)"
      role="error" 
      id="err-elem-cit-high-1">[err-elem-cit-high-1]
      The only element that is allowed as a child of &lt;ref> is
      &lt;element-citation>. 
      Reference '<value-of select="@id"/>' has other elements.
    </assert>
    
    <!-- else:
       -->

    <assert test="if (count(element-citation/person-group[1]/*) != 2)
      then (count(preceding-sibling::ref) = 0 or 
      ($name > $preceding-name) or
      ($name = $preceding-name and
      element-citation/year >= preceding-sibling::ref[1]/element-citation/year))
      else (count(preceding-sibling::ref) = 0 
      or ($name > $preceding-name) or
      ($name = $preceding-name and $name2 > $preceding-name2) 
      or 
      ($name = $preceding-name and $name2 = $preceding-name2 and
      element-citation/year >= preceding-sibling::ref[1]/element-citation/year)
      or
      ($name = $preceding-name and
      count(preceding-sibling::ref[1]/element-citation/person-group[1]/*) !=2)
      )"
      role="error" 
      id="err-elem-cit-high-2-2">[err-elem-cit-high-2-2]
      The order of &lt;element-citation>s in the reference list should be name and date, arranged alphabetically 
      by the first author’s surname, or by the value of the first &lt;collab> element. In the case of
      two authors, the sequence should be arranged by both authors' surnames, then date. For
      three or more authors, the sequence should be the first author's surname, then date.
      Reference '<value-of select="@id"/>' appears to be in a different order.
    </assert>
 
    <assert test="@id"
      role="error" 
      id="err-elem-cit-high-3-1">[err-elem-cit-high-3-1]
      Each &lt;ref> element must have an @id attribute. 
    </assert>
    
    <assert test="matches(normalize-space(@id) ,'^bib\d+')"
      role="error" 
      id="err-elem-cit-high-3-2">[err-elem-cit-high-3-2]
      Each &lt;ref> element must have an @id attribute that starts with 'bib' and ends with 
      a number. 
      Reference '<value-of select="@id"/>' has the value 
      '<value-of select="@id"/>', which is incorrect.
    </assert>
    
    <assert test="count(preceding-sibling::ref)=0 or number(substring(@id,4)) gt number(substring(preceding-sibling::ref[1]/@id,4))"
      role="error" 
      id="err-elem-cit-high-3-3">[err-elem-cit-high-3-3]
      The sequence of ids in the &lt;ref> elements must increase monotonically
      (e.g. 1,2,3,4,5, . . . ,50,51,52,53, . . . etc).
      Reference '<value-of select="@id"/>' has the value 
      '<value-of select="@id"/>', which does not fit this pattern.
    </assert>
    
    <let name="year-comma" value="', \d{4}\w?$'"/>
    <let name="year-paren" value="' \(\d{4}\w?\)$'"/>
    
    <assert test="every $x in //xref[@rid=current()/@id]
      satisfies (
      if (count(current()/element-citation/person-group[1]/(name | collab))=1) 
      then (
      matches(normalize-space($x), concat('^', current()/element-citation/person-group[1]/name/surname, $year-comma))
      or
      matches(normalize-space($x), concat('^', current()/element-citation/person-group[1]/name/surname, $year-paren))
      or
      matches(normalize-space($x), concat('^', current()/element-citation/person-group[1]/collab, $year-comma))
      or
      matches(normalize-space($x), concat('^', current()/element-citation/person-group[1]/collab, $year-paren))
      )
      else 
      if (count(current()/element-citation/person-group[1]/(name|collab))=2) 
      then (
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
      ' and ', current()/element-citation/person-group[1]/name[2]/surname, $year-comma))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
      ' and ', current()/element-citation/person-group[1]/name[2]/surname, $year-paren))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
      ' and ', current()/element-citation/person-group[1]/collab[1], $year-comma))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
      ' and ', current()/element-citation/person-group[1]/collab[1], $year-paren))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
      ' and ', current()/element-citation/person-group[1]/name[1]/surname, $year-comma))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
      ' and ', current()/element-citation/person-group[1]/name[1]/surname, $year-paren))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
      ' and ', current()/element-citation/person-group[1]/collab[2], $year-comma))
      or
      matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
      ' and ', current()/element-citation/person-group[1]/collab[2], $year-paren))
      )
      else 
      if (count(current()/element-citation/person-group[1]/(name|collab))>2) 
      then (if (local-name(current()/element-citation/person-group[1]/*[1])='name')
            then (matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
            ' et al.', $year-comma))
            or
            matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/name[1]/surname,
            ' et al.', $year-paren)))
            else (matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
            ' et al.', $year-comma))
            or
            matches(replace($x,'\p{Zs}',' '), concat('^', current()/element-citation/person-group[1]/collab[1],
            ' et al.', $year-paren)))
      )   
      else ()
      )"
      role="error"
      id="err-elem-cit-high-4">
      <value-of select="$name"/> and  <value-of select="$name2"/> 
      [err-elem-cit-high-4]
      <!--     <let name="name" value="lower-case(if (local-name(element-citation/person-group[1]/*[1])='name')
      then (element-citation/person-group[1]/name[1]/surname)
      else (element-citation/person-group[1]/*[1]))"/>
    <let name="name2" value="lower-case(if (local-name(element-citation/person-group[1]/*[2])='name')
      then (element-citation/person-group[1]/*[2]/surname)
      else (element-citation/person-group[1]/*[2]))"/> -->
      If an element-citation/person-group contains one &lt;name>, 
      the content of the &lt;surname> inside that name must appear in the 
      content of all &lt;xref>s that point to the &lt;element-citation>. 
      If an element-citation/person-group contains 2 &lt;name>s, the content 
      of the first &lt;surname> of the first &lt;name>, followed by the string “ and “, 
      followed by the content of the &lt;surname> of the second &lt;name> must appear 
      in the content of all &lt;xref>s that point to the &lt;element-citation>. 
      If there are more than 2 &lt;name>s in the &lt;person-group>, all &lt;xref>s that 
      point to that reference must contain the content of only the first 
      of the &lt;surname>s, followed by the text "et al."
      All of these are followed by ', ' and the year, or by the year in parentheses.
      There are <value-of select="count(//xref[@rid=current()/@id]/@rid)"/> &lt;xref> references 
      with @rid = <value-of select="@id"/> to be checked. The first name should be 
      '<value-of select="element-citation/person-group[1]/(name[1]/surname | collab[1])[1]"/>'.
    </assert>
    
      <!-- If there is more than one year (caught by a different test), use the first year to compare. -->
    <assert test="every $x in //xref[@rid=current()/@id]
      satisfies (matches(replace($x,'\p{Zs}',' '), concat(', ',current()/element-citation/year[1]),'s') or
      matches(replace($x,'\p{Zs}',' '), concat('\(',current()/element-citation/year[1],'\)')))"
      role="error" 
      id="err-elem-cit-high-5">[err-elem-cit-high-5]
      All xrefs to &lt;ref>s, which contain &lt;element-citation>s, should contain, as the last part 
      of their content, the string ", " followed by the content of the year element in the 
      &lt;element-citation>, or the year in parentheses. 
      There is an incorrect &lt;xref> with @rid <value-of select="@id"/>. It should contain the string 
      ', <value-of select="element-citation/year"/>' or the string 
      '(<value-of select="element-citation/year"/>)' but does not.
      There are <value-of select="count(//xref[@rid=current()/@id]/@rid)"/> references to be checked.
    </assert>
    
  </rule>
  
  <rule context="xref[@ref-type='bibr']" id="xref">
    
    <assert test="not(matches(substring(normalize-space(.),string-length(.)),'[b-z]')) or 
      (some $x in preceding::xref
      satisfies (substring(normalize-space(.),string-length(.)) gt substring(normalize-space($x),string-length(.))))"
      role="error" 
      id="err-xref-high-2-1">[err-xref-high-2-1]
      Citations in the text to references with the same author(s) in the same year must be arranged in the same 
      order as the reference list. The xref with the value '<value-of select="."/>' is in the wrong order in the 
      text. Check all the references to citations for the same authors to determine which need to be changed.
    </assert>
    
  </rule>

<rule context="element-citation" id="elem-citation">
  
  <assert test="@publication-type" role="error" 
    id="err-elem-cit-high-6-1">[err-elem-cit-high-6-1]
    The element-citation element must have a publication-type attribute.
    Reference '<value-of select="../@id"/>' does not.
  </assert>

      <assert test="@publication-type = 'journal' or
                    @publication-type = 'book'    or
                    @publication-type = 'data'    or
                    @publication-type = 'patent'    or
                    @publication-type = 'software'    or
                    @publication-type = 'preprint' or
                    @publication-type = 'web'    or
                    @publication-type = 'periodical' or
                    @publication-type = 'report'    or
                    @publication-type = 'confproc'    or
                    @publication-type = 'thesis'"
              role="error" 
              id="err-elem-cit-high-6-2">[err-elem-cit-high-6-2]
        The publication-type attribute may only take the values 'journal', 'book', 'data', 
        'patent', 'software', 'preprint', 'web', 
        'periodical', 'report', 'confproc', or 'thesis'. 
        Reference '<value-of select="../@id"/>' has the publication-type 
        '<value-of select="@publication-type"/>'.</assert>

  </rule>

</pattern>

<!-- ============= End Element Citation High Tests ============ -->
