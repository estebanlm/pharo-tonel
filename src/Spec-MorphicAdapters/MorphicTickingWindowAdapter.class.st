"
I am the adapter used to bridge a TickingWindowModel and a TickingSpecWindow
"
Class {
	#name : #MorphicTickingWindowAdapter,
	#superclass : #MorphicWindowAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : 'StephaneDucasse 3/7/2014 10:55'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTickingWindowAdapter>>buildWidget [
	^ TickingSpecWindow new
			model: self;
			isResizeable: self isResizeable;
			yourself
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTickingWindowAdapter>>step [
	self model step
]
