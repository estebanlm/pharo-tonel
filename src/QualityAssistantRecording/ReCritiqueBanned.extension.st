Extension {
	#name : #ReCritiqueBanned
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueBanned>>dataForQAR [

	^ super dataForQAR
		at: #banLevel put: entityBanLevel dataForQAR;
		yourself
]
