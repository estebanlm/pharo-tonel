"
A command to change the current font color
"
Class {
	#name : #AthensColorChange,
	#superclass : #AthensTextDisplayCommand,
	#instVars : [
		'color'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensColorChange>>color [

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensColorChange>>color: anObject [

	color := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensColorChange>>renderOn: renderer [
	renderer setCurrentColor: color
]
