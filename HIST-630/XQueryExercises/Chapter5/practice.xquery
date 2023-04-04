xquery version "3.1";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

(:declare default element namespace "http://www.tei-c.org/ns/1.0";:)

(:fn:concat("Nashville", ", ", "TN"):)

(://placeName:)

(:<tei:placeName/>:)

(:<placeName xmlns="http://www.tei-c.org/ns/1.0"/>:)

(:<placeName xmlns="http://www.tei-c.org/ns/1.0">
{ fn:concat("Nashville", ", ", "TN") }
</placeName>:)

(:let $isbn := "978-0300137231"
let $isbn-without-dash := fn:replace($isbn, "-", "")
return
fn:string-length($isbn-without-dash):)

2 + 2 = 4