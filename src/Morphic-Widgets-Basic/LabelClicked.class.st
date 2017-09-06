"
I am an announcement raised when someone click on the label of a CheckboxMorph
"
Class {
	#name : #LabelClicked,
	#superclass : #Announcement,
	#instVars : [
		'source',
		'stateChanged'
	],
	#category : #Morphic-Widgets-Basic,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelClicked class>>source: source stateChanged: stateChanged [

	^ self new
		source: source;
		stateChanged: stateChanged;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelClicked>>source [
	^ source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelClicked>>source: anObject [
	source := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelClicked>>stateChanged [
	^ stateChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelClicked>>stateChanged: anObject [
	stateChanged := anObject
]
