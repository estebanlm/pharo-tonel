"

"
Class {
	#name : #ClassQueryTest,
	#superclass : #TestCase,
	#category : #System-SupportTests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ClassQueryTest>>testAllCallsOn [
	| calls |
	calls := ClassQueryTest allCallsOn.
	self assert: calls size equals: 1.
	self assert: calls first compiledMethod equals: ClassQueryTest>>#testAllCallsOn
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ClassQueryTest>>testAllCallsOnASymbol [

	| set cm |
	set := Object allCallsOn: #shallowCopy.
	cm := (set detect: [ :rgMethod | (rgMethod selector == #copy) and: [rgMethod className = #Object]]) compiledMethod.
	self assert: (cm literals includes: #shallowCopy)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ClassQueryTest>>testReferencedClasses [
	
	| refs |
	refs := Metaclass referencedClasses.
	self assert: (refs includes: SystemAnnouncer).
	
	refs := self class referencedClasses.
	self assert: (refs includesAll: { SystemAnnouncer. Metaclass })
]
