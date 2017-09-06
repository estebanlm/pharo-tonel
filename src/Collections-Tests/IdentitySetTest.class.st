"
SUnit tests for identity sets
"
Class {
	#name : #IdentitySetTest,
	#superclass : #SetTest,
	#instVars : [
		'floatCollection'
	],
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:28'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentitySetTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentitySetTest>>classToBeTested [

	^ IdentitySet
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentitySetTest>>identityCollectionWithElementsCopyNotIdentical [
" return a collection including elements for which #copy return a new object "
	^ floatCollection ifNil: [ floatCollection := IdentitySet new add: 2.5 ; add: 4.5 ; add:5.5 ; yourself ].
]

{
	#category : #'tests - identity',
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentitySetTest>>testGrowWithNil [
	"self run: #testGrowWithNil"
	"This test covers that grow take into account that nil are wrapped elements of sets"
	| set |
	set := IdentitySet new.
	set add: nil.
	set grow.
	self assert: (set includes: nil)
]

{
	#category : #'tests - identity',
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentitySetTest>>testIdentity [
	"self run:#testIdentity" 
	"self debug:#testIdentity"
	| identitySet aString anOtherString |
	
	aString := 'hello'.
	anOtherString := aString copy.
	
	self assert: (aString = anOtherString).
	self assert: (aString == anOtherString) not.

	
	identitySet := self classToBeTested  new.
	identitySet add: aString.

	
	self assert: (identitySet occurrencesOf: aString) = 1.
	self assert: (identitySet occurrencesOf: anOtherString) = 0.
	

	self assert: (identitySet includes: aString).
	self deny: (identitySet includes: anOtherString) = 0.
]
