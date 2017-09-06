Extension {
	#name : #GlobalIdentifier
}

{
	#category : #'*GT-EventRecorder',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifier>>obfuscateIfNecessary: anObject [
	^ Privacy sendEntityNames
			ifTrue: [ anObject ]
			ifFalse: [ self obfuscate: anObject ]
]
