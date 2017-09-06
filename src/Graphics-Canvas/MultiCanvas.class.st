"
A canvas which forwards drawing commands to sub-canvases.
"
Class {
	#name : #MultiCanvas,
	#superclass : #PluggableCanvas,
	#instVars : [
		'canvases',
		'extent',
		'depth'
	],
	#category : #Graphics-Canvas,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>addCanvas: aCanvas [
	canvases add: aCanvas
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>allocateForm: extentPoint [
	"Allocate a new form which is similar to the receiver and can be used for accelerated blts"
	^Form extent: extentPoint depth: self depth
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>apply: aCommand [

	self flag: #roundedRudeness.	
	"This rudeness is to help get rounded corners to work right on RemoteCanvases. Since the RemoteCanvas has no other way to read its bits, we are grabbing them from Display for now. To support this, we need to see that the Display is written before any RemoteCanvases"

	canvases do: [ :canvas | 
		(canvas isKindOf: FormCanvas) ifTrue: [aCommand value: canvas]
	].
	canvases do: [ :canvas | 
		(canvas isKindOf: FormCanvas) ifFalse: [aCommand value: canvas]
	].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>clipRect [
	
	^super clipRect ifNil: [
		0@0 extent: 5000@5000
	].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>contentsOfArea: aRectangle into: aForm [

	self apply: [ :c |
		(c isKindOf: FormCanvas) ifTrue: [
			c contentsOfArea: aRectangle into: aForm.
			^aForm
		].
	].
	self apply: [ :c |
		c contentsOfArea: aRectangle into: aForm.
		^aForm.
	].
	^aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>depth [
	^depth
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>depth: newDepth [
	"set the extent to be used with this canvas"
	depth := newDepth.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>extent [
	^extent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>extent: newExtent [
	"set the extent to be used with this canvas"
	extent := newExtent.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>initialize [
	super initialize.
	canvases := Set new.
	extent := 600@400.
	depth := 32. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
MultiCanvas>>removeCanvas: aCanvas [
	canvases remove: aCanvas ifAbsent: []
]
