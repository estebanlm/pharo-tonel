"
A SpecLayoutAddWithSpec is an action representing an add in the spec table layout with a spec selector precised

"
Class {
	#name : #SpecTableLayoutAddWithSpec,
	#superclass : #SpecTableLayoutAdd,
	#category : #Spec-Layout,
	#timestamp : 'webwarrior 6/12/2014 00:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddWithSpec class>>subwidget: sub spec: aSpecSelector [
	^ self new 
		subwidget: sub 
		spec: aSpecSelector
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutAddWithSpec>>subwidget: sub spec: aSpecSelector [
	self subwidget: (sub isArray 
						ifTrue: [ #(model), sub , {#retrieveSpec:. aSpecSelector} ]
						ifFalse: [ {#model. sub . #retrieveSpec: . aSpecSelector } ]).
	
	self generateArguments
]
