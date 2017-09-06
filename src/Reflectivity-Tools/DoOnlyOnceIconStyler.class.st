"
I render an icon to control the state of #doOnlyOnce: 
"
Class {
	#name : #DoOnlyOnceIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Watchpoints,
	#timestamp : 'MarcusDenker 6/24/2016 15:54'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
DoOnlyOnceIconStyler>>iconBlock: aNode [
	^[ :arg | self rearmOneShot]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
DoOnlyOnceIconStyler>>iconFor: aNode [
	^ self iconNamed: #smallWarningIcon 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
DoOnlyOnceIconStyler>>iconLabelBlock: aNode [

	^ [Smalltalk globals 
			at: #OneShotArmed
			ifPresent: [ :val | val ifTrue: ['active' ] ifFalse: ['disabled, click to activate' ]]
			ifAbsent: [ 'active' ]
		]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
DoOnlyOnceIconStyler>>shouldStyleNode: aNode [
	^aNode isMessage and: [ aNode selector = #doOnlyOnce: ]
]
