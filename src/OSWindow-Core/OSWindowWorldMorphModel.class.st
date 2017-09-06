"
I am a Spec model that uses a WorldMorph in an external OSWindow.

I am to be use by sending the openExternalWindowWithSpec message to ComposableModel. For example:

ProtocolBrowser new openExternalWindowWithSpec.

"
Class {
	#name : #OSWindowWorldMorphModel,
	#superclass : #WindowModel,
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/9/2016 18:06'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorphModel class>>adapterName [

	^ #OSWindowWorldMorphAdapter
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorphModel class>>defaultSpec [
	<spec>
	
	^ #(#OSWindowWorldMorphAdapter
		adapt: #(model))
]
