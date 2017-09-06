"
Handle a number of dropped files from the OS
"
Class {
	#name : #ExternalDropHandler,
	#superclass : #Object,
	#instVars : [
		'action',
		'type',
		'extension'
	],
	#classVars : [
		'DefaultHandler',
		'RegisteredHandlers'
	],
	#category : #Morphic-Core-Worlds,
	#timestamp : 'TorstenBergmann 1/31/2014 10:29'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>chooseServiceFrom: aCollection [
	"private - choose a service from aCollection asking the user if  
	needed"
	aCollection size = 1 ifTrue: [^ aCollection anyOne].
	^ UIManager default chooseFrom: (aCollection collect: [:each | 
			each label]) values: aCollection.

]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>cleanUp [
	self resetRegisteredHandlers.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>defaultHandler [
	DefaultHandler ifNil: [DefaultHandler := ExternalDropHandler type: nil extension: nil action: [:dropStream | dropStream edit]].
	^DefaultHandler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>defaultHandler: externalDropHandler [
	DefaultHandler := externalDropHandler
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>initialize [
	"ExternalDropHandler initialize"

	self resetRegisteredHandlers.

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>lookupExternalDropHandler: stream [

	| types extension serviceHandler |
	types := stream mimeTypes.

	types ifNotNil: [
		self registeredHandlers do: [:handler | 
			(handler matchesTypes: types)
				ifTrue: [^handler]]].

	extension := stream name asFileReference extension.
	self registeredHandlers do: [:handler | 
		(handler matchesExtension: extension)
				ifTrue: [^handler]].
	serviceHandler := self lookupServiceBasedHandler: stream.
	^serviceHandler
		ifNil: [self defaultHandler]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>lookupServiceBasedHandler: dropStream [
	"the file was just droped, let's do our job"
	| fileName services theOne |
	fileName := dropStream name.

	services := (Smalltalk tools fileList itemsForFile: fileName asFileReference)
		reject: [:svc | self unwantedSelectors includes: svc selector].

	"no service, default behavior"
	services isEmpty
		ifTrue: [^nil].

	theOne := self chooseServiceFrom: services.
	^theOne
		ifNotNil: [ExternalDropHandler type: nil extension: nil action: [:stream | theOne performServiceFor: stream]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>registerHandler: aHandler [
	self registeredHandlers add: aHandler
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>registeredHandlers [
	RegisteredHandlers ifNil: [RegisteredHandlers := OrderedCollection new].
	^RegisteredHandlers
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>resetRegisteredHandlers [
	RegisteredHandlers := nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>type: aType extension: anExtension action: anAction  [
	^self new type: aType extension: anExtension action: anAction 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler class>>unwantedSelectors [
	"private - answer a collection well known unwanted selectors "
	^ #(#removeLineFeeds: #compressFile:)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>extension [
	^extension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>handle: dropStream in: pasteUp dropEvent: anEvent [
	
	^action cull: dropStream 
			cull: pasteUp 
			cull: anEvent
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>matchesExtension: aExtension [
	(self extension isNil or: [aExtension isNil])
		ifTrue: [^false].
	FileSystem disk isCaseSensitive
		ifTrue: [^extension = aExtension]
		ifFalse: [^extension sameAs: aExtension]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>matchesTypes: types [
	(self type isNil or: [types isNil])
		ifTrue: [^false].
	^types anySatisfy: [:mimeType | mimeType beginsWith: self type]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>type [
	^type
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
ExternalDropHandler>>type: aType extension: anExtension action: anAction  [
	action := anAction.
	type := aType.
	extension := anExtension
]
