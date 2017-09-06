"
SUnit tests for Pragma class
"
Class {
	#name : #PragmaTest,
	#superclass : #TestCase,
	#instVars : [
		'atPragma',
		'anotherAtPragma',
		'yetAnotherAtPragma',
		'atPutPragma'
	],
	#category : #Kernel-Tests-Pragmas,
	#timestamp : 'TorstenBergmann 2/5/2014 08:42'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
PragmaTest>>setUp [

	atPragma := Pragma for: (Object methodDict at: #at:) selector: #primitive: arguments: (Array with: 60).
	anotherAtPragma := Pragma for: (Object methodDict at: #at:) selector: #primitive: arguments: (Array with: 60).
	yetAnotherAtPragma := Pragma for: (Object methodDict at: #at:) selector: #primitive: arguments: (Array with: 60).
	atPutPragma := Pragma for: (Object methodDict at: #at:) selector: #primitive: arguments: (Array with: 61).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
PragmaTest>>testCopy [

	| copy |

	copy := atPragma copy.

	self deny: atPragma == copy.
	self assert: atPragma method == copy method.
	self assert: atPragma keyword == copy keyword.
	self assert: atPragma arguments == copy arguments.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
PragmaTest>>testEqual [

	self assert: atPragma = atPragma.		"Reflexivity"

	self assert: atPragma = anotherAtPragma.		"Simmetry"
	self assert: anotherAtPragma = atPragma.

	self assert: atPragma = anotherAtPragma.		"Transitivity"
	self assert: anotherAtPragma = yetAnotherAtPragma.
	self assert: yetAnotherAtPragma = atPragma.

	self deny: atPragma = atPutPragma.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
PragmaTest>>testHash [

	self assert: atPragma hash = atPragma hash.

	self assert: atPragma hash = anotherAtPragma hash.
	self assert: anotherAtPragma hash = atPragma hash.

	self assert: atPragma hash = anotherAtPragma hash.
	self assert: anotherAtPragma hash = yetAnotherAtPragma hash.
	self assert: yetAnotherAtPragma hash = atPragma hash.
]
