xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $doc := tei:TEI;

declare function local:transform($originals as node()*) {
    for $original in $originals
    return
        typeswitch ($original)
            case text() return $original
            case element (tei:TEI) return 
                <html xmlns="http://www.w3.org/1999/xhtml">{local:transform($original/node())}</html>
            case element (tei:teiHeader) return <head>{local:transform($original/node())}</head>
            case element (tei:fileDesc) return <title>{local:transform($original//tei:title/node())}</title>
            case element (tei:text) return <body>{local:transform($original/tei:body/node())}</body>
            case element(tei:div) return <div>{ local:transform($original/node()) }</div>
            case element(tei:lg) return <p>{local:transform($original/node()) }</p>
            case element(tei:ab) return <p>{local:transform($original/node()) }</p>
            case element (tei:persName) return 
                <a href="{$original/@ref}">{local:transform($original/node())}</a>
            case element (tei:roleName) return 
                <span style="font-family:courier; font-size:90%;">{local:transform($original/node()) }</span>
            case element (tei:forename) return 
                <span style="font-family:tahoma; font-size:80%;">{local:transform($original/node()) }</span>
            case element (tei:geogName) return 
                <a href="{$original/@ref}">{local:transform($original/node())}</a>
            case element (tei:placeName) return 
                <a href="{$original/@ref}">{local:transform($original/node())}</a>
            case element (tei:country) return 
                <span style="font-family:georgia; font-size:90%;">{local:transform($original/node()) }</span>
            (:case element(tei:quote) return <blockquote> { local:transform($original/node()) } </blockquote>:)
            case element(tei:lb) return <br>{local:transform($original/tei:body/node()) }</br>
            case element(tei:del) return <del>{local:transform($original/node()) }</del>
            case element(tei:add) return <ins>{local:transform($original/node()) }</ins>
            case element(tei:supplied) return <i>{local:transform($original/node()) }</i>
            case element(tei:fw) return <p style="text-align:right;">{local:transform($original/node()) }</p>
            case element(tei:gap) return <span style="background-color:Cornsilk;">{local:transform($original/node()) }</span>
            case element(tei:l) return
                (
                    local:transform($original/node()),
                    if ($original/following-sibling::tei:l) then
                        <br/>
                    else 
                        ()
                )
            default return
                $original
};

local:transform($doc)