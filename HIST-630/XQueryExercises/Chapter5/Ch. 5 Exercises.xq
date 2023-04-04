xquery version "3.1";

(:Exercise 1:)

(:declare namespace tei = "http://www.tei-c.org/ns/1.0";

<tei:title>
    { fn:concat("The Lord of the Rings", ": ", "The Fellowship of the Ring") }
</tei:title>:)

(:Exercise 2

let $my-name := "Lindsey"
(:return $my-name:)
return fn:concat("Hello", ", ", $my-name):)

(:Exercise 3
let $names := ("Joe", "Cliff", "Eleanor", "Leila", "Cooper", "Thomas", "Ben")

for $name in $names

return fn:concat("Hello", ", ", $name, "!"):)

(:Exercise 7
let $names := ("Joe", "Cliff", "Eleanor", "Leila", "Cooper", "Thomas", "Ben")

for $name in $names

return 
    if (fn:contains($name, "Cliff")) then
    fn:concat("Bonjour", ", ", $name, "!")
else
    fn:concat("Hello", ", ", $name, "!"):)

declare context item := document {
<list>
    <book>
        <title>Documents of Performance in Early Modern England</title>
        <author>Tiffany Stern</author>
        <date year="2009">2009</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
        <identifier type="ISBN-10">0521842372</identifier>
        <identifier type="ISBN-13">978-0521842372</identifier>
    </book>
    <book>
        <title>Paratexts: Thresholds of Interpretation</title>
        <author>Gerard Genette</author>
        <date year="1997">1997</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
        <identifier type="ISBN-10">0521424062</identifier>
        <identifier type="ISBN-13">978-0521424062</identifier>
    </book>
    <book>
        <title>Shakespeare and Lost Plays: Reimagining Drama in Early Modern England</title>
        <author>David McInnis</author>
        <date year="2023">2023</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
        <identifier type="ISBN-10">1108824156</identifier>
        <identifier type="ISBN-13">978-1108824156</identifier>
    </book>
    <book>
        <title>Renaissance Drama and the Politics of Publication: Readings in the English Book Trade</title>
        <author>Zachary Lesser</author>
        <date year="2004">2004</date>
        <publisher>
            <city>New York</city>
            <press>Cambridge University Press</press>
        </publisher>
        <identifier type="ISBN-10">0521842525</identifier>
        <identifier type="ISBN-13">978-0521842525</identifier>
    </book>
    <book>
        <title>Used Books: Marking Readers in Renaissance England</title>
        <author>William H. Sherman</author>
        <date year="2008">2008</date>
        <publisher>
            <city>Philadelphia</city>
            <press>University of Pennsylvania Press</press>
        </publisher>
        <identifier type="ISBN-10">0812220841</identifier>
        <identifier type="ISBN-13">978-0812220841</identifier>
    </book>
</list>
};

(:Exercise 4:)
(:let $list := //list
let $books := $list/book

for $book in $books
return $book/title
OR
let $book := list/book
return $book/title
OR
for $book in list/book
return $book/title - RETURN ALL TITLES:)

(:for $book in list/book
    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
RETURN CITATION:)

(:for $book in list/book

    where fn:contains($book/title, "Drama")
    where fn:contains($book/date, "2023")

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
WHERE clause (x2):)

(:for $book in list/book [fn:contains(title, "Drama")]

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
predicate instead of a where clause:)

(:for $book in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    order by $author
    
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
ORDER ALPHABETICALLY BY AUTHOR (FIRST NAME):)

(:for $book in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    order by $title
    
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
ORDER ALPHABETICALLY BY TITLE:)

(:for $book in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    order by $date
    
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
ORDER CHRONOLOGICALLY BY DATE:)

(:for $book in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    order by $date descending
    
return 
    <bibl>
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>
ORDER REVERSE CHRONOLOGICALLY BY DATE:)

(:Exercise 5
for $book at $n in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    order by $title
    
return 
    <bibl n="{$n}">
        { fn:concat($author, ". ", $title, ". ", $press, ", ", $date, ". ") }
    </bibl>:)

(:Exercise 6
for $book at $n in list/book

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
    
    let $year := $book/date/@year
    group by $year
    
return 
    <book published="{$year}">
        { $book/title }
    </book>:)

(:Exercise 8:)
for $book in list/book

let $type :=
    if (xs:integer($book/date/@year) lt 2005) then "old"
    else "new"
    
group by $type

return
    <bucket type="{$type}">
        { $book/title }
    </bucket>