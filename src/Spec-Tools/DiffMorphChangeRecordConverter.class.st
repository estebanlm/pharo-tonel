"
A DiffMorphChangeRecordConverter is a converter used to show the diff between two methodreferences with a side by side view.
"
Class {
	#name : #DiffMorphChangeRecordConverter,
	#superclass : #AbstractMethodReferenceConverter,
	#category : #Spec-Tools-VersionBrowser,
	#timestamp : 'NicolaiHess 1/19/2014 23:41'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffMorphChangeRecordConverter>>internalGetText [
	| priorSource |
	priorSource := (self priorVersionOfAMethod: method) ifNotNil: [ :m | m sourceCode ] ifNil: [ '' ].
	^ Array with: priorSource with: method sourceCode
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffMorphChangeRecordConverter>>priorVersionOfAMethod: aChangeRecord [
	| index |
	index := referencesList identityIndexOf: aChangeRecord .
	^ referencesList at: index+1 ifAbsent: [ nil ]
]
