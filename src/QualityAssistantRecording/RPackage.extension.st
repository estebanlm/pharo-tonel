Extension {
	#name : #RPackage
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
RPackage>>dataForQAR [

	^ super dataForQAR
		at: #class put: self class name;
		at: #name put: self name obfuscatedIfNecessary;
		yourself
]
