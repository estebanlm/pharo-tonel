"
AbstractSpecLayoutAction is an abstract class representing a spec layout action.
"
Class {
	#name : #AbstractSpecLayoutAction,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'selector'
	],
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>arguments [
	^ arguments
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>arguments: anObject [
	arguments := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>asSpecElements [

	self subclassResponsibility 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>generateArguments [

	
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>selector [
	^ selector
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractSpecLayoutAction>>selector: anObject [
	selector := anObject
]
