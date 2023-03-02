OperatorTable addAssignOperator(":", "atPutAttribute")
Map atPutAttribute := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

curlyBrackets := method(
	map := Map clone
	call message arguments foreach(arg, 
		map doString(arg asString)
	)
	map
)

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
	args := call message arguments
	write("<", call message name)
	if(args size > 0 and args at(0) name == "curlyBrackets",
		arg1 := doMessage(args removeFirst)
		arg1 foreach(k, v, 
			write(" ",k,"=\"", v, "\"")
		)
		
	)
	writeln(">")
	plusIndent
	args foreach(
		arg, 
		content := self doMessage(arg); 
		if(content type == "Sequence", formatCode; writeln(content))
	)
	minusIndent
	formatCode
	writeln("</", call message name, ">")
)

Builder  ul(
	li({"isDone":"true"},"Io"), 
	li("Lua"), 
	li("JavaScript"))
writeln
Builder body(
	div(
		p("Hello world")
	)
)
writeln
Builder book({"author":"Bruce Tate", "hello": "world"},"stuff")
writeln
Builder empty({"size":"large"})
writeln
Builder empty()

/* console output from program, notice attributes on some of the tags
<ul>
    <li isDone="true">
        Io
    </li>
    <li>
        Lua
    </li>
    <li>
        JavaScript
    </li>
</ul>

<body>
    <div>
        <p>
            Hello world
        </p>
    </div>
</body>

<book hello="world" author="Bruce Tate">
    stuff
</book>

<empty size="large">
</empty>

<empty>
</empty>
*/