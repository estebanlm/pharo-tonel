"
I am CollectionIsEmpty, an exception indicating that an operation was attempted 
on an empty collection where that does not make sense.
I am an Error and thus an Exception.

The collection that is empty is in my inherited signaler instance variable.

"
Class {
	#name : #CollectionIsEmpty,
	#superclass : #Error,
	#category : #Collections-Abstract,
	#timestamp : 'SvenVanCaekenberghe 4/18/2011 14:53'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionIsEmpty class>>signalWith: aCollection [
	^ self new
		collection: aCollection;
		signal
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionIsEmpty>>collection [
	"Return the collection where something is not found in"
	
	^ self signaler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionIsEmpty>>collection: aCollection [
	"Set the collection where something is not found in"
	
	self signaler: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionIsEmpty>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionIsEmpty>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self collection.
		stream << ' is empty' ]
]
