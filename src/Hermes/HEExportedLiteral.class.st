"

"
Class {
	#name : #HEExportedLiteral,
	#superclass : #HEAbstractExported,
	#instVars : [
		'value'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral class>>checkAllTags [
	self assert: (self allSubclasses size = (self allSubclasses collect:#tag as:Set) size)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral class>>for: aValue [
	^ self new
		value: aValue;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral class>>missingTags [
	^ self allSubclasses reject: [ :e | e class canUnderstand: #tag ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral class>>nextTag [
	^(self allSubclasses
		collect: [ :e | 
			(e class canUnderstand: #tag)
				ifTrue: [ e tag ]
				ifFalse: [ -1 ] ]) max + 1
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral class>>readFrom: aReader [
	| tag subclass |
	tag := aReader readByte.
	subclass := self allSubclasses detect: [ :e | e tag = tag ].
	^ subclass new
		doReadFrom: aReader;
		yourself
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral>>doReadFrom: aReader [
	self subclassResponsibility.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral>>doWriteInto: aWriter [
	self subclassResponsibility.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral>>value [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral>>value: anObject [
	value := anObject
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedLiteral>>writeInto: aWriter [
	aWriter writeByte: self class tag.
	self doWriteInto: aWriter.
]
