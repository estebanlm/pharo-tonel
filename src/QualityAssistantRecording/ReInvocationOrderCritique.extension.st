Extension {
	#name : #ReInvocationOrderCritique
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationOrderCritique>>dataForQAREntityless [

	^ super dataForQAREntityless
		at: #targetMethod put: targetMethodName obfuscatedIfNecessary;
		yourself 
]
