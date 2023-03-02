Builder := Object clone

Builder indentCount := 0
Builder indentSize := 4

Builder formatCode := method(
    for(i, 1, self indentCount, write(" "))
)

Builder plusIndent := method(
    self indentCount = indentCount + indentSize
)

Builder minusIndent := method(
    indentCount = indentCount - indentSize
)

Builder forward := method(
    formatCode
    writeln("<", call message name, ">")
    plusIndent
    call message arguments foreach(
        arg, 
        content := self doMessage(arg); 
        if(content type == "Sequence", formatCode; writeln(content))
    )
    minusIndent
    formatCode
    writeln("</", call message name, ">")
)

Builder  ul(
    li("Io"), 
    li("Lua"), 
    li("JavaScript"))

/* console output from program
<ul>
    <li>
        Io
    </li>
    <li>
        Lua
    </li>
    <li>
        JavaScript
    </li>
</ul>
*/