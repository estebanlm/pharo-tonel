"
The abstract strategy that deals with setting of presentations on the pane of the destination port.
"
Class {
	#name : #GLMPresentStrategy,
	#superclass : #GLMTransmissionStrategy,
	#instVars : [
		'presentationsFactory'
	],
	#category : #Glamour-Core,
	#timestamp : 'DamienCassou 7/9/2011 23:02'
}

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>addPresentation: aPresentation [
	|currentPresentations|
	
	currentPresentations  := self presentations.
	self presentationsFactory: [ :composite | 
		currentPresentations do: [ :each | composite add: each ].
		composite add: aPresentation copy ]
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>addPresentations: aCollection [
	aCollection do: [:each | self addPresentation: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>presentations [
	<debuggingStone: #presentationCreation label: 'Presentation creation'>
	| presentations |
	presentations := GLMCompositePresentation new.
	self presentationsFactory glamourValue: (
			presentations asGlamorousMultiValue, 
			(self transmission origins collect: #value )).
	^ presentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>presentations: anObject [
	"self presentationsFactory: anObject "
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>presentationsFactory [
	^ presentationsFactory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentStrategy>>presentationsFactory: anObject [
	presentationsFactory := anObject
]
