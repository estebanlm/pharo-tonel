"
A filter for blocks
"
Class {
	#name : #BlockFilter,
	#superclass : #StackFilter,
	#instVars : [
		'block'
	],
	#category : #DebuggerFilters,
	#timestamp : 'TorstenBergmann 1/31/2014 11:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
BlockFilter class>>forBlock: aBlockClosure [
	^ self new block: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BlockFilter>>block [
	 ^block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BlockFilter>>block: aBlockClosure [
	block:= aBlockClosure
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BlockFilter>>shouldDisplay: aContext [
	 ^self block value: aContext
]
