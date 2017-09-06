"
A command to change the currently selected font
"
Class {
	#name : #AthensFontChange,
	#superclass : #AthensTextDisplayCommand,
	#instVars : [
		'font'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:17'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensFontChange class>>font: aFont  [
	^ self new font: aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensFontChange>>font [
	^ font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensFontChange>>font: aFont [
	font := aFont
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensFontChange>>renderOn: anAthensTextRenderer  [
	anAthensTextRenderer setCurrentFont: font.
]
