"

"
Class {
	#name : #MetacelloCachingGoferResolvedReference,
	#superclass : #GoferResolvedReference,
	#instVars : [
		'cachedVersion'
	],
	#category : #Metacello-MC-Gofer,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloCachingGoferResolvedReference>>version [
	"Answer a Monticello version of the receiver."

	cachedVersion == nil ifTrue: [ cachedVersion := super version ].
	^ cachedVersion
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloCachingGoferResolvedReference>>workingCopy [
	"Answer a working copy or throw an error if not present."

	| pName |
	cachedVersion == nil ifTrue: [ ^super workingCopy ].
	pName := cachedVersion package name.
	^MCWorkingCopy allManagers
		detect: [ :each | pName = each packageName ]
		ifNone: [ self error: 'Working copy for ' , self name , ' not found' ]
]
