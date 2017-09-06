"
Text display command for changing the background color
"
Class {
	#name : #AthensBackgroundChange,
	#superclass : #AthensTextDisplayCommand,
	#instVars : [
		'color',
		'start',
		'width'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:16'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>addWidth: aWidth [
	width := width + aWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>color [

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>color: anObject [

	color := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>initialize [
	width :=0.
	color := Color transparent.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>renderOn: renderer [
	color isTransparent ifFalse: [
		renderer renderBackground: self
	]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>start: aStart [
	start := aStart
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>width [

	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBackgroundChange>>width: anObject [

	width := anObject
]
