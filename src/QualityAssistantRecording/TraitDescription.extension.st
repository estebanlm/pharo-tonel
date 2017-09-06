Extension {
	#name : #TraitDescription
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitDescription>>dataForQAR [

	^ super dataForQAR
		at: #class put: self class name;
		at: #name put: self theNonMetaClass name obfuscatedIfNecessary;
		at: #isMeta put: self isMeta;
		at: #package put: self package name obfuscatedIfNecessary;
		yourself
]
