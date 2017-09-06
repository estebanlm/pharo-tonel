"
I'm a MorphicAlarm to be queued in WorldState list of stepping actions. I hold the stepTime (refresh period) of my receiver / Morph (if nil, the #stepTime value of my receiver is used).

See 
- WordState>>runLocalStepMethodsIn:   (where the stepping actions are sent).
- WorldState>>startStepping:at:selector:arguments:stepTime:  (to queue a new StepMessage)

Example:

MorphicUIManager currentWorld
        startStepping: (Morph new openInWorld)
        at: Time millisecondClockValue
        selector: #toggleVisible
        arguments: nil
        stepTime: 500.
"
Class {
	#name : #StepMessage,
	#superclass : #MorphicAlarm,
	#instVars : [
		'stepTime'
	],
	#category : #Morphic-Base-Events,
	#timestamp : 'LaurentLaffont 3/15/2011 20:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
StepMessage class>>scheduledAt: scheduledTime stepTime: stepTime receiver: aTarget selector: aSelector arguments: argArray [
	^(self receiver: aTarget selector: aSelector arguments: argArray)
		scheduledTime: scheduledTime;
		stepTime: stepTime
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StepMessage>>printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $(;
		print: receiver;
		space;
		print: selector;
		space;
		print: scheduledTime;
		nextPut: $).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StepMessage>>stepTime [
	"Return the step time for this message. If nil, the receiver of the message will be asked for its #stepTime."
	^stepTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
StepMessage>>stepTime: aNumber [
	"Set the step time for this message. If nil, the receiver of the message will be asked for its #stepTime."
	stepTime := aNumber
]
