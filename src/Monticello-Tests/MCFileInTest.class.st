"

"
Class {
	#name : #MCFileInTest,
	#superclass : #MCTestCase,
	#instVars : [
		'stream',
		'expected',
		'diff'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>alterInitialState [
	self mockClassA touchCVar
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>assertFileOutFrom: writerClass canBeFiledInWith: aBlock [
	(writerClass on: stream) writeSnapshot: self mockSnapshot.
	self alterInitialState.
	self assertSuccessfulLoadWith: aBlock.
	self mockPackage unload.
	self assertSuccessfulLoadWith: aBlock.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>assertInitializersCalled [
	| cvar |
	cvar := self mockClassA cVar.
	self assert: cvar = #initialized
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>assertInitializersOrder [

	| initializationOrder |
	initializationOrder := self mockClassA initializationOrder.
	self assert: initializationOrder = 2.	

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>assertNoChange [
	| actual |
	actual := MCSnapshotResource takeSnapshot.
	diff := actual patchRelativeToBase: expected.
	self assert: diff isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>assertSuccessfulLoadWith: aBlock [
	stream reset.
	aBlock value.
	self assertNoChange.
	self assertInitializersCalled.
	self assertInitializersOrder
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>setUp [
	expected := self mockSnapshot.
	stream := RWBinaryOrTextStream on: String new.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>tearDown [
	(diff isNil or: [diff isEmpty not])
		 ifTrue: [expected updatePackage: self mockPackage].
	MCDataStream initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCFileInTest>>testStWriter [
	"self debug: #testStWriter"
	self
		assertFileOutFrom: MCStWriter
		canBeFiledInWith: [ CodeImporter evaluateReadStream: stream readStream].

]
