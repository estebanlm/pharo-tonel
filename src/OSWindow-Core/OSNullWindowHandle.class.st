"
i am a handle for null window , created using OSNullWindowDriver.
"
Class {
	#name : #OSNullWindowHandle,
	#superclass : #OSWindowHandle,
	#instVars : [
		'attributes'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:41'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle class>>fromAttributes: attributes for: anOSWindow  [
	^ self new attributes: attributes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>attributes: newAttributes [
	attributes := newAttributes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>bounds: aRectangle [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>clipboardText [
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>clipboardText: anObject [

]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>destroy [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>extent [
	^ attributes extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>extent: newExtent [
	attributes extent: newExtent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>hide [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>isValid [
	^ true
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>newFormRenderer: form [
	^ renderer := OSNullFormRenderer new form: form
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>newGenericRenderer [
	^ renderer := OSWindowNullGenericRenderer new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>platformSpecificHandle [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>position [
	^ attributes position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>position: position [
	attributes position: position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>show [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>title [
	^attributes title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowHandle>>title: anObject [

]
