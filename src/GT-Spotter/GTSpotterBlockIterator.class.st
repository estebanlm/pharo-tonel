"

"
Class {
	#name : #GTSpotterBlockIterator,
	#superclass : #GTSpotterIterator,
	#instVars : [
		'onDo'
	],
	#category : #GT-Spotter-Iterators,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterBlockIterator>>itemDo: aBlock  [
	self onDo 
		cull: aBlock
		cull: self context 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterBlockIterator>>onDo [
	^ onDo ifNil: [ onDo := [ :anItemBlock :aContext | " do nothing " ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterBlockIterator>>onDo: anObject [
	onDo := anObject
]
