"
I am an abstract acceptor.
The goal of my children is to properly dispatch the behavior when text is accepted. Depending of the context, different actions could be triggered
"
Class {
	#name : #AbstractAcceptor,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #Nautilus-Acceptors,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractAcceptor class>>model: model [

	^ self new
		model: model;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractAcceptor>>accept: aText notifying: aController [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractAcceptor>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractAcceptor>>model: anObject [
	
	model := anObject
]
