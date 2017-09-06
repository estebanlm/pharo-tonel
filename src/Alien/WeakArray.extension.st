Extension {
	#name : #WeakArray
}

{
	#category : #'*Alien-Core',
	#timestamp : ' 8/31/2017 05:26:09'
}
WeakArray class>>hasWeakDependent: anObject [
	^FinalizationDependents includes: anObject
]
