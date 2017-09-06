"
SUnit tests for MethodDictionary
"
Class {
	#name : #MethodDictionaryTest,
	#superclass : #TestCase,
	#traits : 'TIncludesTest + TDictionaryKeysValuesAssociationsAccess + TDictionaryRemovingTest',
	#classTraits : 'TIncludesTest classTrait + TDictionaryKeysValuesAssociationsAccess classTrait + TDictionaryRemovingTest classTrait',
	#instVars : [
		'nonEmptyDict'
	],
	#category : #Kernel-Tests-Methods,
	#timestamp : 'TorstenBergmann 2/5/2014 08:40'
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>aValue [

	^ self class >> #aValue
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>anIndex [

	^ #aMethodName
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>anotherElementNotIn [
" return an element different of 'elementNotIn'  not included in 'nonEmpty' "
	^ self class >> #anotherElementNotIn
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>anotherValue [

	^ self class >> #anotherValue
]

{
	#category : #assertions,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>assertPreservesCapacity: oldDictionary comparedTo: rehashedDictionary [
	self assert: oldDictionary capacity = rehashedDictionary capacity.
]

{
	#category : #assertions,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>assertPreservesElements: oldDictionary comparedTo: newDictionary [
	self assert: (oldDictionary keys allSatisfy: [ :key |
		(newDictionary includesKey: key) &
		((newDictionary at: key) == (oldDictionary at: key))
		])
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>elementNotIn [
"return an element not included in 'nonEmpty' "

	^ self class >> #elementNotIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>empty [
	^ MethodDictionary new
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>emptyDict [
	^ self empty
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>keyNotIn [
" return a key not included in nonEmpty"
^ #bouba
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>keyNotInNonEmptyDict [
" return a key not included in nonEmptyDict"
	^ #keyNotInNonEmptyDict
]

{
	#category : #setUps,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>modifiedMethodDictionaryCopy [
	| copy |
	
	copy := self class methodDict copy.
	copy at: #methodAddedToIncreaseTheDict put: Object >> #=.
	^copy.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>newEmptyDict [
	^ MethodDictionary new
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>nonEmpty [
	^ nonEmptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>nonEmptyDict [
	^ nonEmptyDict 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"
	^ MethodDictionary new
		at: #nonEmptyDifferentFromNonEmptyDict put: (self class >> #nonEmptyDifferentFromNonEmptyDict)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>setUp [
	super setUp.
	nonEmptyDict := MethodDictionary new.
	nonEmptyDict at: #setUp put: (self class >> #setUp).
	nonEmptyDict at: #nonEmpty put: (self class >> #nonEmpty).
]

{
	#category : #requirement,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>speciesClass [
	^ MethodDictionary
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testAssociationAtExistantKeyReturnsOkAssociation [
	| methodSelector association |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	association := self class methodDict associationAt: methodSelector ifAbsent: [self error].
	
	self assert: association key = methodSelector.
	self assert: association value = (self class >> methodSelector).
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testAssociationAtNonexistantKeyExecutesFailBlock [
	| methodSelector result error |
	methodSelector := #inexistant:method:larala:.
	error := #error.
	result := self class methodDict associationAt: methodSelector ifAbsent: [error].
	
	self assert: result = error.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testAssociationsDoGoesOverEntireDictionary [
	| associations |
	associations := MethodDictionary new.
	
	self class methodDict associationsDo:[ :association | associations add: association ].
	
	self assertPreservesElements: self class methodDict comparedTo: associations.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testAtExistantKeyReturnsOkCompiledMethod [
	| methodSelector method |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	method := self class methodDict at: methodSelector ifAbsent: [self error].
	
	self assert: method class = CompiledMethod.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testAtNonexistantKeyExecutesFailBlock [
	| methodSelector result error |
	methodSelector := #inexistant:method:larala:.
	error := #error.
	result := self class methodDict at: methodSelector ifAbsent: [error].
	
	self assert: result = error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testBehaviorLocalyDefined [
	"method not acquired from a trait or from its superclass"
	" self debug: #testBehavior "
	self assert: (Object methodDict isKindOf: MethodDictionary).
	self assert: (Object selectors asSortedCollection = Object selectors asSortedCollection).
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testGrowDoublesCapacity [
	| methodDictionary oldCapacity |
	methodDictionary := MethodDictionary new.
	oldCapacity := methodDictionary capacity.
	methodDictionary grow.
	self assert: oldCapacity * 2 = methodDictionary capacity.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testGrowPreservesElements [
	| methodDictionary oldCapacity growedMethodDictionary |
	methodDictionary := self class methodDict copy.
	growedMethodDictionary := methodDictionary copy; grow; yourself.

	self assertPreservesElements: methodDictionary comparedTo: growedMethodDictionary.
	self assertPreservesElements: growedMethodDictionary comparedTo: methodDictionary.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testIdentityKeyAtExistantValueCopyReturnsFailBlock [
	| methodSelector result aMethod error |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	error := #error.
	
	aMethod := (self class >> methodSelector) copy.
	result := self class methodDict keyAtIdentityValue: aMethod ifAbsent: [error].
	
	self assert: result = error.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testIdentityKeyAtExistantValueReturnsOkKey [
	| methodSelector result aMethod |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	
	aMethod := self class >> methodSelector.
	result := self class methodDict keyAtIdentityValue: aMethod ifAbsent: [self error].
	
	self assert: result = methodSelector.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testIdentityKeyAtNonExistantValueReturnsFailBlock [
	| methodSelector result aMethod error |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	error := #error.
	
	result := self class methodDict keyAtIdentityValue: self ifAbsent: [error].
	
	self assert: result = error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testIncludesKeyLocalyDefined [
	" self debug: #testIncludesKeyLocalyDefined "
	self assert: (self class includesSelector: #testIncludesKeyLocalyDefined).
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testKeyAtExistantValueCopyReturnsOkKey [
	| methodSelector result aMethod |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	aMethod := (self class >> methodSelector) copy.
	result := self class methodDict keyAtValue: aMethod ifAbsent: [self error].
	
	self assert: result = methodSelector.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testKeyAtExistantValueReturnsOkKey [
	| methodSelector result aMethod |
	methodSelector := #testAssociationAtExistantKeyReturnsOkAssociation.
	aMethod := self class >> methodSelector.
	result := self class methodDict keyAtValue: aMethod ifAbsent: [self error].
	
	self assert: result = methodSelector.
]

{
	#category : #'tests - others',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testKeyAtNonexistantValueExecutesFailBlock [
	| methodSelector result error |
	methodSelector := #inexistant:method:larala:.
	error := #error.
	result := self class methodDict keyAtValue: self ifAbsent: [error].
	
	self assert: result = error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testKeyAtValueIfAbsentLocalyDefined [
	" self debug: #testKeyAtValueIfAbsentLocalyDefined "
	self assert: (self class methodDict keyAtValue: (self class >> #testKeyAtValueIfAbsentLocalyDefined) ifAbsent: []) == #testKeyAtValueIfAbsentLocalyDefined.
	
	self assert: (self class methodDict keyAtValue: (Object >> #printOn:) ifAbsent: [#notFound]) == #notFound
]

{
	#category : #'tests - rehashing',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testRehashPreservesCapacity [
	| oldDictionary rehashedDictionary |
	oldDictionary := self modifiedMethodDictionaryCopy.

	rehashedDictionary := oldDictionary copy rehash.
	
	self assertPreservesCapacity: oldDictionary comparedTo: rehashedDictionary.
]

{
	#category : #'tests - rehashing',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testRehashPreservesElements [
	| oldDictionary rehashedDictionary |
	oldDictionary := self modifiedMethodDictionaryCopy.
	
	rehashedDictionary := oldDictionary copy rehash.
	
	self assertPreservesElements: oldDictionary comparedTo: rehashedDictionary.
	self assertPreservesElements: rehashedDictionary comparedTo: oldDictionary.
]

{
	#category : #'tests - removing',
	#timestamp : ' 8/31/2017 05:26:30'
}
MethodDictionaryTest>>testRemoveAllPreservesCapacity [
	| methodSelector dictionary oldSize |
	methodSelector := #testRemoveAllPreservesCapacity.
	dictionary := MethodDictionary new.
	dictionary at: methodSelector put: self class >> methodSelector.
	
	oldSize := dictionary basicSize.
	dictionary removeAll.
	self assert: oldSize = dictionary basicSize.
]
