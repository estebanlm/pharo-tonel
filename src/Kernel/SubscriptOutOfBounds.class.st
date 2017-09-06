"
I am SubscriptOutOfBounds, an exception indicating that some operation attempted to use a subscript outside allowed bounds.

Normally, I hold the offending subscript and/or the allowed lowerBound and upperBound (inclusive).

SubscriptOutOfBounds 
	signalFor: 10 
	lowerBound: 1 
	upperBound: 5 
	in: (Array new: 5)
"
Class {
	#name : #SubscriptOutOfBounds,
	#superclass : #Error,
	#instVars : [
		'subscript',
		'lowerBound',
		'upperBound'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 13:00'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds class>>signalFor: subscript [
	^ self 
		signalFor: subscript 
		lowerBound: nil 
		upperBound: nil
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds class>>signalFor: subscript lowerBound: lowerBound upperBound: upperBound [
	^ self 
		signalFor: subscript 
		lowerBound: lowerBound 
		upperBound: upperBound 
		in: nil

]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds class>>signalFor: subscript lowerBound: lowerBound upperBound: upperBound in: object [
	^ self new
		signaler: object;
		subscript: subscript;
		lowerBound: lowerBound;
		upperBound: upperBound;
		signal		 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>lowerBound [
	^ lowerBound
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>lowerBound: anObject [
	lowerBound := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		self subscript 
			ifNil: [
				stream << 'subscript' ]
			ifNotNil: [ 
				stream print: self subscript ].
		(self lowerBound notNil and: [ self upperBound notNil])
			ifTrue: [
				stream << ' is not between '.
				stream print: self lowerBound.
				stream << ' and '.
				stream print: self upperBound ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>subscript [
	^ subscript
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>subscript: anObject [
	subscript := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>upperBound [
	^ upperBound
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SubscriptOutOfBounds>>upperBound: anObject [
	upperBound := anObject
]
