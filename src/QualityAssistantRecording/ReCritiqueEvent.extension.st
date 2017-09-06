Extension {
	#name : #ReCritiqueEvent
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueEvent>>dataForQAR [

	^ super dataForQAR
		at: #class put: self class name;
		at: #entity put: entity dataForQAR;
		yourself
]
