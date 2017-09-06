"
I provide a facade to create and reuse OmStore hierarchy instances.
"
Class {
	#name : #OmStoreFactory,
	#superclass : #Object,
	#instVars : [
		'nullStore',
		'storeByPath'
	],
	#classInstVars : [
		'current'
	],
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 2/7/2017 11:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory class>>current [

	^ current ifNil: [ current := self new ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory class>>initialize [
	"
	self initialize
	"
	SessionManager default registerSystemClassNamed: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory class>>reset [
	"
	self reset
	"

	current := nil
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory class>>shutDown: aboutToQuit [

	aboutToQuit ifTrue: [ self reset ]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory class>>startUp: isImageStarting [

	isImageStarting ifTrue: [ self reset ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>defaultDirectory [

	^ OmSessionStore defaultBaseLocator asFileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>fromFile: aFileReference [

	^ self 
		named: (OmFileStore globalNameFrom: aFileReference)
		inDirectory: aFileReference parent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>initialize [
	super initialize.
	
	storeByPath := WeakValueDictionary new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>named: aGlobalName  [

	^ self named: aGlobalName inDirectory: self defaultDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>named: aGlobalName inDirectory: aDirectory [

	| fileReference |
	fileReference := OmFileStore fileReferenceForStoreNamed: aGlobalName inDirectory: aDirectory.

	^ storeByPath
		at: fileReference fullName
		ifPresent: [:store | store ]
		ifAbsentOrNil: [ | newStore |
			newStore := self newStoreNamed: aGlobalName in: aDirectory.
			storeByPath at: fileReference fullName put: newStore.
			newStore ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>newStoreNamed: aGlobalName in: aDirectory [

	^ OmBlockFileStore
		named: aGlobalName
		inDirectory: aDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStoreFactory>>null [

	^ nullStore ifNil: [ nullStore := OmNullStore new ]
]
