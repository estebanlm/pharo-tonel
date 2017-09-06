Extension {
	#name : #BlockClosure
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
BlockClosure>>cleanCopy [
	"Answer a copy of myself preserving in outerContext just the receiver and method, which are the only needed by a clean block closure."

	^ self shallowCopy
		cleanOuterContext;
		yourself
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
BlockClosure>>cleanOuterContext [
	"Clean my outerContext preserving just the receiver and method, which are the only needed by a clean block closure."

	outerContext := outerContext cleanCopy
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
BlockClosure>>fuelAccept: aGeneralMapper [

	^ self shouldBeSubstitutedByCleanCopy
		"The 'onRecursionDo:' is just to avoid an infinitive loop for the substitution. The cleanCopy MUST be a clean copy so it can be serialized normally"
		ifTrue: [ aGeneralMapper visitSubstitution: self by: self cleanCopy onRecursionDo: [ aGeneralMapper visitVariableObject: self ]  ]
		ifFalse: [ aGeneralMapper visitVariableObject: self ]
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
BlockClosure>>shouldBeSubstitutedByCleanCopy [
	^ self isClean 
]
