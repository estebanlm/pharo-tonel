"
TickingSpecWindow new openInWorld
"
Class {
	#name : #TickingSpecWindow,
	#superclass : #SpecWindow,
	#category : #Spec-Core-Widgets-Support
}

{ #category : #'stepping and presenter' }
TickingSpecWindow >> step [
	self model step.
]

{ #category : #stepping }
TickingSpecWindow >> stepTime [

	^ self model stepTime
]

{ #category : #stepping }
TickingSpecWindow >> wantsSteps [
	^ true
]
