"
I'm a Morph that ask to a model a source form and a source rectangle to draw myself.
"
Class {
	#name : #HiRulerLazyMorph,
	#superclass : #Morph,
	#instVars : [
		'model',
		'key'
	],
	#category : #Hiedra-Spec,
	#timestamp : 'MartinDias 7/8/2015 14:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph class>>model: aModel key: anObject  [
	^ self basicNew
		initializeWithModel: aModel 
		key: anObject;
		yourself
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph>>drawOn: aCanvas [
	aCanvas 
		translucentImage: self sourceForm
		at: self bounds origin 
		sourceRect: self sourceRectangle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph>>initializeWithModel: aModel key: anObject [
	self initialize.
	
	model := aModel.
	key := anObject.
	
	self syncExtent.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph>>sourceForm [
	^ model rulerForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph>>sourceRectangle [
	^ model rulerMorphBoundsFor: key
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerLazyMorph>>syncExtent [
	self extent: self sourceRectangle extent
]
