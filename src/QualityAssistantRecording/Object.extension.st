Extension {
	#name : #Object
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>dataForQAR [

	^ Dictionary newFromPairs: {
		#class . self class name obfuscatedIfNecessary }
]

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>obfuscatedIfNecessary [

	^ GlobalIdentifier uniqueInstance obfuscateIfNecessary: self
]
