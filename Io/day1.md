# Find
 - Some io example problems: https://github.com/IoLanguage/io/tree/master/samples/misc
 - An Io community that will answer questions: https://stackoverflow.com/questions/tagged/iolanguage
 - A style guide with Io idioms

# Answer
 - Is Io strongly or weakly typed? (evaluate `1+1` and `1 + "one"`)
 Strongly typed - types are not implicitly converted; code example below.
 ```
Io> 1+ "one"

  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
  ---------
  message '+' in 'Command Line' on line 1

Io> 1 type
==> Number
Io> "one" type
==> Sequence
 ```
 - Is 0 true or false? What about the empty string? Is nil true or false? Support with code.
 ```
Io> 0 isTrue
==> true
Io> "" isTrue
==> true
Io> nil isTrue
==> false
```
 - How can you tell what slots a prototype supports?
 When an object receives a message, lookup is performed via depth first recursively.(fyi - multiple inheritance is supported in Io)
 ```
 Io> Car
==>  Car_0x600003742700:
  type             = "Car"
  wheels           = "24 inches"

Io> Car slotNames
==> list(wheels, type)
Io> Car proto
==>  Vehicle_0x600003732a00:
  desc             = "a vehicle description"
  type             = "Vehicle"

Io> Vehicle
==>  Vehicle_0x600003732a00:
  desc             = "a vehicle description"
  type             = "Vehicle"

Io> Vehicle slotNames
==> list(type, desc)
Io> Vehicle proto
==>  Object_0x6000037fc1c0:
                   = Object_()
  !=               = Object_!=()
  -                = Object_-()
  ..               = method(arg, ...)
  <                = Object_<()
  // ...
  // skipping a lot of entries to save room 
  // ...
  write            = Object_write()
  writeln          = Object_writeln()
  yield            = method(...)

Io> Object slotNames
==> list(isKindOf, while, break, slotSummary, lazySlot, .., returnIfError, compare, writeln, hasProto, isActivatable, list, setProtos, write, ownsSlots, justSerialized, perform, setSlotWithType, asBoolean, hasLocalSlot, super, apropos, ifNilEval, thisMessage, if, print, wait, slotNames, ifNonNilEval, actorProcessQueue, ifError, , appendProto, lexicalDo, performWithArgList, proto, resend, setSlot, argIsActivationRecord, currentCoro, and, markClean, serialized, uniqueId, ifNonNil, for, coroDoLater, argIsCall, !=, init, slotValues, return, type, isTrue, foreachSlot, method, deprecatedWarning, evalArgAndReturnSelf, coroDo, asyncSend, ifNil, cloneWithoutInit, block, isLaunchScript, isIdenticalTo, relativeDoFile, newSlot, ?, >, shallowCopy, doString, handleActorException, asSimpleString, serializedSlots, hasSlot, futureSend, not, removeProto, continue, doFile, <=, doMessage, slotDescriptionMap, contextWithSlot, in, setIsActivatable, become, removeAllSlots, <, switch, @@, pause, println, yield, evalArg, returnIfNonNil, thisLocalContext, ancestors, asString, or, launchFile, ==, hasDirtySlot, protos, getSlot, serializedSlotsWithNames, do, removeSlot, uniqueHexId, prependProto, try, raiseIfError, stopStatus, coroFor, @, clone, inlineMethod, ancestorWithSlot, isNil, removeAllProtos, doRelativeFile, >=, addTrait, evalArgAndReturnNil, memorySize, coroWith, actorRun, loop, thisContext, updateSlot, -, getLocalSlot, isError, message, setProto)
Io> Object proto
==>  Object_0x6000037f4c40:
  Car              = Car_0x600003742700
  Lobby            = Object_0x6000037f4c40
  Protos           = Object_0x6000037f4bc0
  Vehicle          = Vehicle_0x600003732a00
  _                = Object_0x6000037f4c40
  exit             = method(...)
  forward          = method(...)
  set_             = method(...)
```
- What is the difference between = (equals), := (colon equals), and :
```
operator	action
::=	Creates slot, creates setter, assigns value
:=	Creates slot, assigns value
=	Assigns value to slot if it exists, otherwise raises exception
:= (colon colon equals)? When would you use each?
```

# Do 
- Run an Io program from a file.
`io hello.io`
- Execute the code in a slot given its name.
```
Io> Cat := Object clone
==>  Cat_0x6000039edbc0:
  type             = "Cat"

Io> Cat sound := method(writeln("prrrr"))
==> method(
    writeln("prrrr")
)
Io> Cat sound
prrrr
==> nil
```

