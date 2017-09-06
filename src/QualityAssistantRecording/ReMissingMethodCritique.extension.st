Extension {
	#name : #ReMissingMethodCritique
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReMissingMethodCritique>>dataForQAREntityless [

	^ super dataForQAREntityless
		at: #missingSelector put: selector obfuscatedIfNecessary;
		at: #targetClass put: class dataForQAR;
		yourself 
]
