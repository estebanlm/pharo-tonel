"
Common superclass for Monticello readers
"
Class {
	#name : #MCReader,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/5/2014 13:53'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>canReadFileNamed: fileName [
	^ (fileName endsWith: self extension)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>concreteSubclasses [
	^ self allSubclasses reject: [:c | c isAbstract]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>isAbstract [
	^ (self respondsTo: #extension) not
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>on: aStream [
	^ self new stream: aStream
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>on: aStream name: aFileName [
	| class |
	class := self readerClassForFileNamed: aFileName.
	^ class
		ifNil: [self error: 'Unsupported format: ', aFileName]
		ifNotNil: [class on: aStream]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader class>>readerClassForFileNamed: fileName [
	^ self concreteSubclasses
		detect: [:c | c canReadFileNamed: fileName]
		ifNone: [nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader>>stream [
	stream closed ifTrue: [ stream open ].
	^ stream
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCReader>>stream: aStream [
	stream := aStream
]
