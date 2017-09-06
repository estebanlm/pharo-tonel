"
Recompile
"
Class {
	#name : #GoferRecompile,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRecompile>>execute [
	self workingCopies
		do: [ :each | self execute: each ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRecompile>>execute: aWorkingCopy [
	aWorkingCopy packageSet methods
		do: [ :each | each actualClass recompile: each selector ]
]
