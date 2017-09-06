"
I am a Spec adapter that uses a WorldMorph in an external OSWindow.

"
Class {
	#name : #OSWindowWorldMorphAdapter,
	#superclass : #MorphicWindowAdapter,
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/9/2016 18:05'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowWorldMorphAdapter>>buildWidget [
	^ OSWindowWorldMorphWithModel new
		layoutPolicy: ProportionalLayout new;
		model: model;
		isResizeable: self isResizeable;
		yourself
]
