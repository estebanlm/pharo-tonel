"
Common superclass for metacello writers
"
Class {
	#name : #MCWriter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/6/2014 08:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWriter class>>extension [
	^ self readerClass extension
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWriter class>>on: aStream [
	^ self new stream: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWriter class>>readerClass [
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWriter>>stream [
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCWriter>>stream: aStream [
	stream := aStream
]
