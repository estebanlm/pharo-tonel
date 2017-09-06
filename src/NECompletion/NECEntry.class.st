"
I represent a completion entry that is management by a ECModel and shown in the ECMenuMorph as a menu entry.
"
Class {
	#name : #NECEntry,
	#superclass : #Object,
	#instVars : [
		'contents',
		'type',
		'description'
	],
	#category : #NECompletion-Model,
	#timestamp : 'bar 10/5/2005 23:31'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry class>>contents: aString  [
	^ self new setContents: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry class>>contents: aString type: aSymbol [
	^ self new setContents: aString type: aSymbol
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>><= aECEntry  [
	^ contents <= aECEntry contents
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>asNECEntry [
	^ self
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>browseWith: anECContext  [
	| guessType |
	guessType := self guessTypeWith: anECContext.
	guessType ifNil: [^ false].
	Smalltalk tools browser openOnClass: guessType.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>completion [
	^ self contents asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>contents [
	^contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>contentsAsSymbol [
	^ contents asSymbol 
]

{
	#category : #'detail information',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>createDescriptionWith: anECContext  [
	| clazz |
	clazz := self guessTypeWith: anECContext.
	^ clazz 
		ifNil: [ NECEntryDescription label: self label ]
		ifNotNil: 
			[ NECEntryDescription 
				label: self label
				title: clazz printString
				description: clazz comment ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>descriptionWith: anECContext  [
	description ifNotNil: [ ^ description ].
	^ description := self createDescriptionWith: anECContext
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>guessTypeWith: anECContext  [
	^ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>isInstance [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>isLocal [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>isSelector [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>label [
	^ 'unknown'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>printOn: aStream  [
	aStream nextPutAll: self class name;
		 nextPut: $(;
		 nextPutAll: contents asString;
		 nextPut: $,;
		 nextPutAll: self type;
		 nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>setContents: aString  [
	contents := aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>setContents: aString type: aSymbol  [
	contents := aString.
	type := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntry>>type [
	^type
]
