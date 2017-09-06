"
This is the abstract class for the Glamour loggers. These classes are typically used for debugging hte highly dynamic Glamour model.
"
Class {
	#name : #GLMLogger,
	#superclass : #Object,
	#classInstVars : [
		'nullInstance',
		'instance'
	],
	#category : #Glamour-Helpers,
	#timestamp : 'tg 5/24/2010 17:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLogger class>>instance [
	^ instance ifNil: [
		instance := self nullInstance ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLogger class>>instance: aLogger [
	instance := aLogger 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLogger class>>nullInstance  [
	^ nullInstance ifNil: [
		nullInstance := GLMNullLogger new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLogger class>>reset [
	instance := nil
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLogger>>logAnnouncement: anAnnouncement from: aGLMObject  [
	
	
]
