"
A canvas which ignores all drawing commands.
"
Class {
	#name : #NullCanvas,
	#superclass : #PluggableCanvas,
	#category : #Graphics-Canvas,
	#timestamp : '<historical>'
}

{
	#category : #drawing-support,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>clipBy: region during: aBlock [
	"do this in order that timing runs work better"
	aBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>clipRect [
	^1@1 extent: 99@99
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>copyClipRect: clipRect [
	"who cares what the clipping rectangle is?"
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>extent [
	^100@100
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>form [
	^Form extent: self extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>origin [
	^0@0
]

{
	#category : #drawing-support,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize [
	"do this in order that timing runs work better"
	aBlock value: self
]

{
	#category : #drawing-support,
	#timestamp : ' 8/31/2017 05:26:10'
}
NullCanvas>>translateBy: delta during: aBlock [
	"do this in order that timing runs work better"
	aBlock value: self
]
