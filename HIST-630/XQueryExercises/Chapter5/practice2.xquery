xquery version "3.1";

declare context item := document {
<book>
    <title>Primo Levi: The Matter of a Life</title>
    <author>Berel Lang</author>
    <date year="2013">November 26, 2013</date>
    <publisher>
         <city>New Haven</city>
         <press>Yale University Press</press>
    </publisher>
    <identifier type="ISBN-10">0300137230</identifier>
    <identifier type="ISBN-13">978-0300137231</identifier>
    <identifier type="OCLC">840803708</identifier>
</book>
};

let $book :=//book

(:for $identifier in $book/identifier
where $identifier/@type = ("ISBN-10", "ISBN-13")
return distinct-values($identifier/text()):)

(:let $isbn1 := $book/identifier[1]
let $isbn2 := $book/identifier[2]
return
(
fn:concat( fn:string($isbn1/@type), $isbn1/text() ),
fn:concat( fn:string($isbn2/@type), $isbn2/text() )
)
THIS IS THE "HACK" FLWOR EXPRESSION
:)

(:for $isbn in $book/identifier
return
fn:concat( fn:string($isbn/@type), $isbn/text() ):)

(:for $identifier in $book/identifier
where $identifier/@type = ("ISBN-10", "ISBN-13")
return distinct-values($identifier/text())
:)

(:for $identifier in $book/identifier[@type = ("ISBN-10", "ISBN-13")]
return distinct-values($identifier/text())
:)

(:$book/identifier[@type = ("ISBN-10", "ISBN-13")]/text():)

