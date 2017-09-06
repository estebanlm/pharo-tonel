"
This baseline is used to generate Pharo images from the local clone of pharo-core repository. 

Depends on:
- BaselineOfSUnit

Load type: 
- linear

Installs:
- Graphics-* packages (Form, Bitmap, GrafPort...)
"
Class {
	#name : #BaselineOfDisplay,
	#superclass : #BaselineOf,
	#instVars : [
		'initializersEnabled'
	],
	#category : #BaselineOfDisplay,
	#timestamp : 'PavelKrivanek 11/7/2016 12:06'
}

{
	#category : #baseline,
	#timestamp : ' 8/31/2017 05:26:08'
}
BaselineOfDisplay>>baseline: spec [
	<baseline>

	spec for: #common do: [
		spec preLoadDoIt: #'preload:package:'.
		spec postLoadDoIt: #'postload:package:'.
		
		spec 
			package: 'Graphics-Display Objects';
			package: 'Graphics-Primitives';
			package: 'Graphics-Transformations'.
		spec 
			group: 'default' with: #('Graphics-Display Objects' 'Graphics-Primitives' 'Graphics-Transformations'). ].		

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:08'
}
BaselineOfDisplay>>installBitmap [

	"install new Bitmap class to special objects array"

	| array |
	
	array := Smalltalk specialObjectsArray copy.
	array at: 5 put: Bitmap.
	Smalltalk specialObjectsArray becomeForward: array.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:08'
}
BaselineOfDisplay>>postload: loader package: packageSpec [

	| display |
	
	self installBitmap.

	display := (Smalltalk classNamed: #DisplayScreen) new.
	display setExtent: (Smalltalk classNamed: #DisplayScreen) actualScreenSize depth: 2.
	Smalltalk globals at: #Display put: display.
	display beDisplay.

	Cursor classPool at: #CurrentCursor put: Cursor new.
	Cursor classPool at: #WebLinkCursor put: Cursor new.
					
	Cursor initialize.
	DisplayScreen initialize.
	BitBlt initialize.
	Color initialize.
	
	MCMethodDefinition initializersEnabled: initializersEnabled.
	
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:08'
}
BaselineOfDisplay>>preload: loader package: packageSpec [

	initializersEnabled := MCMethodDefinition initializersEnabled.
	MCMethodDefinition initializersEnabled: false.
	

	

]
