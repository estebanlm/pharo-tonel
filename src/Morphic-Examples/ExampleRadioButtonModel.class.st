"
Model used for radio buttons in example of basic controls (see ""UITheme exampleBasicControls"").
"
Class {
	#name : #ExampleRadioButtonModel,
	#superclass : #Model,
	#instVars : [
		'option'
	],
	#category : #Morphic-Examples-Widgets,
	#timestamp : 'gvc 9/23/2008 11:58'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>beCenter [
	"Set the option to #center."

	self option: #center
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>beLeft [
	"Set the option to #left."

	self option: #left
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>beRight [
	"Set the option to #right."

	self option: #right
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		option: #left
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>isCenter [
	"Answer whether the option if #center."

	^self option == #center
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>isLeft [
	"Answer whether the option if #left."

	^self option == #left
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>isRight [
	"Answer whether the option if #right."

	^self option == #right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>option [
	"Answer the value of option"

	^ option
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ExampleRadioButtonModel>>option: aSymbol [
	"Set the value of option"

	option := aSymbol.
	self
		changed: #isLeft;
		changed: #isCenter;
		changed: #isRight
]
