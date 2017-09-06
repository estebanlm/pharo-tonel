"
I represent the chunk file format.  Right now I know how to parse chunks from a readStream, but not how to write them.
"
Class {
	#name : #ChunkFileFormatParser,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'parsedDeclarations',
		'nextChar',
		'classSelector',
		'classTraitSelector',
		'commentStampSelector',
		'methodsForSelector',
		'reorganizeSelector'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser class>>for: aReadStream [
	^self new
		readStream: aReadStream;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>addDeclaration: aDeclaration [
	parsedDeclarations	 add: aDeclaration 
]

{
	#category : #'class factory',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classCommentChunkClass [
	^ ClassCommentChunk
]

{
	#category : #'class factory',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classOrganisationChunkClass [
	^ ClassOrganizationChunk
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classSelector [
	^ classSelector
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classSelector: anObject [
	classSelector := anObject
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classTraitSelector [
	^ classTraitSelector
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>classTraitSelector: anObject [
	classTraitSelector := anObject
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>commentStampSelector [
	^ commentStampSelector
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>commentStampSelector: anObject [
	commentStampSelector := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>defaultClassSelector [
	^ #class
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>defaultClassTraitSelector [
	^ #classTrait
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>defaultCommentStampSelector [
	^ #commentStamp:
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>defaultMethodsForSelector [
	^ #methodsFor:
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>defaultReorganizeSelector [
	^ #reorganize
]

{
	#category : #'class factory',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>doItChunkClass  [
	^ DoItChunk
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>initialize [
	super initialize.
	parsedDeclarations := OrderedCollection new.
	classSelector := self defaultClassSelector.
	classTraitSelector := self defaultClassTraitSelector.
	commentStampSelector := self defaultCommentStampSelector.
	methodsForSelector := self defaultMethodsForSelector.
	reorganizeSelector := self defaultReorganizeSelector
]

{
	#category : #'class factory',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>methodChunkClass [
	^ MethodChunk
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>methodsForSelector [
	^ methodsForSelector
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>methodsForSelector: anObject [
	methodsForSelector := anObject
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>parseChunks [
	[ readStream atEnd ] whileFalse: [ self parseNextDeclaration ].
	^ parsedDeclarations 
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>parseClassOrganization: classOrganizationPreamble [
	"The comment preable is an array with the following structure:
	If instance side method:
	#(#CodeImportTestCaseTestClass #reorganize)
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #reorganize)
	"

	| behaviorName isMeta |
	behaviorName := classOrganizationPreamble first.
	isMeta := classOrganizationPreamble second ~= self reorganizeSelector.
	self
		addDeclaration:
			(self classOrganisationChunkClass
				contents: readStream next
				behaviorName: behaviorName
				isMeta: isMeta)
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>parseCommentDeclaration: commentPreamble [
	"The comment preable is an array with the following structure:
	If instance side method:
	#(#CodeImportTestCaseTestClass #commentStamp: '<historical>' #prior: 0)
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #commentStamp: '<historical>' #prior: 0)
	allButFirst:
	"

	| behaviorName isMeta stamp |
	self asSetElement.
	behaviorName := commentPreamble first asSymbol.
	isMeta := commentPreamble second ~= self commentStampSelector.
	stamp := isMeta
		ifTrue: [ commentPreamble at: 4 ]
		ifFalse: [ commentPreamble at: 3 ].
	self
		addDeclaration:
			(self classCommentChunkClass
				contents: readStream next
				behaviorName: behaviorName
				isMeta: isMeta
				stamp: stamp)
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>parseMethodDeclarations: methodsPreamble [
	| behaviorName isMeta category stamp methodSource |
	"The method preable is an array with the following structure:
	If instance side method:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	Sometimes there is no timestamp:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol')
	
	"
	behaviorName := methodsPreamble first.
	isMeta := methodsPreamble second = self classSelector
		or: [ methodsPreamble second = self classTraitSelector ].
	category := isMeta
		ifTrue: [ methodsPreamble at: 4 ]
		ifFalse: [ methodsPreamble at: 3 ].
	stamp := ''.
	methodsPreamble size > 4
		ifTrue:
			[ 
			stamp := isMeta
				ifTrue: [ methodsPreamble at: 6 ]
				ifFalse: [ methodsPreamble at: 5 ] ].
	[ 
	methodSource := readStream next.
	methodSource notEmpty ]
		whileTrue:
			[ 
			self
				addDeclaration:
					(self methodChunkClass
						contents: methodSource
						behaviorName: behaviorName asSymbol
						isMeta: isMeta
						category: category
						stamp: stamp) ]
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>parseNextDeclaration [
	| isMetadata nextChunk |
	readStream skipSeparators.
	readStream isNextStyleChunk
		ifTrue:
			[ 
			self addDeclaration: (self styleChunkClass contents: readStream readUpToEndOfStyleChunk).
			^ self ].
	isMetadata := readStream isNextChunkMetaData.
	nextChunk := readStream next.
	isMetadata
		ifFalse: [ self addDeclaration: (self doItChunkClass contents: nextChunk) ]
		ifTrue:
			[ 
			| substrings |
			substrings := nextChunk parseLiterals.
			(substrings includes: self methodsForSelector asString)
				ifTrue: [ ^ self parseMethodDeclarations: substrings ].
			(substrings includes: self commentStampSelector asString)
				ifTrue: [ ^ self parseCommentDeclaration: substrings ].
			(substrings includes: self reorganizeSelector asString)
				ifTrue: [ ^ self parseClassOrganization: substrings ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>readStream: aReadStream [
	readStream := ChunkReadStream on: aReadStream
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>reorganizeSelector [
	^ reorganizeSelector
]

{
	#category : #'custom points',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>reorganizeSelector: anObject [
	reorganizeSelector := anObject
]

{
	#category : #'class factory',
	#timestamp : ' 8/31/2017 07:16:32'
}
ChunkFileFormatParser>>styleChunkClass  [
	^ StyleChunk
]
