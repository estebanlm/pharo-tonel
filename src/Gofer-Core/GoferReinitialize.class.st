"
I'm a private and internal class to Gofer. I'm a command used to call the class side initializers on all package code.
"
Class {
	#name : #GoferReinitialize,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'LaurentLaffont 2/23/2011 20:22'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReinitialize>>execute [
	self workingCopies
		do: [ :each | self execute: each ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReinitialize>>execute: aWorkingCopy [
	aWorkingCopy packageSet methods do: [ :each |
		(each classIsMeta and: [ each selector = #initialize ])
			ifTrue: [ each actualClass theNonMetaClass initialize ] ]
]
