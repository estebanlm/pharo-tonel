Extension {
	#name : #RBLintRule
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBLintRule>>dataForQAR [

	^ super dataForQAR
		at: #class put: self class name;
		yourself
]
