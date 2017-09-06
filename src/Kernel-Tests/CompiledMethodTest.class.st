"
This is the unit test for the class CompiledMethod. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org)
	- the sunit class category
"
Class {
	#name : #CompiledMethodTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'x',
		'y'
	],
	#category : #Kernel-Tests-Methods,
	#timestamp : '<historical>'
}

{
	#category : #'tests - performing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>a1: a1 a2: a2 a3: a3 a4: a4 a5: a5 a6: a6 a7: a7 a8: a8 a9: a9 a10: a10 a11: a11 a12: a12 a13: a13 a14: a14 a15: a15 [
	"I'm a method with the maximum size of arguments that can be executed via normal send but crash on perform :)"
	
	^ a1 + a2 - a2
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>abstractMethod [
	"I am an abstract method"
	
	^ self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>categoryNameForTemporaryClasses [
	"Answer the category where to classify temporarily created classes"

	^'Dummy-Tests-Class'
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>classToBeTested [
	
	^CompiledMethod
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod [
	"Used to test sends of deprecation messages;
	do not recategorize in one of the 'deprecated' categories."

	self deprecated: 'example of a deprecated method'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod2 [
	"Used to test sends of deprecation messages;
	do not recategorize in one of the 'deprecated' categories."

	self deprecated: 'example of a deprecated method' on: 'date' in: 'someversion'.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod3 [
	"Used to test sends of deprecation messages;
	do not recategorize in one of the 'deprecated' categories."

	self
		deprecated: 'Example of a deprecated method with transform'
		transformWith: '`@receiver deprecatedMethod3' 
						-> '`@receiver deprecatedMethod3'.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod4 [
	"Used to test sends of deprecation messages;
	do not recategorize in one of the 'deprecated' categories."

	self
	
		deprecated: 'Example of a deprecated method with transform'
		on: '01/01/1970'
		in: #Pharo6
		transformWith: '`@receiver deprecatedMethod4' 
						-> '`@receiver deprecatedMethod4'.

]

{
	#category : #deprecated,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod5 [

]

{
	#category : #'category - deprecated',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod6 [

]

{
	#category : #'deprecated - category',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>deprecatedMethod7 [

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>nonAbstractMethod [
	"I am not an abstract method"
	
	^ 4 + 5
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>readX [
	| tmp |
	tmp := x.
	^ tmp
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>readXandY [
	
	^ x + y
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>returnPlusOne: anInteger [
	^anInteger + 1. 
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>returnTrue [
	^true  
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>shouldNotImplementMethod [
	"I am not an abstract method"
	
	^ self shouldNotImplement
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>tearDown [
	RPackage organizer unregisterPackageNamed: self categoryNameForTemporaryClasses.
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testAccessesSlot [

	"Check the source code availability to do not fail on images without sources"
	({ Point>>#x. Point>>#setX:setY: } allSatisfy: #hasSourceCode) 
		ifFalse: [ ^ self ].
	
	self assert: ((Point>>#x) accessesSlot: (Point slotNamed: #x)).
	self deny: ((Point>>#x) accessesSlot: (Point slotNamed: #y)).
	self assert: ((Point>>#setX:setY:) accessesSlot: (Point slotNamed: #y)).
	
	
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testBytecode [
	"The result of this test depends on the used bytecode set. 
	
	 Because there are multiple versions of the encoders currently depending on the compiler used, we test the class name instead of the encoder class itself"
	| method expectedResult |
	method := Object>>#halt.
	expectedResult := (method encoderClass name endsWith: 'SistaV1')
		ifTrue: [#[16 129 216 88]]
		ifFalse: [#[64 209 135 120]].
	self assertCollection: (Object>>#halt) bytecode equals: expectedResult
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testComparison [
	| method1 method2 |
	method1 := Float class >> #nan.
	method2 := thisContext method.
	
	self assert: method1 = method1.
	self assert: method2 = method2.
	self deny: method1 = method2.
	self deny: method2 = method1.
	
	Object methods do: [ :each |
		self deny: method1 = each.
		self deny: each = method1.
		self deny: method2 = each.
		self deny: each = method2 ]
]

{
	#category : #'tests - conversion',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testCompiledMethodAsString [
	"self debug: #testCompiledMethodAsString"

	thisContext method asString
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testContainsHalt [
	
	| annonClass |
	
	self 
	deny: (Object >> #halt) containsHalt;
	deny: (Object >> #haltIfNil) containsHalt;
	deny: (Halt class >> #once) containsHalt;
	assert: (UndefinedObjectTest >> #testIfNil) containsHalt.
	
	annonClass := Object newAnonymousSubclass.
	annonClass 
	compile: 'm1 self halt';
	compile: 'm2 self haltIfNil';
	compile: 'm3 self yourself'.
	
	self
	assert: (annonClass >> #m1) containsHalt;
	assert: (annonClass >> #m2) containsHalt;
	deny: (annonClass >> #m3) containsHalt.
	
	
]

{
	#category : #'tests - comparing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testCopy [
	<pragma: #pragma>
	| method copy |
	method := thisContext method.
	self assert: method pragmas notEmpty.
	copy := method copy.
	self assert: (method equivalentTo: copy).
	self assert: method header = copy header.
	self assert: method = copy.
	self assert: method ~~ copy.
	self assert: copy penultimateLiteral method == copy.
	self assert: method penultimateLiteral method == method.
	method pragmas do:
		[:p|
		self assert: p method == method].
	copy pragmas do:
		[:p|
		self assert: p method == copy]

]

{
	#category : #'tests - comparing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testCopyWithTrailerBytes [
	<pragma: #pragma>
	| method copy |
	method := thisContext method.
	self assert: method pragmas notEmpty.
	copy := method copyWithTrailerBytes: method trailer.
	self assert: (method equivalentTo: copy).
	self deny: method == copy.
	self assert: method symbolic = copy symbolic. "but their bytecode should be the same"
	self assert: method ~~ copy.
	self assert: copy penultimateLiteral method == copy.
	self assert: method penultimateLiteral method == method.
	method pragmas do:
		[:p|
		self assert: p method == method].
	copy pragmas do:
		[:p|
		self assert: p method == copy]

]

{
	#category : #'tests - comparing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testEqualityClassSideMethod [
   	| method1 method2 |

	method1 := TestCase class compiler
			compile: 'aMethod'.
		
	method2 := TestCase class compiler
			compile: 'aMethod'.
			

 	self assert: method1 = method2.


]

{
	#category : #'tests - comparing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testEqualityInstanceSideMethod [
   	| method1 method2 |

	method1 :=  TestCase compiler compile: 'aMethod'.
	method2 :=  TestCase compiler compile: 'aMethod'.

	self assert: (method1 literalAt: method1 numLiterals) ==  (method2 literalAt: method2 numLiterals).
 	self assert: method1 = method2.


]

{
	#category : #'tests - instance variable',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testHasInstVarRef [
	"self debug: #testHasInstVarRef"
	
	| method  |
	method := self class compiledMethodAt: #readX.
	self assert: (method hasInstVarRef).

	method := self class compiledMethodAt: #readXandY.
	self assert: (method hasInstVarRef).
	
	method := self class compiledMethodAt: #writeX.
	self assert: (method hasInstVarRef).
	
	method := self class compiledMethodAt: #writeXandY.
	self assert: (method hasInstVarRef).
	
]

{
	#category : #'tests - abstract',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testIsAbstract [

	self assert: (self class >> #abstractMethod) isAbstract.
	self deny: (self class >> #nonAbstractMethod) isAbstract.
	self deny: (self class >> #shouldNotImplementMethod) isAbstract
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testIsDeprecated [
	| deprecatedSelectors |
	deprecatedSelectors := #(deprecatedMethod deprecatedMethod2 deprecatedMethod3 deprecatedMethod4 deprecatedMethod5 deprecatedMethod6 deprecatedMethod7)
		asSet.
	self class
		selectorsDo: [ :each | 
			(deprecatedSelectors includes: each)
				ifTrue: [ self assert: (self class >> each) isDeprecated ]
				ifFalse: [ self deny: (self class >> each) isDeprecated ] ]
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testIsInstalled [
|  method cls |

	method := (self class)>>#returnTrue.
	self assert: method isInstalled.

	"now make an orphaned method by just deleting the class."

	Smalltalk removeClassNamed: #TUTU.

	cls := Object subclass: #TUTU
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self categoryNameForTemporaryClasses.
	cls compile: 'foo ^ 10'.
	method := cls >> #foo.
	Smalltalk removeClassNamed: #TUTU.

	self deny: method isInstalled. 
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testIsQuick [
	| method  |

	method := self class compiledMethodAt: #returnTrue.
	self assert: (method isQuick).

	method := self class compiledMethodAt: #returnPlusOne:.
	self deny: (method isQuick).

	
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testMethodClass [
	| method cls |
	method := self class >> #returnTrue.
	self assert: method selector = #returnTrue.
	"now make an orphaned method by just deleting the class.
	old: #unknown
	new semantics: return Absolete class"
	Smalltalk removeClassNamed: #TUTU.
	cls := Object
				subclass: #TUTU
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: self categoryNameForTemporaryClasses.
	cls compile: 'foo ^ 10'.
	method := cls >> #foo.
	Smalltalk removeClassNamed: #TUTU.
	self assert: method methodClass = cls
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testOrigin [
	| regularMethod methodFromTrait aliasedMethod |

	"Regular method"
	regularMethod := Behavior>>#name.
	
	"Method from a trait without alias "
	methodFromTrait := Behavior>>#addToComposition:.

	"Method from a trait with an alias"
	aliasedMethod := MOPTestClassD >>#c3.

	self assert: regularMethod origin == regularMethod originMethod methodClass.
	self assert: methodFromTrait origin == methodFromTrait originMethod methodClass.
	self assert: aliasedMethod origin == aliasedMethod originMethod methodClass.
]

{
	#category : #'tests - performing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testPerformCanExecutelongMethodWithTemps [
	"self debug: #testPerformCanExecutelongMethodWithTemps"
	"the perform: primitive reuses the context of the method calling it. The primitive adds performed selector arguments to the context variables list. So this means that you can execute some methods but not performed them if the calling methods defined too many temps "
	
	| temp1 temp2 temp3 |
	temp1 := 33.
	temp2 := 666.
	temp3 := 42. 
	self assert: (self perform: #a1:a2:a3:a4:a5:a6:a7:a8:a9:a10:a11:a12:a13:a14:a15: withArguments: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) = 1.
	self assert: (self class>>#testPerformCanExecutelongMethodWithTemps) frameSize = CompiledMethod smallFrameSize.
	self assert: (self class>>#a1:a2:a3:a4:a5:a6:a7:a8:a9:a10:a11:a12:a13:a14:a15:) frameSize = CompiledMethod fullFrameSize.
]

{
	#category : #'tests - performing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testPerformInSuperclassCanExecutelongMethodWithTemps [
	"self debug: #testPerformInSuperclassCanExecutelongMethodWithTemps"
	"the perform: primitive reuses the context of the method calling it. The primitive adds performed selector arguments to the context variables list. So this means that you can execute some methods but not performed them if the calling methods defined too many temps "
	
	| temp1 temp2 temp3 |
	temp1 := 33.
	temp2 := 666.
	temp3 := 42. 
	self assert: (self perform: #a1:a2:a3:a4:a5:a6:a7:a8:a9:a10:a11:a12:a13:a14:a15: withArguments: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) inSuperclass: self class) = 1
]

{
	#category : #'tests - instance variable',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testReadsField [
	"self debug: #testReadsField"
	
	| method |
	method := self class compiledMethodAt: #readX.
	self assert: (method readsField: 3).
	
	method := self class compiledMethodAt: #readXandY.
	self assert: (method readsField: 4).
	
	
	"read is not write"
	method := self class compiledMethodAt: #writeX.
	self deny: (method readsField: 3).
	
	method := self class compiledMethodAt: #writeXandY.
	self deny: (method readsField: 3).
	
	method := self class compiledMethodAt: #writeXandY.
	self deny: (method readsField: 4)
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testReadsSlot [

	"Check the source code availability to do not fail on images without sources"
	({ Point>>#x. Point>>#setX:setY: } allSatisfy: #hasSourceCode) 
		ifFalse: [ ^ self ].

	self assert: ((Point>>#x) readsSlot: (Point slotNamed: #x)).
	self deny: ((Point>>#x) readsSlot: (Point slotNamed: #y)).
	self deny: ((Point>>#setX:setY:) readsSlot: (Point slotNamed: #y)).
	
	
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testSelector [

	Author useAuthor: 'TUTU_TEST' during: [ 
		
		|  method cls |
		
		method := (self class)>>#returnTrue.
		self assert: (method selector = #returnTrue).
		
		"now make an orphaned method. new semantics: return corrent name"	
		Smalltalk removeClassNamed: #TUTU.

		cls := Object subclass: #TUTU
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: self categoryNameForTemporaryClasses.
		
		cls compile: 'foo ^ 10'.
		
		method := cls >> #foo.
		
		Smalltalk removeClassNamed: #TUTU.

		self assert: method selector = #foo. 
		
	].
	


]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testSendsSelector [
	self assert: ((CompiledCode >> #sendsSelector:) sendsSelector: #includes:).
	self deny: ((CompiledCode >> #sendsSelector:) sendsSelector: #doBreakfastForMe)
]

{
	#category : #'tests - evaluating',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testValueWithReceiverArguments [
	
	| method value |

	method := self class compiledMethodAt: #returnTrue.

	value := method valueWithReceiver: nil arguments: #().
	self assert: (value = true).

	method := self class compiledMethodAt: #returnPlusOne:.
	value := method valueWithReceiver: nil arguments: #(1).
	self assert: (value = 2).	
]

{
	#category : #'tests - instance variable',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testWritesField [
	"self debug: #testWritesField"

	| method |
	method := self class compiledMethodAt: #writeX.
	self assert: (method writesField: 3).
	
	method := self class compiledMethodAt: #writeXandY.
	self assert: (method writesField: 3).
	
	method := self class compiledMethodAt: #writeXandY.
	self assert: (method writesField: 4).
	
	"write is not read"
	
	method := self class compiledMethodAt: #readX.
	self deny: (method writesField: 3).
	
	method := self class compiledMethodAt: #readXandY.
	self deny: (method writesField: 3).
	
	method := self class compiledMethodAt: #readXandY.
	self deny: (method writesField: 4).
]

{
	#category : #'tests - slots',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>testWritesSlot [

	"Check the source code availability to do not fail on images without sources"
	({ Point>>#x. Point>>#setX:setY: } allSatisfy: #hasSourceCode) 
		ifFalse: [ ^ self ].

	self deny: ((Point>>#x) writesSlot: (Point slotNamed: #x)).
	self deny: ((Point>>#x) writesSlot: (Point slotNamed: #y)).
	
	self assert: ((Point>>#setX:setY:) writesSlot: (Point slotNamed: #y)).
	self assert: ((Point>>#setX:setY:) writesSlot: (Point slotNamed: #x)).
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>writeX [
	
	x := 33
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTest>>writeXandY [
	
	x := 33.
	y := 66
	
]
