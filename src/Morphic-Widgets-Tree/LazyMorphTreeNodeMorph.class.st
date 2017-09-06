"
A node for ""lazy drawing"" in a morphic based tree
"
Class {
	#name : #LazyMorphTreeNodeMorph,
	#superclass : #MorphTreeNodeMorph,
	#instVars : [
		'drawable'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>drawOn: aCanvas [
	drawable
		ifFalse: [container buildRowMorphsFrom: self]
		ifTrue: [super drawOn: aCanvas]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>drawSubmorphsOn: aCanvas [
	drawable ifFalse: [^ self].
	super drawSubmorphsOn: aCanvas.

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>drawable [
	^ drawable ifNil: [false]

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>drawable: aBoolean [
	drawable := aBoolean.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>initRow [

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyMorphTreeNodeMorph>>initialize [
	super initialize.
	drawable := false
]
