"
I am a basic decorator stream that will wrap a stream and forward messages to my decoree.

Subclass me to write a decorator that reuses some methods.
"
Class {
	#name : #DecoratorStream,
	#superclass : #Stream,
	#instVars : [
		'decoratedStream'
	],
	#category : #Collections-Streams,
	#timestamp : 'GuillermoPolito 6/12/2015 12:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream class>>on: aStream [

	^ self basicNew
		on: aStream;
		yourself.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>atEnd [
	^ decoratedStream atEnd
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>next [

	^ decoratedStream next
]

{
	#category : #'initialize - release',
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>on: aStream [

	self initialize.
	decoratedStream := aStream.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>peek [

	^ decoratedStream peek
]

{
	#category : #decorating,
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>position [
	
	^ decoratedStream position
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:16:48'
}
DecoratorStream>>store: anObject [

	anObject storeOn: self
]
