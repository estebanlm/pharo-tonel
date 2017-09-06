"
I implement a filter for fast table. The filter (filterBlock) is a BlockClosure with two arguments. The first argument is a filtered item, the second argument is a string pattern. The block has to return true if the item should be displayed; false otherwise.
"
Class {
	#name : #GLMFilterBlock,
	#superclass : #FTFilter,
	#instVars : [
		'filterBlock'
	],
	#category : #Glamour-FastTable-Model,
	#timestamp : 'JurajKubelka 4/10/2017 11:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFilterBlock class>>block: aBlockClosure [
	^ self new filterBlock: aBlockClosure; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFilterBlock>>filterBlock [
	^ filterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFilterBlock>>filterBlock: anObject [
	"Two argument block: 
		- filtered item
		- string pattern.
	The block should return boolean value."
	filterBlock := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFilterBlock>>matches: anObject [
	"Return true if anObject should be displayed; false otherwise."
	self filterBlock ifNil: [ ^ true ].
	^ self filterBlock valueWithEnoughArguments: { anObject. pattern }
]
