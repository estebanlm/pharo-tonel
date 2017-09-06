"
I am an abstract class that represents an accessor for a sequence of objects. This sequence is referred to as my ""contents"".
"
Class {
	#name : #Stream,
	#superclass : #Object,
	#category : #Collections-Streams,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream class>>new [

	self error: 'Streams are created with on: and with:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>><< anObject [
	"A more readable, shorter alternative to #nextPutAll: that also
	accepts non-Collection arguments"

 	anObject putOn: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>atEnd [
	"Answer whether the receiver can access any more objects."

	self subclassResponsibility 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>basicNext [

	^ self next.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>basicNext: anAmount putAll: aCollection startingAt: startIndex [

	^ self next: anAmount putAll: aCollection startingAt: startIndex.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>basicNextPut: anObject  [

	^ self nextPut: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>basicNextPutAll: aCollection  [

	^ self nextPutAll: aCollection.

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>binary [
	"do nothing"
	^self 
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>close [
	"Presumably sets the status of the receiver to be closed. This message does 
	nothing at this level, but is included for FileStream compatibility."

	^self 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>closed [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>contents [
	"Answer all of the contents of the receiver."

	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>do: aBlock  [
	"Evaluate aBlock for each of the objects accessible by receiver."

	[self atEnd]
		whileFalse: [aBlock value: self next]
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>flush [
	"Do nothing by default" 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>isBinary [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>isStream [
	"Return true if the receiver responds to the stream protocol"
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>localName [
	^'a stream'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>next [
	"Answer the next object accessible by the receiver."

	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>next: anInteger  [
	"Answer the next anInteger number of objects accessible by the receiver."
	
	| aCollection |
	aCollection := OrderedCollection new.
	anInteger timesRepeat: [aCollection addLast: self next].
	^aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>next: anInteger put: anObject  [
	<compilerOptions: #(+ optionInlineTimesRepeat)>
	
	"Make anObject be the next anInteger number of objects accessible by the 
	receiver. Answer anObject."
	
	anInteger timesRepeat: [ self nextPut: anObject ].
	^ anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>next: anInteger putAll: aCollection startingAt: startIndex [
	"Store the next anInteger elements from the given collection."
	(startIndex = 1 and:[anInteger = aCollection size])
		ifTrue:[^self nextPutAll: aCollection].
	^self nextPutAll: (aCollection copyFrom: startIndex to: startIndex+anInteger-1)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>nextMatchAll: aColl [
    "Answer true if next N objects are the ones in aColl,
     else false.  Advance stream of true, leave as was if false."
    | save |
    save := self position.
    aColl do: [:each |
       (self next) = each ifFalse: [
            self position: save.
            ^ false]
        ].
    ^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>nextMatchFor: anObject  [
	"Gobble the next object and answer whether it is equal to the argument, 
	anObject."

	^anObject = self next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>nextPut: anObject  [
	"Insert the argument, anObject, as the next object accessible by the 
	receiver. Answer anObject."
	
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>nextPutAll: aCollection  [
	"Append the elements of aCollection to the sequence of objects accessible 
	by the receiver. Answer aCollection."
	
	aCollection do: [:v | self nextPut: v].
	^aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>nextWordsPutAll: aCollection [
	"Write the argument a word-like object in big endian format on the receiver.
	May be used to write other than plain word-like objects (such as ColorArray)."
	
	(aCollection class isPointers or: [ aCollection class isWords not ])
		ifTrue: [ ^ self error: aCollection class name,' is not word-like'].
	1 to: aCollection basicSize do: [ :i |
		self nextNumber: 4 put: (aCollection basicAt: i) ].
	^ aCollection
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>openReadOnly [
	^self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>print: anObject [
	"Have anObject print itself on the receiver."

	anObject printOn: self
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>readOnly [
	"do nothing"
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>upToEnd [
	"answer the remaining elements in the string"
	| elements |
	elements := OrderedCollection new.
	[ self atEnd ] whileFalse: [ 
		elements add: self next ].
	^elements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
Stream>>write: anObject [
	"Like <<, but returns the object putOn the receiver."

	anObject putOn: self.
	^ anObject.
]
