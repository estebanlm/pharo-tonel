"
SimplestClassListWithChunkExample new openOn: Object
"
Class {
	#name : #SimplestClassListWithChunkExample,
	#superclass : #SimplestPaginatedClassListExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'AlainPlantec 1/30/2010 09:16'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListWithChunkExample class>>example [

	^SimplestClassListWithChunkExample new openOn: Object
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListWithChunkExample>>defaultTreeMorph [
	^ super defaultTreeMorph chunkSize: 100; yourself
]
