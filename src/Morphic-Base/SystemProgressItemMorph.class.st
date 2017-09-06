"
A SystemProgressItemMorph is 'bar' in a SystemProgressMorph. 

"
Class {
	#name : #SystemProgressItemMorph,
	#superclass : #Morph,
	#instVars : [
		'bar',
		'labelMorph',
		'lock',
		'result',
		'hasResult',
		'startValue',
		'endValue',
		'lastRefresh'
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
SystemProgressItemMorph class>>labeled: aString from: startValue to: endValue [

	^ self new initializeLabel: aString start: startValue end: endValue.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>beComplete [

	self close.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>changed [

	| msRefreshRate isTimeForRefresh |
	msRefreshRate := 25.
	isTimeForRefresh := Time millisecondClockValue - lastRefresh >= msRefreshRate.
	super changed.
	(self isInWorld and: [ isTimeForRefresh ]) ifTrue: [ self refresh ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>close [

	SystemProgressMorph uniqueInstance close: self.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>current [

	^ bar value.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>current: aNumber [

	bar value: aNumber.
	self changed.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>decrement [

	bar decrement.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>do: aBlock [

	self changed. "We may be in the UI thread, so this will give us a change to dsiplay ourselves before the block starts"
	^ [ aBlock value: self ] ensure: [ self close ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>forceRefreshOnNextChange [

	lastRefresh := 0.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>increment [

	bar increment.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>initializeLabel: aString start: startNumber end: endNumber [
	
	lock := Semaphore forMutualExclusion.
	hasResult := false.
	lastRefresh := 0.
	
	self
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #center;
		cellInset: 5;
		listCentering: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
		
	labelMorph := StringMorph contents: aString font: StandardFonts windowTitleFont.
	self addMorphBack: labelMorph.

	bar := ProgressBarMorph from: startNumber to: endNumber.
	self addMorphBack: bar.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>label [
	
	^ self labelMorph contents.
]

{
	#category : #API,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>label: aString [

	self label isEmpty ifTrue: [ self forceRefreshOnNextChange ].
	self labelMorph contents: aString.
	self changed.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>labelMorph [

	^ labelMorph.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>max: aNumber [
 
	endValue := aNumber.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>refresh [

	lastRefresh := Time millisecondClockValue.
	UIManager default uiProcess == Processor activeProcess
		ifTrue: [ self currentWorld doOneCycleNow ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>result [

	^ result.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>result: anObject [

	lock critical: [ 
		hasResult := true.
		result := anObject ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>start: aNumber [

	startValue := aNumber.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SystemProgressItemMorph>>startAt: aNumber [
 
	startValue := aNumber.
]
