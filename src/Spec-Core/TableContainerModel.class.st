"
I am a model for a container with table layout. My purpose is to hold multiple subwidgets to glue them together.


I should not be used directly

"
Class {
	#name : #TableContainerModel,
	#superclass : #ContainerModel,
	#category : #Spec-Core-Support,
	#timestamp : 'webwarrior 6/9/2014 15:40'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TableContainerModel class>>adapterName [
	^ #MorphicTableContainerAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TableContainerModel class>>defaultSpec [
	<spec>
	^ #(MorphicTableContainerAdapter
		adapt: #(model))
]
