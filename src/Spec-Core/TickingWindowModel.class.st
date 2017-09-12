"
In addition to my superclass, I provide an API to execute the #step method every #stepTime.
"
Class {
	#name : #TickingWindowModel,
	#superclass : #WindowModel,
	#category : #Spec-Core-Support
}

{ #category : #specs }
TickingWindowModel class >> adapterName [

	^ #TickingWindowAdapter
]

{ #category : #specs }
TickingWindowModel class >> defaultSpec [
	<spec>
	
	^ #(TickingWindowAdapter
		adapt: #(model))
]

{ #category : #initialization }
TickingWindowModel >> step [
	self model step.
]

{ #category : #stepping }
TickingWindowModel >> stepTime [
	^ self model stepTime
]
