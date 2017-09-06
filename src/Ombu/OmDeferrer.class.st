"
I schedule and postpone a message send until the specified duration passed.
"
Class {
	#name : #OmDeferrer,
	#superclass : #Object,
	#instVars : [
		'process',
		'lastSchedule',
		'duration',
		'selector',
		'object'
	],
	#category : #Ombu-Common,
	#timestamp : 'MartinDias 1/31/2017 03:11'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer class>>initialize [
	"
	self initialize
	"
	SessionManager default registerUserClassNamed: self name

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer class>>new [

	^ self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer class>>send: selector to: object after: aDuration [

	^ self basicNew
		initializeWithSelector: selector
		object: object
		duration: aDuration
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer class>>shutDown: quitting [
	"Force my instances to flush before image quits"

	self allInstancesDo: [:each | each flush ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>duration: aDuration [

	duration := aDuration
]

{
	#category : #scheduling,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>flush [

	process ifNotNil: [
		"Execute deferred action and clean up"
		[ self sendMessage ] ensure: [ process := nil ] 
	].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>initializeWithSelector: aSelector object: anObject duration: aDuration  [
	
	self initialize.
	selector := aSelector.
	object := anObject.
	duration := aDuration.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>object [
	^ object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>object: anObject [
	object := anObject
]

{
	#category : #scheduling,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>runMessageProcess [
	process := [ 
		"Loop until enough time passed since last #schedule"
		[ DateAndTime now < (lastSchedule + duration) ]
			whileTrue: [ duration wait ].
			
		"Execute deferred action (if not flushed before) and clean up"
		self flush.
	] fork
]

{
	#category : #scheduling,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>schedule [
	lastSchedule := DateAndTime now.

	process ifNil: [ 
		"Deferrer can be activated during tests which intercept any forked processes.
		To prevent it we should ensure here that message process is running out of tests environment"
		DefaultExecutionEnvironment beActiveDuring: [ self runMessageProcess ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>selector: anObject [
	selector := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmDeferrer>>sendMessage [
	
	object perform: selector
]
