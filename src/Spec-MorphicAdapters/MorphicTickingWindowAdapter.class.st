"
I am the adapter used to bridge a TickingWindowModel and a TickingSpecWindow
"
Class {
	#name : #MorphicTickingWindowAdapter,
	#superclass : #MorphicWindowAdapter,
	#category : #Spec-MorphicAdapters
}

{ #category : #factory }
MorphicTickingWindowAdapter >> buildWidget [
	^ TickingSpecWindow new
			model: self;
			isResizeable: self isResizeable;
			yourself
]

{ #category : #stepping }
MorphicTickingWindowAdapter >> step [
	self model step
]
