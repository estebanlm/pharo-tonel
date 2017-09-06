"
I know how to render a Hiedra ruler element in an Athens canvas.

I have an Athens canvas and my concrete subclasses know how to #render.
"
Class {
	#name : #HiRenderer,
	#superclass : #Object,
	#instVars : [
		'athensCanvas'
	],
	#category : #Hiedra-Rendering,
	#timestamp : 'MartinDias 3/17/2016 23:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRenderer>>athensCanvas: anAthensCanvas  [
	athensCanvas := anAthensCanvas 
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRenderer>>render [
	"Render a Hiedra ruler element in the athensCanvas"
	
	self subclassResponsibility
]
