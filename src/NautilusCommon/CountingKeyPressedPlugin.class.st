"
I'm a simple plugin which displays the number of keystrokes at the bottom of Nautilus. I'm mainly an example.
"
Class {
	#name : #CountingKeyPressedPlugin,
	#superclass : #AbstractKeyPressedPlugin,
	#instVars : [
		'stringMorph',
		'counter'
	],
	#category : #NautilusCommon-Plugin-Examples,
	#timestamp : 'StephaneDucasse 10/30/2014 07:33'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin class>>defaultPosition [

	^ #bottom
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin class>>description [

	^ 'Display the number of key pressed'
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin>>display [

	^ stringMorph
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin>>initialize [
	super initialize.
	counter := 0.
	self stringMorph
		contents: 'Keys pressed: ' , counter printString;
		openInWorld
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin>>keyPressed: anAnnouncement [
	counter := counter + 1.
	self stringMorph contents: 'Keys pressed: ' , counter printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin>>stringMorph [
	^ stringMorph
		ifNil: [ 
			stringMorph := LabelMorph new
				enabled: false;
				vResizing: #shrinkWrap;
				hResizing: #spaceFill;
				yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
CountingKeyPressedPlugin>>stringMorph: anObject [
	stringMorph := anObject
]
