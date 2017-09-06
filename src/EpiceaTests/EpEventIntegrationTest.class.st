"

"
Class {
	#name : #EpEventIntegrationTest,
	#superclass : #EpEnabledIntegrationTest,
	#category : #EpiceaTests-Integration,
	#timestamp : ''
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpEventIntegrationTest>>mockPackage [

	^ MCPackage new name: #EpTest
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpEventIntegrationTest>>mockVersion [

	^ MCVersion 
		package: self mockPackage
		info: self mockVersionInfo
		snapshot: MCSnapshot empty
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpEventIntegrationTest>>mockVersionInfo [

	^ MCVersionInfo
		name: #EpTest
		id: UUID new
		message: ''
		date: nil
		time: nil
		author: ''
		ancestors: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpEventIntegrationTest>>testMCVersionSaved [

self flag: #todo. "Don't understand why it fails in non-interactive mode (in Jenkins)"

"	| announcements version repository |
	version := self mockVersion.
	repository := MCDictionaryRepository new.
	announcements := OrderedCollection new.

	self assert: (self countLogEventsWith: EpMonticelloVersionSave) equals: 0.

	repository storeVersion: version.

	self assert: (self countLogEventsWith: EpMonticelloVersionSave) equals: 1.
"
]
