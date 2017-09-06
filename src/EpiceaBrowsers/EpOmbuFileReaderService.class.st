"
I implement a service for browsing Epicea logs.
"
Class {
	#name : #EpOmbuFileReaderService,
	#superclass : #Object,
	#category : #EpiceaBrowsers-Integration,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuFileReaderService class>>browseLogInFileNamed: fileName [
	(EpLog freshFromFile: fileName asFileReference) browseEvents
]

{
	#category : #System-FileRegistry,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuFileReaderService class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>

	(fullName endsWith: self fileSuffix)
		ifFalse: [ ^ #() ].

	^ { self service }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuFileReaderService class>>fileSuffix [
	^ OmFileStore defaultFileSuffix
]

{
	#category : #System-FileRegistry,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOmbuFileReaderService class>>service [
	^ SimpleServiceEntry 
		provider: self 
		label: 'Browse Epicea Log'
		selector: #browseLogInFileNamed:
		description: 'Browse the Epicea log.'
		buttonLabel: 'Browse Epicea Log'
]
