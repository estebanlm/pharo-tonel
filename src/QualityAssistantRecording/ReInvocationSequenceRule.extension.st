Extension {
	#name : #ReInvocationSequenceRule
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRule>>dataForQAR [

	^ super dataForQAR
		at: #preConditions put: (preConditions collect: #dataForQAR);
		at: #postConditions put: (postConditions collect: #dataForQAR);
		yourself
]
