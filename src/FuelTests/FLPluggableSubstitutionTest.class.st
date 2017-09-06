"
SUnit tests for fuels pluggable substitutions
"
Class {
	#name : #FLPluggableSubstitutionTest,
	#superclass : #FLSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:31'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testAvoidRecursion [

	| result |
	self analyzer when: [:x | x < 10 ] substituteBy: [:x | x + 1 ].

	result := self resultOfSerializeAndMaterialize: 1.
	
	self assert: result = 2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testLowercaseSomeSymbols [

	| result |
	self analyzer when: [:x | #A = x] substituteBy: [:x | #a].
	self analyzer when: [:x | #B = x] substituteBy: [:x | #b].

	result := self resultOfSerializeAndMaterialize: #(A B C).
	
	self assert: #(a b C) = result.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testPrivateExcluded [

	| result |
	self analyzer when: [:x | x isBehavior ] substituteBy: [:x | FLWeakClassMock ].

	result := self resultOfSerializeAndMaterialize: {String new. FLPair}.
	
	self assert: result first class == ByteString.
	self assert: result second == FLWeakClassMock.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testPrivateExcludedAndWithConflicts [
	"Tests issue #209"
	| result |
	self analyzer when: [:x | FLPair == x ] substituteBy: [:x | FLWeakClassMock ].

	result := self resultOfSerializeAndMaterialize: {FLPair new. FLPair}.
	
	self assert: result first class == FLPair.
	self assert: result second == FLWeakClassMock
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSimple [

	| result |
	self analyzer when: [:x | x < 0 ] substituteBy: [:x | 0 ].

	result := self resultOfSerializeAndMaterialize: -1.
	
	self assert: result = 0.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSubstitute: anObject inPresenceOf: anotherObject [

	| result |
	self analyzer when: [:x | x == anObject ] substituteBy: [:x | 424242 ].

	result := self resultOfSerializeAndMaterialize: {anObject. anotherObject}.
	
	self assert: result first equals: 424242.
	self assert: result second equals: anotherObject.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSubstituteByItself [

	| result |
	self analyzer when: [:x | true ] substituteBy: [:x | x ].

	result := self resultOfSerializeAndMaterialize: 1.
	
	self assert: result = 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSubstituteCharacterInPresenceOfSomeCharacter [
	"See issues #209 and #217"

	self testSubstitute: Character inPresenceOf: $c

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSubstituteTrueInPresenceOfTheTrueInstance [
	"See issues #209 and #217"

	self testSubstitute: True inPresenceOf: true

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testSubstituteUndefinedObjectInPresenceOfNil [
	"See issues #209 and #217"

	self testSubstitute: UndefinedObject inPresenceOf: nil

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testTransientPair [

	| result |
	self analyzer when: [:x | FLPair = x class] substituteBy: [:x | nil].

	result := self resultOfSerializeAndMaterialize: FLPair new.
	
	self assert: result isNil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testTransientPairLeft [

	| result |
	self analyzer when: [:x | FLPair = x class and: [x left isNil not]] substituteBy: [:x | x copy left: nil].

	result := self resultOfSerializeAndMaterialize: (FLPair new left: $A; yourself).
	
	self assert: result left isNil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPluggableSubstitutionTest>>testUniqueSubstitution [
	"Tests that an object with two occurrences in the graph is substituted to the *same* object."

	| result |
	self analyzer when: [ :x | x isNumber ] substituteBy: [ :x | x printString ].

	"This line demonstrates that behavior being tested is not trivial"
	self deny: 1 printString == 1 printString.

	result := self resultOfSerializeAndMaterialize: (Array with: 1 with: 1).
	
	self assert: result first = '1'.	
	self assert: result first == result second.
]
