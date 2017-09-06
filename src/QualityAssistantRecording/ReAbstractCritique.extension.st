Extension {
	#name : #ReAbstractCritique
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>dataForQAREntityless [

	^ super dataForQAREntityless
		at: #rule put: rule dataForQAR;
		yourself
]
