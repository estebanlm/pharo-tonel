"
I combine a progress title and a JobPorgressBarMorph to a visual representation of a Job.

Usually I am contained in the global instance of the SystemProgressMorph
"
Class {
	#name : #JobProgressMorph,
	#superclass : #Morph,
	#instVars : [
		'bar',
		'endValue',
		'hasResult',
		'job',
		'labelMorph',
		'lastRefresh',
		'lock',
		'result',
		'startValue'
	],
	#classVars : [
		'BarHeight',
		'BarWidth'
	],
	#category : #Morphic-Base-ProgressBar,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph class>>job: aJob [
	^ self new initializeJob: aJob
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>beComplete [

	self close.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>changed [

	| msRefreshRate isTimeForRefresh |
	msRefreshRate := 60 "roughly 16 times per second".
	isTimeForRefresh := Time millisecondClockValue - self lastRefresh >= msRefreshRate.
	(self isInWorld and: [ isTimeForRefresh ]) ifTrue: [ 
		super changed ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>close [

	SystemProgressMorph uniqueInstance close: self.
	self removeDependent: SystemProgressMorph uniqueInstance.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>current [

	^ bar value.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>current: aNumber [

	bar value: aNumber.
	self changed.
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>debug [
	job isRunning ifTrue: [ job debug ].
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>decrement [

	bar decrement.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>do: aBlock [

	self changed. "We may be in the UI thread, so this will give us a change to dsiplay ourselves before the block starts"
	^ [ aBlock value: self ] ensure: [ self close ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>forceRefreshOnNextChange [

	lastRefresh := 0.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>increment [

	bar increment.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>initialize [

	super initialize.

	self addDependent: SystemProgressMorph uniqueInstance.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>initializeJob: aJob [

	super initialize.
	
	lock := Semaphore forMutualExclusion.
	job := aJob.
	hasResult := false.
	lastRefresh := 0.
	
	self
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #leftCenter;
		listCentering: #center;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
		
	labelMorph := StringMorph 
		contents: job title 
		font: StandardFonts defaultFont.
	bar := JobProgressBarMorph new.
	bar 
		on: #mouseUp send: #debug to: self;
		hResizing: #spaceFill.
	self updateLayout.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>job: aJob [
	job := aJob
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>label [
	
	^ self labelMorph contents.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>label: aString [

	self label isEmpty ifTrue: [ 
		aString isEmptyOrNil 
			ifTrue: [ ^self ].
		self removeAllMorphs.
		self labelMorph contents: aString.
		self updateLayout.
		self changed: #width ].
	
	self labelMorph contents = aString
		ifFalse: [ 
			self labelMorph contents: aString.
			aString isEmptyOrNil 
				ifTrue: [ self removeMorph: self labelMorph ].
			self changed: #width ].
		
	self changed: #width
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>labelMorph [

	^ labelMorph.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>lastRefresh [
	^ lastRefresh ifNil: [  lastRefresh := 0 ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>max: aNumber [
 
	endValue := aNumber
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>progress [

	^ bar progress
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>progress: aNormalizedNumber [
	bar progress = aNormalizedNumber
		ifFalse: [ 
			bar progress: aNormalizedNumber.
			self changed: #progressValue ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>refresh [

	lastRefresh := Time millisecondClockValue.	
	self width: (labelMorph width) + 25.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>result [

	^ result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>result: anObject [
	lock critical: [ 
		hasResult := true.
		result := anObject ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>start: aNumber [

	startValue := aNumber.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>startAt: aNumber [
 
	startValue := aNumber.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
JobProgressMorph>>updateLayout [

	labelMorph contents isEmpty
		ifFalse: [ self addMorphBack: labelMorph].
	self addMorphBack: bar.
]
