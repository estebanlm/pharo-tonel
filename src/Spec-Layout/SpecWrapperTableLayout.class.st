"
A SpecWrapperTableLayout is a variant of SpecTableLayout that is a  wrapper around a single element.
It is used to set hResizing, vResizing, and/or some other properties affecting layout.

"
Class {
	#name : #SpecWrapperTableLayout,
	#superclass : #SpecTableLayout,
	#instVars : [
		'elementAdded'
	],
	#category : #Spec-Layout,
	#timestamp : 'webwarrior 6/12/2014 16:39'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout class>>column [
	self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout class>>row [
	self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout class>>wrap: aSpec [
	^ self new add: aSpec
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout class>>wrap: modelGetter withSpec: aSymbol  [
	^ self new add: modelGetter withSpec: aSymbol
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>add: aSpec [
	elementAdded 
		ifTrue: [ Error signal: ('{0} can only hold 1 element' format: { self class name }) ]
		ifFalse: [ super add: aSpec. elementAdded := true. ]
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>add: modelGetter withSpec: aSymbol  [
	elementAdded 
		ifTrue: [ Error signal: ('{0} can only hold 1 element' format: { self class name }) ]
		ifFalse: [ super add: modelGetter withSpec: aSymbol. elementAdded := true. ]
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>add: modelGetter withSpec: aSymbol wrapped: aBlock [
	self shouldNotImplement
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>add: aSpec wrapped: aBlock [
	self shouldNotImplement
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>addSpacer [
	self shouldNotImplement
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>addSpacerSized: aNumber [
	self shouldNotImplement
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>addSpacerWeighted: aNumber [
	self shouldNotImplement
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapperTableLayout>>initialize [
	elementAdded := false.
	super initialize
]
