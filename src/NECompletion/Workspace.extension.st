Extension {
	#name : #Workspace
}

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
Workspace>>completionAdditionals [
	| additionals |
	additionals := SortedCollection new.
	bindings ifNotNil: 
		[ bindings keysDo: 
			[ :each | 
			additionals add: (NECLocalEntry 
					contents: each
					type: #local) ] ].
	^ additionals
]

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
Workspace>>completionAdditionalsFromOCompletion [
	"should spend more time to get it"
	
	bindings ifNil: [ ^#() ].
	^bindings keys asArray replace: [ :each | 
		NECLocalEntry 
			contents: each
			type: #local ]
]

{
	#category : #'*necompletion',
	#timestamp : ' 8/31/2017 05:26:21'
}
Workspace>>isCodeCompletionAllowed [
	^true

]
