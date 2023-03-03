xquery version "3.1";

declare context item := document {
<books>
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
</books>
};

(:
/books/book[fn:contains(./title, "Book")] - to return anything with "Book" in the title
:)

(:
/books/book[fn:contains(./title, "Book")][fn:concat(/books/book/author, ". ", /books/book/date, ".")] - trying to figure out how to do a brief citation
:)

(:
/books/book[./date/@year/xs:integer(.) gt 2015] - to return only books published after 2015
:)

(:
/books/book[fn:position() = (2 to 4)] - to return 2-4 in the list
:)

/books/book