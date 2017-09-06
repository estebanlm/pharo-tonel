"
A ChangeRecord represents a change recorded on a file in fileOut format.
It includes a type (more needs to be done here), and additional information
for certain types such as method defs which need class and category.
"
Class {
	#name : #ChangeRecord,
	#superclass : #Object,
	#instVars : [
		'file',
		'position',
		'type',
		'class',
		'category',
		'meta',
		'stamp'
	],
	#category : #System-Changes,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>><= anotherOne [

	self stamp ifNil: [ ^ false ].
	anotherOne stamp ifNil: [ ^ true ].
	^ self timeStamp <= anotherOne timeStamp 
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>category [
	^category
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>classIncludesSelector [
	
	| aClass | 
	^ (aClass := self methodClass) notNil
			and: [aClass includesSelector: self methodSelector]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>commentClass  [
	| commentClass |
	type == #classComment ifFalse: [^ nil].
	(Smalltalk includesKey: class asSymbol) ifFalse: [^ nil].
	commentClass := Smalltalk at: class asSymbol.
	^meta ifTrue: [commentClass class]
		ifFalse: [commentClass]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>file: f position: p type: t [
	file := f.
	position := p.
	type := t
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>file: f position: p type: t class: c category: cat meta: m stamp: s [
	self file: f position: p type: t.
	class := c.
	category := cat.
	meta := m.
	stamp := s
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>fileIn [
	"File the receiver in.  If I represent a method or a class-comment, file the method in and make a note of it in the recent-submissions list; if I represent a do-it, then, well, do it."

	UIManager default
		showWaitCursorWhile:			
			[ 
			| methodClass s |
			(methodClass := self methodClass) notNil
				ifTrue:
					[ 
					methodClass
						compile: self text
						classified: category
						withStamp: stamp
						notifying: nil ].
			type == #doIt
				ifTrue:
					[ 
					((s := self string) beginsWith: '----')
						ifFalse: [ self class compiler evaluate: s ] ].
			type == #classComment
				ifTrue:
					[ (Smalltalk globals at: class asSymbol) comment: self text stamp: stamp ] ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>fileName [
	^(file ifNotNil: [ file name ]) 
			ifNil: [ '<no file>' ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>fileOutOn: aFileStream [
	"File the receiver out on the given file stream"

	| aString |
	type == #method
		ifTrue:
			[aFileStream nextPut: $!.
			aString :=  class asString
							, (meta ifTrue: [' class methodsFor: ']
									ifFalse: [' methodsFor: '])
							, category asString printString.
			stamp ifNotNil:
				[aString := aString, ' stamp: ''', stamp, ''''].
			aFileStream nextChunkPut: aString.
			aFileStream cr].

	type == #preamble ifTrue: [aFileStream nextPut: $!].

	type == #classComment
		ifTrue:
			[aFileStream nextPut: $!.
			aFileStream nextChunkPut: class asString, ' commentStamp: ', stamp storeString.
			aFileStream cr].

	aFileStream nextChunkPut: self string.
	type == #method ifTrue: [aFileStream nextChunkPut: ' '].
	aFileStream cr
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>isMetaClassChange [
	^meta
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>isMethodDefinedInImage [
	"answer whether the method represented by the receiver is present in the image"
	
	^ self type = #method
		and: [self classIncludesSelector]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>isMethodNotDefinedInImage [
	"answer whether the method represented by the receiver is not present in the image.
	pay attention is it not just isMethodDefinedInImage not"
	
	| aClass |
	^ self type = #method and:
			[(aClass := self methodClass) isNil or:
				[(aClass includesSelector: self methodSelector) not]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>isUnchangedMethod [

	^ self isMethodDefinedInImage 
		and: [self string withBlanksCondensed 
				= (self methodClass sourceCodeAt: self methodSelector) asString withBlanksCondensed ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>methodClass [
	| methodClass |
	type == #method
		ifFalse: [ ^ nil ].
	(Smalltalk globals includesKey: class asSymbol)
		ifFalse: [ ^ nil ].
	methodClass := Smalltalk globals at: class asSymbol.
	^ meta
		ifTrue: [ methodClass class ]
		ifFalse: [ methodClass ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>methodClassName [
	^ meta
		ifTrue: [ class , ' class' ]
		ifFalse: [ class ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>methodSelector [
	^ type == #method
		ifTrue: [ (Smalltalk globals at: class ifAbsent: [ Object ]) compiler parseSelector: self string ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>position [
	^ position
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>printOn: aStream [

	aStream 
		nextPutAll: self type printString.
	self stamp ifNotNil: [ aStream nextPutAll: self stamp ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>sourceCode [
	
	self type= #preamble ifTrue: [ ^ #preamble printString ].
	self type= #doIt ifTrue: [ ^ #preamble printString ].
	self type= #classComment ifTrue: [ self commentClass ifNotNil: [ :comment | ^ comment comment ]].

	^ self string
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>stamp [
	^ stamp
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>stamp: threePartString [

	stamp := threePartString
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>string  [
	| string |
	file openReadOnly.
	file position: position.
	string := file nextChunk.
	file close.
	^ string
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>timeStamp [
	"Answer a TimeStamp that corresponds to my (text) stamp"

	| tokens |
	tokens := self stamp findTokens: Character separators.
	^ tokens size > 2
		ifTrue: [ 
			[ 
			| time date |
			date := Date fromString: (tokens at: tokens size - 1).
			time := Time fromString: tokens last.
			DateAndTime date: date time: time ]
				on: Error
				do: [ :ex | ex return: DateAndTime new ] ]
		ifFalse: [ DateAndTime new ]
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:17:01'
}
ChangeRecord>>type [
	^ type
]
