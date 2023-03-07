xquery version "3.1";

declare context item := document {
<list>
    <book date="2015">Interdisciplining Digital Humanities</book>
    <book date="2013">Hacking the Academy</book>
    <book date="2016">New Companion to Digital Humanities</book>
    <book date="2013">Macroanalysis</book>
    <book date="2013">Emergence of the Digital Humanities</book>
    <book date="2014">Digital Critical Editions</book>
    <book date="2015">Digital Humanities</book>
</list>
};

let $list :=//list
let $books :=$list/book

(:for $book in $books
order by $book/@date, $book/text()
return $book:)

(:for $book at $n in $list/book
return fn:concat($n, ". ", $book/text()):)

(:for $book in $list/book
order by $book/text()
count $n
return fn:concat($n, ". ", $book/text()):)

(:for $book in $list/book
order by $book/@date descending, $book/text()
group by $date := $book/@date
return
    <list published="{ $date }">
        { $book }
    </list>
THIS RETURNS A LIST ORDERED 2015, 2016, 2013, 2014  
:)

let $titles := $list/book/text()
let $phrase := "Digital Humanities"
for $title in $titles
return
    if (fn:contains($title, $phrase)) then
    "A book about DH. "
    else
    "A book about something else. "