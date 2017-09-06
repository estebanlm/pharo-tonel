"
An IconicButtonStateHolder is a state holder for Iconic button.

Since Nautilus cache the icon, I do not want to keep pointers to the iconic button's target.
I use this state holder for the storage
"
Class {
	#name : #IconicButtonStateHolder,
	#superclass : #Object,
	#instVars : [
		'target',
		'actionSelector',
		'arguments',
		'labelGraphic',
		'color',
		'extent',
		'helpText',
		'borderWidth'
	],
	#category : #NautilusCommon,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder class>>forIcon: icon [

	^ self new
		forIcon: icon;
		yourself	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder class>>forNautilus: icon [

	^ self new
		forIcon: icon;
		yourself	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>actionSelector [
	^ actionSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>actionSelector: anObject [
	actionSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>arguments [
	"convert arguments back from a WeakArray"
	^ Array withAll: arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>arguments: aCollection [
	arguments := WeakArray withAll: aCollection
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>asIcon [

	^ IconicButton new 
		target: self target;
		actionSelector: self actionSelector;
		arguments: self arguments;
		labelGraphic: self labelGraphic;
		color: self color;
		helpText: self helpText;
		extent: self extent;
		borderWidth: self borderWidth
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>asIconTargetting: newTarget [

	^self asIcon
		target: newTarget;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>borderWidth [
	^ borderWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>borderWidth: anObject [
	borderWidth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>color [
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>color: anObject [
	color := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>extent [
	^ extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>extent: anObject [
	extent := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>forIcon: icon [

	self 
		target: icon target;
		actionSelector: icon actionSelector;
		arguments: icon arguments;
		labelGraphic: icon labelGraphic;
		color: icon color;
		helpText: icon helpText;
		extent: icon extent;
		borderWidth: icon borderWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>helpText [
	^ helpText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>helpText: anObject [
	helpText := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>labelGraphic [
	^ labelGraphic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>labelGraphic: anObject [
	labelGraphic := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>target [
	^ target first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IconicButtonStateHolder>>target: anObject [
	target := WeakArray with: anObject
]
