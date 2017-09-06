"

"
Class {
	#name : #OCPragmaTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Source,
	#timestamp : ''
}

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodDoublePragma [
	^'methodDoublePragma
		<hello: 5>
		<hello: 2>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodNoPragma [
	^'methodNoPragma: aNum
		^aNum'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPragmaAfterBeforTemps [
	^'methodPragmaAfterBeforTemps
		<hello: 5>
		| aTemp |
		<world: #ok>
		<blue: true>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPragmaTwoParam [
	^'methodDoublePragma
		<hello: 5 by: 2>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPragmaUnarayMessage [
	^'methodPragmaUnarayMessage
		<hello>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPrimitive [
	^'methodPrimitive
		<primitive: 4>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPrimitivePragma [
	^'methodPrimitivePragma
		<hello: 1>
		<primitive: 4>
		<hello: 1>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPrimitiveString [
	^'methodPrimitiveString
		<primitive: ''aFunctionName''>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodPrimitiveStringModule [
	^'methodPrimitiveStringModule
		<primitive: ''aFunctionName'' module: ''aModuleName''>'
]

{
	#category : #method-tested,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>methodSinglePragma [
	^'methodSinglePragma
		<hello: 5>'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testDoublePragma [
	| aRBMethode |
	"self debug: #testDoublePragma"
	aRBMethode := OpalCompiler new parse: self methodDoublePragma.
	
	self assert: (aRBMethode compiledMethod pragmas first keyword = #hello:).
	self assert: (aRBMethode compiledMethod pragmas second keyword = #hello:)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testIsPrimitve [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPrimitive.
	self assert: aRBMethode isPrimitive
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testNoPragma [
	"self debug: #testDoublePrimitive"

	OpalCompiler new parse: self methodNoPragma
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPragmaAfterBeforTemp [
	"self debug: #testPragmaAfterBeforTemp"
	| aRBMethode |
	aRBMethode := OpalCompiler new parse: self methodPragmaAfterBeforTemps.


	self assert: (aRBMethode compiledMethod pragmas first keyword = #hello:).
	self assert: (aRBMethode compiledMethod pragmas second keyword = #world:)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPragmaTwoParam [
	"self debug: #testPragmaAfterBeforTemp"
	| aRBMethode |
	aRBMethode := OpalCompiler new parse: self methodPragmaTwoParam.


	self assert: (aRBMethode compiledMethod pragmas first keyword = #hello:by:)
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPragmaUnarayMessage [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPragmaUnarayMessage.
	
	self assert: (aRBMethode compiledMethod pragmas first keyword = #hello)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPrimitiveNumber [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPrimitive.
	self assert: (aRBMethode compiledMethod primitive = 4)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPrimitivePragmaNumber [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPrimitivePragma.
	self assert: (aRBMethode compiledMethod primitive = 4)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPrimitiveString [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPrimitiveString.
	
	self assert: (aRBMethode compiledMethod primitive = 117)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testPrimitiveStringModule [
	| aRBMethode |

	aRBMethode := OpalCompiler new parse: self methodPrimitiveStringModule.
	
	self assert: (aRBMethode compiledMethod primitive = 117)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCPragmaTest>>testSinglePragma [
	| aRBMethode |
	aRBMethode := OpalCompiler new parse: self methodSinglePragma.
	self assert: (aRBMethode compiledMethod pragmas first keyword = #hello:)
	
]
