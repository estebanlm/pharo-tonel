"
This is the unit test for the class InstVarRefLocator. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org)
	- the sunit class category
"
Class {
	#name : #InstVarRefLocatorTest,
	#superclass : #TestCase,
	#instVars : [
		'tt'
	],
	#category : #Kernel-Tests-Methods,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>example1 [
	| ff |
	(1 < 2) ifTrue: [tt ifNotNil: [ff := 'hallo']].
	^ ff.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>example2 [
	| ff|	
	ff := 1.
	(1 < 2) ifTrue: [ff ifNotNil: [ff := 'hallo']].
	^ ff.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>hasInstVarRef: aMethod [
	"Answer whether the receiver references an instance variable."

	| scanner end printer |

	scanner := InstructionStream on: aMethod.
	printer := InstVarRefLocator new.
	end := scanner method endPC.

	[scanner pc <= end] whileTrue: [
		(printer interpretNextInstructionUsing: scanner) ifTrue: [^true].
	].
	^false
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>testExample1 [
	| method |

	method := self class compiledMethodAt: #example1.
	self assert: (self hasInstVarRef: method).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>testExample2 [
	| method |

	method := self class compiledMethodAt: #example2.
	self deny: (self hasInstVarRef: method).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
InstVarRefLocatorTest>>testInstructions [
	Object methods
		do: [ :method | 
			| scanner printer end |
			scanner := InstructionStream on: method.
			printer := InstVarRefLocator new.
			end := scanner method endPC.
			[ scanner pc <= end ] whileTrue: [ printer interpretNextInstructionUsing: scanner ] ]
]
