"
I am a data object representing an action associated to a tab.

I contains
	- an action to be performed when clicked
	- an icon to be rendered
	- a label to add indication about what I am supposed to do
"
Class {
	#name : #TabAction,
	#superclass : #Object,
	#instVars : [
		'action',
		'icon',
		'label'
	],
	#category : #Morphic-Widgets-Tabs,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction class>>action: action icon: icon label: label [

	^ self new
		action: action;
		icon: icon;
		label: label;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>action: anObject [

	action := anObject.
	icon on: #click send: #value to: action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>icon: aForm [

	icon image: aForm.
	label 
		ifNotNil: [ icon setBalloonText: label maxLineLength: 100 ].
	action ifNotNil: [ icon on: #click send: #value to: action ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>initialize [

	super initialize.

	icon := ImageMorph new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabAction>>label: aLabel [

	label := aLabel.
	icon setBalloonText: label maxLineLength: 100
]
