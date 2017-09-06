"
AbstractWidget is an abstraction for the different widget which could be used to compose the Nautilus UI.

Note however that the design is ugly because it mixes UI and Model. 
All the code in this hierarchy is conceptually bogus and should be rewritten.
"
Class {
	#name : #AbstractWidget,
	#superclass : #Model,
	#instVars : [
		'model'
	],
	#category : #Nautilus-Widgets,
	#timestamp : 'StephaneDucasse 11/11/2015 16:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget class>>listClass [
	^ FTPluggableIconListMorphAdaptor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget class>>model: model [

	^ self new
		model: model;
		yourself
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>dragTransferTypeForMorph: dragSource  [

	^(dragSource isKindOf: self class listClass)
		ifTrue: [ dragSource getListElementSelector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>hasFocus [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>model: anObject [

	model ifNotNil: [  model removeDependent: self].
	anObject ifNotNil: [  anObject addDependent:self].
	model := anObject.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>takeKeyboardFocus [
	^ self subclassResponsibility
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractWidget>>update: aSymbol [

	self changed: aSymbol
]
