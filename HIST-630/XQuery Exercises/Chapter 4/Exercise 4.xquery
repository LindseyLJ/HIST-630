xquery version "3.1";

declare context item := document {
<name>
    <foreName>Lindsey</foreName>
    <surname>Jones</surname>
</name>
};

/name/surname/fn:string-length(.)