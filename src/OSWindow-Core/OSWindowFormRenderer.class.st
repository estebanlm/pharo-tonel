"
I provide a way of delivering form's bits to window's contents.
To obtain my instance, first one create a valid OSWindow and then use #newFormRenderer: .

Then you can render on form, and form's contents will serve as medium which will be displayed inside a window.
"
Class {
	#name : #OSWindowFormRenderer,
	#superclass : #OSWindowRenderer,
	#instVars : [
		'form'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 17:04'
}

{
	#category : #'morphic integration',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>deferUpdatesWhile: aBlock [

	aBlock value
]

{
	#category : #'morphic integration',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>forceDisplayUpdate [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>form [
	
	^ form
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>form: anObject [
	
	form := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>getCanvas [
	^ form getCanvas
]

{
	#category : #size,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>newExtent: newExtent [
	form setExtent: newExtent depth: form depth
]

{
	#category : #'morphic integration',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFormRenderer>>updateAreas: allDamage immediate: forceToScreen [
	"Force all the damage rects to the screen."
	allDamage do: [ :r| self updateRectangle: r ].
]
