"
I'm an alternative UIManager used to run an the image without GUI.  I redefine methods which requires user input as these requests are irrelevant in a headless environment. 
"
Class {
	#name : #DummyUIManager,
	#superclass : #UIManager,
	#classVars : [
		'ProgressBarEnabled'
	],
	#category : #UIManager,
	#timestamp : 'LaurentLaffont 2/23/2011 20:16'
}

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>chooseDirectory: label from: dir [

	^ nil
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>chooseFrom: aList lines: linesArray title: aString [

	^ aList first
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>chooseFrom: labelList values: valueList lines: linesArray title: aString [

	^ valueList first
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>confirm: queryString [

	(ProvideAnswerNotification signal: queryString) ifNotNil: [:answer |
		^answer].

	self error: 'No user response possible'
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>confirm: queryString label: title trueChoice: trueChoice falseChoice: falseChoice cancelChoice: cancelChoice default: defaultOption [
	(ProvideAnswerNotification signal: queryString) ifNotNil: [:answer | ^ answer].

	self error: 'No user response possible'
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>confirm: aString orCancel: cancelBlock [

	(ProvideAnswerNotification signal: aString) ifNotNil: [:answer |
		^answer == #cancel ifTrue: [cancelBlock value] ifFalse: [answer]].

	self error: 'No user response possible'
]

{
	#category : #debug,
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>debugProcess: process context: context label: title fullView: bool notification: notificationString [
	Warning signal: 'Trying to debug the process ', title
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>edit: aText label: labelString accept: aBlockOrNil [

	^ nil
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>fileDoesNotExistsDefaultAction: anException [

]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>fileExistsDefaultAction: anException [

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>fontFromUser: priorFont [

	self error: 'No user response possible'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>handleError: anError log: shouldLog [

	"NOOP"
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>inform: aString [
	"Nothing to be done here"
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>informUserDuring: aBlock [

	aBlock value: DummySystemProgressItem new.
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>lowSpaceWatcherDefaultAction [

	Transcript show: '*** LOW SPACE ***'; cr.

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>merge: merger informing: aString [

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>multiLineRequest: queryString initialAnswer: defaultAnswer answerHeight: answerHeight [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>progressBarEnabled [

  ^ ProgressBarEnabled ifNil: [ ProgressBarEnabled := true ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>progressBarEnabled: aBoolean [

  ProgressBarEnabled := aBoolean
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>request: queryString initialAnswer: defaultAnswer  [

	^ self request: queryString initialAnswer: defaultAnswer title: 'Provide the following information' entryCompletion: nil

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>request: aStringOrText initialAnswer: defaultAnswer entryCompletion: anEntryCompletion [
	
	^ self request: aStringOrText initialAnswer: defaultAnswer title: 'Information Required' entryCompletion: anEntryCompletion

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>request: aStringOrText initialAnswer: defaultAnswer title: aTitle entryCompletion: anEntryCompletion [

	(ProvideAnswerNotification signal: aStringOrText) ifNotNil: [:answer |
		^ answer == #default ifTrue: [defaultAnswer] ifFalse: [answer]].
	
	self error: 'No user response possible'
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>requestPassword: queryString [
	
	^ self request: queryString initialAnswer: ''
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>restoreDisplay [

]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>restoreDisplayAfter: aBlock [

	aBlock value.
	self restoreDisplay.
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>syntaxErrorNotificationDefaultAction: anException [

	Transcript show: '*** SYNTAX ERROR ***'; cr.
	Transcript show: anException; cr.
	Transcript show: (thisContext stack first: (20 min: thisContext stack size)); cr.
	anException return.
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>unhandledErrorDefaultAction: anException [

	Transcript show: '*** EXCEPTION ***'; cr.
	Transcript show: anException; cr.
	anException signalerContext errorReportOn: Transcript.
	Smalltalk exitFailure
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
DummyUIManager>>warningDefaultAction: anException [

	^ self unhandledErrorDefaultAction: anException
]
