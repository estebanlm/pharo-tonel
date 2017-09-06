"
This is a raw SDL2 event
"
Class {
	#name : #SDL_Event,
	#superclass : #FFIExternalObject,
	#classVars : [
		'EventTypeMap'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:45'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event class>>initialize [
	"self initialize"

	SDL2Types initialize.  "make sure its initialized"
	self initializeEventTypeMap
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event class>>initializeEventTypeMap [
	"self initializeEventTypeMap"
	EventTypeMap := Dictionary new.
	SDL2MappedEvent  allSubclassesDo: [ :cls |
		| eventType |
		eventType := cls eventType.
		eventType ifNotNil: [ EventTypeMap at: eventType put: cls ] ]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event>>initialize [
	super initialize.
	self setHandle: (ByteArray new: 56)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event>>mapped [
	^ (EventTypeMap at: self type ifAbsent: [ ^ self unknownEvent ]) fromSdlEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event>>type [
	^self getHandle nbUInt32AtOffset: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Event>>unknownEvent [
	^ SDL_CommonEvent fromSdlEvent: self
]
