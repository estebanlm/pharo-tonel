"
Common superclass of Gofer operations
"
Class {
	#name : #GoferOperation,
	#superclass : #Object,
	#instVars : [
		'gofer',
		'model'
	],
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation class>>new [
	self error: 'Gofer operations can only work on Gofer instances.'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation class>>on: aGofer [
	^ self basicNew initializeOn: aGofer
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>defaultModel [
	^ nil
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>execute [
	"Execute the receiving action."

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>gofer [
	"Answer the Gofer instance that triggered this operation."

	^ gofer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>initialize [
	model := self defaultModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>initializeOn: aGofer [
	gofer := aGofer.
	self initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferOperation>>model [
	"Answer the Monticello model of this operation."
	
	^ model
]
