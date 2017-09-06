"
A PluggableThreePhaseButtonMorph is an extesion of ThreePhaseButtonMorph to make it pluggable

Then a model can be defined, and queried for state, on image, off image and pressed image.
"
Class {
	#name : #PluggableThreePhaseButtonMorph,
	#superclass : #ThreePhaseButtonMorph,
	#instVars : [
		'offImageSelector',
		'onImageSelector',
		'pressedImageSelector',
		'stateSelector'
	],
	#category : #Morphic-Widgets-Basic-Buttons,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph class>>on: aModel [

	^ self new 
			target: aModel;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>offImageSelector [

	^ offImageSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>offImageSelector: anObject  [

	offImageSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>onImageSelector [

	^ onImageSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>onImageSelector: anObject  [

	onImageSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>pressedImageSelector [

	^ pressedImageSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>pressedImageSelector: anObject  [

	pressedImageSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>stateSelector [

	^ stateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>stateSelector: anObject  [

	stateSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>target: anObject [

	target ifNotNil: [ target removeDependent: self ].
	anObject ifNotNil: [ anObject addDependent: self ].
	target := anObject.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>update: aSymbol [

	aSymbol == stateSelector
		ifTrue: [ ^ self updateState ].
	aSymbol == onImageSelector
		ifTrue: [ ^ self updateOnImage ].
	aSymbol == offImageSelector
		ifTrue: [ ^ self updateOffImage ].
	aSymbol == pressedImageSelector
		ifTrue: [ ^ self updatePressedImage ].
				
	^ super update: aSymbol
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>updateOffImage [

	self offImage: ( target perform: offImageSelector )
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>updateOnImage [

	self onImage: ( target perform: onImageSelector )
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>updatePressedImage [

	self pressedImage: ( target perform: pressedImageSelector )
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableThreePhaseButtonMorph>>updateState [

	( target perform: stateSelector )
		ifTrue: [ self state: #on ]
		ifFalse:[ self state: #off ]
]
