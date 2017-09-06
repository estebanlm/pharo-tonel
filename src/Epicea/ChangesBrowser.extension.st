Extension {
	#name : #ChangesBrowser
}

{
	#category : #'*Epicea-Triggering',
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>asEpiceaEvent [

	self flag: #todo. "This is a workaround for a problem found by RewriteTool"
	(changes allSatisfy: [ :each | each respondsTo: #asEpiceaEvent ])
		ifFalse: [ ^ EpCompositeRefactoring withAll: #() ].

	^ changes size > 1
		ifTrue: [ EpCompositeRefactoring withAll: changes ]
		ifFalse: [ changes anyOne asEpiceaEvent ].
]

{
	#category : #'*Epicea-Triggering',
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>isEpiceaInterestingJobOwner [

	^ true
]
