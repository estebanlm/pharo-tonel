"
I am a model for a container with table layout. My purpose is to hold multiple subwidgets to glue them together.


I should not be used directly

"
Class {
	#name : #TableContainerModel,
	#superclass : #ContainerModel,
	#category : #Spec-Core-Support
}

{ #category : #specs }
TableContainerModel class >> adapterName [
	^ #MorphicTableContainerAdapter
]

{ #category : #specs }
TableContainerModel class >> defaultSpec [
	<spec>
	^ #(MorphicTableContainerAdapter
		adapt: #(model))
]
