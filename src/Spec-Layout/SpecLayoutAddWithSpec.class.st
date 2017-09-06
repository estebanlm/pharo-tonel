"
A SpecLayoutAddWithSpec is an action representing an add in the spec layout with a spec selector precised
"
Class {
	#name : #SpecLayoutAddWithSpec,
	#superclass : #SpecLayoutAdd,
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddWithSpec class>>subwidget: subwidget spec: aSpecSelector layoutFrame: aLayoutFrame [

	^ self new
		subwidget: subwidget 
		spec: aSpecSelector 
		layoutFrame:  aLayoutFrame;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAddWithSpec>>subwidget: sub spec: aSpecSelector layoutFrame: aFrameLayout [

	self subwidget: (sub isArray 
						ifTrue: [ #(model), sub , {#retrieveSpec:. aSpecSelector} ]
						ifFalse: [ {#model. sub . #retrieveSpec: . aSpecSelector } ]).
						
	self layoutFrame: aFrameLayout.
	self generateArguments
]
