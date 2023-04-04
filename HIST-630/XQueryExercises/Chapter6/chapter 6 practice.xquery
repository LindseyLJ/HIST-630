xquery version "3.1";

(:fn:normalize-space("Hello XQuery. How are you?"):)

(:fn:substring($sourceString as xs:string?, $start as xs:double, $length as xs:double) as xs:string:)

(:fn:substring("I love XQuery", 3, 4):)

(:fn:head($arg as item()*) as item()?:)

(:fn:tail($arg as item()*) as item()*:)

(: fn:index-of($seq as xs:anyAtomicType*, $search as xs:anyAtomicType) as xs:integer*:)

(:fn:index-of(("New York", "Paris", "Tokyo", "Buenos Aires"), "Tokyo"):)

(:("New York", "Paris", "Tokyo", "Buenos Aires") [3]:)

(:("New York", "Paris", "Tokyo", "Buenos Aires") [position() = (1, 3)]:)

(:fn:subsequence($sourceSeq as item()*, $startingLoc as xs:double, $length as xs:double) as item()*:)

(:fn:subsequence(("New York", "Paris", "Tokyo", "Buenos Aires"), 2, 2):)

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare function local:make-tei-title(
    $title as xs:string,
    $subtitle as xs:string?
    ) as element(tei:title) {
    <title type="full" xmlns="http://www.tei-c.org/ns/1.0">
        <title type="main">{ $title }</title>
        <title type="sub">{ $subtitle }</title>
    </title>
};

local:make-tei-title(
"Citizens at Last",
"The Woman Suffrage Movement in Texas"
)

(:let $title :="Citizens at Last"
let $subtitle :="The Woman Suffrage Movement in Texas"
let $join-titles :=
function($title as xs:string, $subtitle as xs:string)
as xs:string {
fn:concat($title, ": ", $subtitle)
}
return $join-titles($title, $subtitle):)