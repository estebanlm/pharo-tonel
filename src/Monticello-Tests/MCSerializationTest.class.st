"

"
Class {
	#name : #MCSerializationTest,
	#superclass : #MCTestCase,
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>assertDependenciesMatchWith: writerClass [
	| stream readerClass expected actual |
	readerClass := writerClass readerClass.
	expected := self mockVersionWithDependencies.
	stream := RWBinaryOrTextStream on: String new.
	writerClass fileOut: expected on: stream.
	actual := (readerClass on: stream reset) dependencies.
	self assert: actual = expected dependencies.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>assertExtensionProvidedBy: aClass [
	aClass readerClass extension
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>assertSnapshotsMatchWith: writerClass [
	| readerClass expected stream actual |
	readerClass := writerClass readerClass.
	expected := self mockSnapshot.
	stream := RWBinaryOrTextStream on: String new.
	(writerClass on: stream) writeSnapshot: expected.
	actual := readerClass snapshotFromStream: stream reset.
	self assertSnapshot: actual matches: expected.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>assertVersionInfosMatchWith: writerClass [
	| stream readerClass expected actual |
	readerClass := writerClass readerClass.
	expected := self mockVersion.
	stream := RWBinaryOrTextStream on: String new.
	writerClass fileOut: expected on: stream.
	actual := readerClass versionInfoFromStream: stream reset.
	self assert: actual = expected info.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>assertVersionsMatchWith: writerClass [
	| stream readerClass expected actual |
	readerClass := writerClass readerClass.
	expected := self mockVersion.
	stream := RWBinaryOrTextStream on: String new.
	writerClass fileOut: expected on: stream.
	actual := readerClass versionFromStream: stream reset.
	self assertVersion: actual matches: expected.
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>mockDiffyVersion [
	| repos workingCopy base next |
	repos := MCDictionaryRepository new.
	workingCopy := MCWorkingCopy forPackage: self mockPackage.
	workingCopy repositoryGroup addRepository: repos.
	MCRepositoryGroup default removeRepository: repos.
	base := self mockVersion.
	repos storeVersion: base.
	self change: #a toReturn: 'a2'.
	next := self mockVersionWithAncestor: base.
	^ next asDiffAgainst: base	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>testMcdSerialization [
	| stream expected actual |
	expected := self mockDiffyVersion.
	stream := RWBinaryOrTextStream on: String new.
	MCMcdWriter fileOut: expected on: stream.
	actual := MCMcdReader versionFromStream: stream reset.
	self assertVersion: actual matches: expected.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>testMczSerialization [
	self assertVersionsMatchWith: MCMczWriter.
	self assertExtensionProvidedBy: MCMczWriter.
	self assertVersionInfosMatchWith: MCMczWriter.
	self assertDependenciesMatchWith: MCMczWriter.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSerializationTest>>testStSerialization [
	self assertSnapshotsMatchWith: MCStWriter.
]
