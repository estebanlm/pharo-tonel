Extension {
	#name : #ReProperty
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>dataForQAR [

	^ self dataForQAREntityless
		at: #entity put: sourceAnchor sourceEntity dataForQAR;
		yourself 
]

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReProperty>>dataForQAREntityless [

	^ super dataForQAR
		at: #interval put: sourceAnchor interval dataForQAR;
		yourself 
]
