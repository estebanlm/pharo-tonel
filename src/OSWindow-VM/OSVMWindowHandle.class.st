"
An OSVMWindowHandle is created by VMWindowDriver.
 
"
Class {
	#name : #OSVMWindowHandle,
	#superclass : #OSWindowHandle,
	#instVars : [
		'fullscreen'
	],
	#category : #OSWindow-VM,
	#timestamp : 'IgorStasenko 7/30/2014 17:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>bounds [
	^ self position corner: self extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>bounds: bounds [
	self position: bounds origin.
	self extent: bounds extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>clipboardText [
	<primitive: 141>
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>clipboardText: aString [
	<primitive: 141>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>depth: depthInteger width: widthInteger height: heightInteger fullscreen: aBoolean [
	"Force Pharo's window (if there's one) into a new size and depth."
	"DisplayScreen depth: 8 width: 1024 height: 768 fullscreen: false"

	<primitive: 92>
	self primitiveFailed 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>extent [
	<primitive: 106>
	^ 640@480
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>extent: extent [
	self depth: self screenDepth width: extent x height: extent y fullscreen: fullscreen
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>fullscreen: aBoolean [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>hide [
	"Do nothing for now"
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>initWithAttributes: attributes [
	self extent: attributes extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>initialize [
	super initialize.
	fullscreen := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>isValid [
	^ true
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>newFormRenderer: form  [
	^ renderer := OSVMFormRenderer new 
		form: form;
		window: self;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>position [
	"Ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>position: newPosition [
	"Ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>screenDepth [
	<primitive: #primitiveScreenDepth >
	^ self renderer form depth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>setMouseCursor: cursorWithMask [

	Cursor currentCursor == cursorWithMask ifFalse: [  
		Cursor currentCursor: cursorWithMask ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>show [
	"Do nothing for now"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>title [
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSVMWindowHandle>>title: newTitle [
	"Ignored"
]
