Extension {
	#name : #ReSingleCritiqueEvent
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSingleCritiqueEvent>>dataForQAR [

	^ super dataForQAR
		at: #critique put: critique dataForQAREntityless;
		yourself
]
