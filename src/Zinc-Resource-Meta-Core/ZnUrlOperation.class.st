"
I am ZnUrlOperation.
I am an abtract superclass of operations that can be performed on ZnUrl objects.

Some operations, like retrieving the contents of a resource described by a URL, depend on elements, most likely the scheme, of the URL. By creating the appropriate subclasses, this behavior can be added.

I implement searching/matching logic on my class side.

  #performOperation:with:on:

which defaults to matching the #operation and #schemes.

I am instanciated to be executed. 

  #performOperation

A concrete example is ZnUrl>>#retrieveContents with subclasses ZnHttpRetrieveContents and ZnFileRetrieveContents.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnUrlOperation,
	#superclass : #Object,
	#instVars : [
		'url',
		'argument'
	],
	#category : #Zinc-Resource-Meta-Core,
	#timestamp : 'SvenVanCaekenberghe 10/24/2014 15:13'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation class>>handlerForOperation: operation with: argument on: url [
	"Search for a subclass that can handle operation with argument on url.
	Signal an Error when no matching handler is found."

	self subclassesDo: [ :each |
		(each handlesOperation: operation with: argument on: url)
			ifTrue: [ ^ each ] ].
	self error: 
		('No URL hander found for operation {1} on URL {2} with {3}' 
			format: { operation. url. argument })
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation class>>handlesOperation: operation with: argument on: url [
	"Return true when my instances can handle operation with argument on url.
	This can optionally be overridden for a more specific test."
	
	^ self operation = operation and: [ self schemes includes: url scheme ]
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation class>>operation [
	"Return the operation that I implement.
	Subclasses can/should override this method."
	
	^ nil
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation class>>performOperation: operation with: argument on: url [
	"Search for a subclass that can handle operation with argument on url.
	Instanciate the operation, execute it and return the result.
	Signal an Error when no matching handler is found."
	
	| handlerClass |
	handlerClass := self handlerForOperation: operation with: argument on: url.
	^ handlerClass new
		url: url;
		argument: argument;
		performOperation 
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation class>>schemes [
	"Return a collection of scheme identifiers that I handle.
	Subclasses can/should override this method."
	
	^ #( )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>argument [
	
	^ argument
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>argument: anObject [
	
	argument := anObject
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>performOperation [
	"Perform the actual operation using url and the optional argument."
	
	self subclassResponsibility 

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(; print: self class operation; space; print: self url.
	self argument ifNotNil: [ :arg | stream space; print: arg ].
	stream nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>url [
	
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUrlOperation>>url: aUrl [
	
	url := aUrl
]
