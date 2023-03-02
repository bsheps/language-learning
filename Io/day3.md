# Do
1. Enhance the XML program to add spaces to show the indentation structure.

    See file: [builder-autoIndent.io](./builder-autoIndent.io)

    ```
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
    ```

2. Create a list syntax that uses brackets. (Clarification please? Is this referring to the phonebook.io example? Maybe this should be Q1 so "homework" is in same order as chapter?)

    See file [Brackets.io](./Brackets.io). Turns out `squareBrackets` and `curlyBrackets` are special case methods where parser will call those methods anytime it encounters `{}` or `[]`

    ```
    Object squareBrackets := Object getSlot("list")

    a := [1, 2, 3] 
    a println

    a = [1,[2,3]]
    a println

    a = [1,[2,[3]]]
    a println
    a flatten println
    ```

3. Enhance the XML program to handle attributes: if the first argu- ment is a map (use the curly brackets syntax), add attributes to the XML program. For example:
`book({"author": "Tate"}...)` would print `<book author="Tate">`.

    See [builder.io](./builder.io) file, which builds on the auto indentation from problem 1.

    Step 1 is to get curlyBrackets and colon operator setup. This is mostly copy paste from chapter, but I had to modify curlyBrackets method to use `doString` since DSL code is not coming from a file like before.

    ```
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
    ```

    Next I had to expand the opening tag logic in the forward slot. I added logic to check if the first message argument was a curlyBrackets item. Since our key value attributes are curlyBrackets messages, we can loop through and write out key value pairs.

    ```
    Builder forward := method(
        ...
        ...
        args := call message arguments
        write("<", call message name)
        if(args size > 0 and args at(0) name == "curlyBrackets",
            arg1 := doMessage(args removeFirst)
            arg1 foreach(k, v, 
                write(" ",k,"=\"", v, "\"")
            )
            
        )
        writeln(">")
        ...
        ...
    )
    ```