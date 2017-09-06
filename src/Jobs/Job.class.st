"
A Job is a task to run and potentially notified to the user.  

[:job | job title: 'Let us get started'.
	1 to: 10 do: [:each | 
		job 
			progress: (0.1 * each); 
			title: 'Youpi ', each printString.
		(Delay forMilliseconds: 100) wait. 
		] ]  asJob run
"
Class {
	#name : #Job,
	#superclass : #Object,
	#instVars : [
		'block',
		'currentValue',
		'min',
		'max',
		'title',
		'children',
		'isRunning',
		'parent',
		'process'
	],
	#classInstVars : [
		'jobAnnouncer'
	],
	#category : #Jobs-Base,
	#timestamp : 'MartinDias 6/24/2015 15:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>block: aBlock [

	^(self new)
		block: aBlock;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>current [
	"Answer the current job or nil if none."

	^ CurrentJob value
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>exampleCurrentValue [

	[ :job| 
		job title: 'Simulating some progress for 1 Second'. 
		1 second wait. "simulate some work"
		job currentValue: 50.
		1 second wait. "simulate some more work"
		job currentValue: 100.
		1 second wait. "simulate some more work"
	] asJob run
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>exampleDebug [
	"Job exampleDebug"
	| aJob |
	aJob := [ :job| 
		"Set some job properties"
		job 
			title: 'aTitle';
			max: 10.
		1 to: 10 do: [ :i|
			job title: 'Fib ', i asString.
			"do some hard work"
			40 benchFib.
			"update the job progress"
			job currentValue: i. ]
	] asJob.
	
	"run a different thread to interrupt the job"
	[ aJob run ] forkAt: Processor userBackgroundPriority.
	1 second asDelay wait. "wait for the job to start properly"
	aJob debug
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>exampleProgress [

	[:job | job title: 'Let us get started'.
		1 to: 10 do: [:each | 
			job 
				progress: (0.1 * each); 
				title: 'Youpi ', each printString.
			(Delay forMilliseconds: 100) wait. 
			] ]  asJob run
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job class>>jobAnnouncer [
	"Answers the announcer for job announcements"
	
	^ jobAnnouncer 
			ifNil: [ jobAnnouncer := Announcer new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>addChild: aJob [

	children add: aJob.
	aJob parent: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>announce: anAnnouncementClass [

	| announcement |
	announcement := anAnnouncementClass on: self.
	self announcer announce: announcement.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>announceChange [

	isRunning ifFalse: [ ^ self ].
	self announce: JobChange.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>announcer [

	^ self class jobAnnouncer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>block [
	
	^ block
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>block: aBlock [
	
	block := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>children [

	^ children copy.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>cleanupAfterRunning [
	isRunning := false.
	process := nil.
	self announce: JobEnd.
	parent ifNotNil: [ :job | job removeChild: self ].
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>current [

	^ self currentValue.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>current: aNumber [

	self currentValue: aNumber.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>currentValue [
	
	^ currentValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>currentValue: aNumber [
	
	currentValue := aNumber.
	self announceChange.
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>debug [
	^ process debug
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>decrement [

	self currentValue: self currentValue - 1.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>increment [

	self currentValue: self currentValue + 1.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>initialize [

	super initialize.
	min := 0.
	max := 100.
	currentValue := 0.
	title := ''.
	isRunning := false.
	children := OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>isRunning [
	^ isRunning
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>label [

	^ self title.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>label: aString  [

	self title: aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>lookup: lookupBlock ifNone: noneBlock [
	"Detect a job that satisfies the lookupBlock, or value noneBlock if none satisfies. 
	The lookup starts at myself, following recursevely through my parent."

	(lookupBlock value: self) ifTrue: [ ^ self ].
		
	^ parent 
		ifNil: noneBlock 
		ifNotNil: [ parent lookup: lookupBlock ifNone: noneBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>max [
	
	^ max
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>max: aNumber [
	self migrateProgressWhileUpdatingBounds: [ max := aNumber ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>migrateProgressWhileUpdatingBounds: aBlockChangingBounds [
	"Keep the progress value consistent while we change min / max"
	| progress |
	progress := self progress.
	aBlockChangingBounds value.
	self progress: progress.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>min [
	
	^ min
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>min: aNumber [
	self migrateProgressWhileUpdatingBounds: [ min := aNumber ].
	self announceChange.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>owner [

	^ block outerContext receiver
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>parent [

	^ parent
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>parent: aJob  [

	parent := aJob.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>prepareForRunning [

	isRunning := true.
	process := Processor activeProcess.
	CurrentJob value ifNotNil: [ :job | job addChild: self].
	self announce: JobStart.
]

{
	#category : #progress,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>progress [
	"Avoid negative progress and divideByZero."
	^ min >= max ifTrue: [ 1 ] ifFalse: [ (currentValue - min) / (max - min) ]
]

{
	#category : #progress,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>progress: aNormalizedFloat [
	"Set the progress: 0.0 - 1.0"

	currentValue := (min + ((max - min) * aNormalizedFloat)).
	self announceChange.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>removeChild: aJob  [

	children remove: aJob.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>run [

	[ self prepareForRunning.
	  CurrentJob value: self during: [ ^ block cull: self ] ]
			ensure: [ self cleanupAfterRunning ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>title [
	
	^ title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>title: anObject [
	
	title := anObject.
	self announceChange.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>value [

	^ self currentValue.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:14'
}
Job>>value: aNumber [

	self currentValue: aNumber.
]
