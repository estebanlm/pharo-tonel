Extension {
	#name : #UIManager
}

{
	#category : #'*Versionner-Core-Model',
	#timestamp : ' 8/31/2017 05:26:38'
}
UIManager>>multilineRequest: request initialAnswer: initial [
	
	^ self multiLineRequest: request initialAnswer: initial answerHeight: 200
]
