"
SDL2 library structure
"
Class {
	#name : #SDL2MappedEvent,
	#superclass : #SDL2Structure,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:43'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2MappedEvent class>>accept: aVisitor [
	self subclassResponsibility
]

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2MappedEvent class>>eventType [
	^ nil
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2MappedEvent class>>fromSdlEvent: event [
	^  self new setHandle: event getHandle
]

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2MappedEvent>>eventType [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2MappedEvent>>windowID [
	^ nil
]
