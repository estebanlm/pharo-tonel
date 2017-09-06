"

"
Class {
	#name : #GLMSpotterRequest,
	#superclass : #Notification,
	#instVars : [
		'requests',
		'prompt',
		'default'
	],
	#category : #Glamour-Morphic-Renderer-Spotter,
	#timestamp : ''
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>add: aRequest [
	requests add: aRequest 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>default [
	^ default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>default: anObject [
	default := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>defaultAction [
	^(GLMMorphicSpotter openOn: self) answer
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>handleWith: anObject [
	^ anObject handleCompletionRequest: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>initialize [
	super initialize.
	requests := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>prompt [
	^ prompt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>prompt: anObject [
	prompt := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSpotterRequest>>requests [
	^requests 
]
