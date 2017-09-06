"

"
Class {
	#name : #SystemDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Tests-System,
	#timestamp : ''
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>canBeUnhealthy [
	"uses GlobalVariables instead of associations"
	^ false
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>classToBeTested [

^ SystemDictionary
]

{
	#category : #problems,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testClassComment [
	self should: [self targetClass organization hasComment].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testClassOrTraitNamedReturnsClassForClasses [
	"self debug: #testClassOrTraitNamedReturnsClassForClasses"
	self assert: Object ==  (Smalltalk globals classOrTraitNamed: 'Object').
	self assert: Object ==  (Smalltalk globals classOrTraitNamed: #Object).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testClassOrTraitNamedReturnsNilForGlobals [
	"self debug: #testClassOrTraitNamedReturnsNilForGlobals"
	self assert: nil = (Smalltalk globals classOrTraitNamed: 'Undeclared').
	self assert: nil = (Smalltalk globals classOrTraitNamed: #Undeclared).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testEnvironmentOfOrganization [
	"self debug: #testEnvironmentOfOrganization"
	
	| aDictionary |	
	aDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	self assert: aDictionary organization environment equals: aDictionary
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testOrganizationPerInstance [
	"self debug: #testOrganizationPerInstance"
	
	| aDictionary otherDictionary |	
	aDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	otherDictionary := SystemDictionary withOrganizer: SystemOrganizer new.
	self deny: aDictionary organization = otherDictionary organization.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testOtherInstancesOfSystemDictionaryAsString [
	self deny: SystemDictionary new asString = 'Smalltalk'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testOtherInstancesOfSystemDictionaryPrintString [
	self deny: SystemDictionary new printString = 'Smalltalk'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testOtherInstancesOfSystemDictionarySelfEvaluating [
	self deny: SystemDictionary new isSelfEvaluating
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testSetOrganizationSetBackPointer [
	"self debug: #testSetOrganizationSetBackPointer"
	
	| sd so |
	sd := SystemDictionary new.
	so := SystemOrganizer new.
	sd organization: so.
	self assert: so environment == sd.
	self assert: sd organization == so
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testSmalltalkAsString [
	self assert: Smalltalk asString = 'Smalltalk'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testSmalltalkPrintString [
	self assert: Smalltalk printString = 'Smalltalk'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testSmalltalkSelfEvaluating [
	self assert: Smalltalk isSelfEvaluating
]

{
	#category : #problems,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemDictionaryTest>>testUnCategorizedMethods [
	| categories slips  |	categories := self categoriesForClass: self targetClass.
	slips := categories select: [:each | each = #'as yet unclassified'].
	self should: [slips isEmpty].	
]
