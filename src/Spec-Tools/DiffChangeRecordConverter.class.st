"
A DiffChangeRecordConverter is a converter used to show the diff between two methodreferences
"
Class {
	#name : #DiffChangeRecordConverter,
	#superclass : #AbstractMethodReferenceConverter,
	#category : #Spec-Tools-VersionBrowser,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffChangeRecordConverter>>internalGetText	 [

	^TextDiffBuilder
		 buildDisplayPatchFrom: ((self priorVersionOfAMethod: method) sourceCode) 
		to: (method sourceCode) 
		inClass: (method className)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffChangeRecordConverter>>priorVersionOfAMethod: aChangeRecord [
	| index mylist |
	
	mylist := referencesList sorted: [:a :b | a timeStamp > b timeStamp ].
	index := mylist indexOf: aChangeRecord .
	^ mylist at: index+1 ifAbsent: [ aChangeRecord ]
]
