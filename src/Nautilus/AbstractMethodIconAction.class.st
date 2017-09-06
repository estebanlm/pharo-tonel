"
AbstractMethodIconAction is the common super class for all the method icon actions.


A method icon action is used to retrieve the correct icon the method in nautilus lists
"
Class {
	#name : #AbstractMethodIconAction,
	#superclass : #Object,
	#instVars : [
		'method',
		'browser',
		'icon'
	],
	#category : #Nautilus-Widgets,
	#timestamp : 'FranckWarlouzet 6/3/2015 13:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction class>>for: aMethod in: aBrowser [

	^ self new
		method: aMethod;
		browser: aBrowser;
		yourself
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>actionIcon [
	"Return the icon for this action"
	
	^ icon := self privateActionIcon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>actionOrder [
	"Return the priority of this action"
	
	^ self subclassResponsibility
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ IconicButtonStateHolder forNautilus: icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>browser [

	^ browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>browser: aBrowser [

	browser := aBrowser
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>iconExtent [

	^16@16
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>iconForTestResultOf: aMethod [
	aMethod isPassedTest
		ifTrue: [ ^ self iconNamed: #testGreenIcon ].
	aMethod isFailedTest
		ifTrue: [ ^ self iconNamed: #testYellowIcon ].
	aMethod isErrorTest
		ifTrue: [ ^ self iconNamed: #testRedIcon ].
	^ self iconNamed: #testNotRunIcon.
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>isActionHandled [
	"Return true if the provided method fits this action requirement. Implementation note: The best way to make sure that the system will break when we will add a new action is to use self subclassResponsibility for this method. So by default return false to avoid blowing up the system under your fingers!"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>method [

	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>method: aMethod [

	method := aMethod
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractMethodIconAction>>privateActionIcon [
	
	^ self subclassResponsibility
]
