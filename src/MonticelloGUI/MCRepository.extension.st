Extension {
	#name : #MCRepository
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepository class>>fillInTheBlankConfigure [
	^ self fillInTheBlankConfigure: self creationTemplate
			
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepository class>>fillInTheBlankConfigure: aTemplateString  [
	| chunk repo |
	aTemplateString
		ifNil: [^ false].
	chunk := UIManager default
				multiLineRequest: self fillInTheBlankRequest
				initialAnswer: aTemplateString
				answerHeight: 150.
	(chunk notNil and: [ chunk notEmpty ])
		ifTrue: [repo := self readFrom: chunk readStream.
			repo creationTemplate: chunk].
	^ repo
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepository>>morphicOpen [
	self morphicOpen: nil
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepository>>morphicOpen: aWorkingCopy [
	self subclassResponsibility 
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepository>>openAndEditTemplateCopy [
	^ self class fillInTheBlankConfigure: (self asCreationTemplate ifNil: [^nil])
]
