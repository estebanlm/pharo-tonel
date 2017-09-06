"

"
Class {
	#name : #MCSnapshotTest,
	#superclass : #MCTestCase,
	#instVars : [
		'snapshot'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotTest>>setUp [
	snapshot :=  self mockSnapshot.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotTest>>testCreation [
	|d|
	d :=  self mockSnapshot definitions.
	self assert: (d anySatisfy: [:ea | ea isClassDefinition and: [ea className = #MCMockClassA]]).
	self assert: (d anySatisfy: [:ea | ea isMethodDefinition and: [ea selector = #mockClassExtension]]).
	self assert: (d allSatisfy: [:ea | ea isClassDefinition not or: [ea category endsWith: 'Mocks']]).
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotTest>>testInstanceReuse [
	| x m n y |
	x := (MCPackage new name: self mockCategoryName) snapshot.
	Smalltalk garbageCollect.
	n := MCDefinition allSubInstances size.
	y := (MCPackage new name: self mockCategoryName) snapshot.
	Smalltalk garbageCollect.
	m := MCDefinition allSubInstances size.
	self assert: m = n
]
