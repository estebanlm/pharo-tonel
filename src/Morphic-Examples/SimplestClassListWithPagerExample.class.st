"
SimplestClassListWithPagerExample new openOn: Object
"
Class {
	#name : #SimplestClassListWithPagerExample,
	#superclass : #SimplestPaginatedClassListExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'AlainPlantec 1/31/2010 21:13'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListWithPagerExample class>>example [

	^SimplestClassListWithPagerExample new openOn: Object
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestClassListWithPagerExample>>defaultTreeMorph [
	^ super defaultTreeMorph pageSize: 100; yourself

]
