"
Weak action sequences for events
"
Class {
	#name : #WeakActionSequence,
	#superclass : #Array,
	#type : #variable,
	#category : #'System-Object Events',
	#timestamp : 'TorstenBergmann 2/4/2014 21:46'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
WeakActionSequence>>asActionSequence [

	^self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
WeakActionSequence>>asMinimalRepresentation [

	| valid |
	valid := self select: [:e | e isValid ].
	valid size = 0
		ifTrue: [^nil].
	valid size = 1
		ifTrue: [^valid first].
	^valid
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:10'
}
WeakActionSequence>>printOn: aStream [

	self size < 2 ifTrue: [^super printOn: aStream].
	aStream nextPutAll: '#('.
	self
		do: [:each | each printOn: aStream]
		separatedBy: [aStream cr].
	aStream nextPut: $)
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:10'
}
WeakActionSequence>>value [
    "Answer the result of evaluating the elements of the receiver.
	Actually, return just the last result."

    | answer |
    self do:
        [:each | each isValid ifTrue: [answer := each value]].
    ^answer
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:10'
}
WeakActionSequence>>valueWithArguments: anArray [

	"Return the last result"

    | answer |
    self do:
        [:each |
        	each isValid ifTrue: [answer := each valueWithArguments: anArray]].
    ^answer
]
