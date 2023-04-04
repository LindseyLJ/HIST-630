xquery version "3.1";

(:
Exercise 1: I looked at the fn:remove function. On the XQuery Functions website, the full signature is not given, although the description of the function is virtually the same as on the XPath and XQuery Functions and Operators specification, which does give the full signature:
fn:remove($target as item()*, $position as xs:integer) as item()*

The latter is more clear to me. The former is a more streamlined description of the function.

:)

(:
Exercise 2: Did the reading.
:)

(:
Exercise 3:
fn:substring("Digital Humanities", 9)

fn:substring("Digital Humanities", 9, 10)
:)

(: Exercise 4
fn:head(("Shinpei Goto", "Gentara Kodama", "Kenjiro Den")) - returns Shinpei Goto

fn:tail(("Shinpei Goto", "Gentara Kodama", "Kenjiro Den")) - returns Gentara Kodama Kenjiro Den
:)

(:
Exercise 5

declare function local:construct-english-list(
    $list as xs:string*) as xs:string
        {fn:concat(fn:string-join(fn:subsequence($list, 1, 2), ", "), ", and ", fn:subsequence($list, 3))
};

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")

return local:construct-english-list($names)
:)

(:
Exercise 6

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")

let $construct-english-list := function ($list as xs:string*) as xs:string
        {
        fn:concat(fn:string-join(fn:subsequence($list, 1, 2), ", "), ", and ", fn:subsequence($list, 3))}

return $construct-english-list($names)
:)

(:
Exercise 7

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare function local:construct-tei-persName(
$fullName as xs:string*) as element(tei:persName)
{
<persName xmlns="http://www.tei-c.org/ns/1.0">
    <forename xmlns="http://www.tei-c.org/ns/1.0">{ fn:head(fn:tokenize($fullName, " "))}</forename>
    <surname xmlns="http://www.tei-c.org/ns/1.0">{ fn:tail(fn:tokenize($fullName, " "))}</surname>
</persName>
};

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")

for $name in $names
    return local:construct-tei-persName($name)
:)

(:
Exercise 8
:)

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare function local:transform-persName(
$nameList as element(tei:persName)) as xs:string
{
    fn:concat(fn:upper-case($nameList/tei:surname/text()), " ", $nameList/tei:forename/text())
};

declare variable $persName :=
<persName xmlns="http://www.tei-c.org/ns/1.0">
    <forename>Shinpei</forename>
    <surname>Goto</surname>
</persName>;

for $name in $persName
return local:transform-persName($name)