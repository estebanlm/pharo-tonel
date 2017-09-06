"
A 32-bit ARGB Cursor of arbitrary extent (some platforms may limit the size). Compositing assumes alpha is pre-multiplied.
"
Class {
	#name : #CursorWithAlpha,
	#superclass : #Cursor,
	#instVars : [
		'fallback'
	],
	#category : #'Graphics-Display Objects',
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithAlpha>>asCursorForm [

	^ Form newFrom: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithAlpha>>fallback [
	^fallback ifNil: [NormalCursor]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithAlpha>>fallback: aCursor [
	fallback := aCursor
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithAlpha>>primBeCursor [
	<primitive: 101>
	self fallback primBeCursor
]
