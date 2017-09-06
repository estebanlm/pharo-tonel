"

"
Class {
	#name : #MCMockDependency,
	#superclass : #Object,
	#instVars : [
		'name',
		'children',
		'hasResolution'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency class>>fromTree: anArray  [
	^ self new initializeWithTree: anArray
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>= other [
	^ self name = other name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>children [
	^ children collect: [:ea | self class fromTree: ea]
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>hasResolution [
	^ hasResolution
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>hash [
	^ self name hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>initializeWithTree: expr [
	expr isSymbol
		ifTrue: [name := expr.
				children := Array new.
				hasResolution := true.]
		ifFalse: [name := expr first.
				expr second isSymbol
					ifTrue: [hasResolution := false.
							children := Array new]
					ifFalse: [hasResolution := true.
							children := expr second]]
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>mockVersionInfo [
	^ MCVersionInfo
		name: self name
		id: (self uuidForName: name)
		message: ''
		date: nil
		time: nil
		author: ''
		ancestors: #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>name [
	^ name
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>resolve [
	^ self hasResolution
		ifTrue: [MCVersion new
					setPackage: MCSnapshotResource mockPackage
					info: self mockVersionInfo
					snapshot: MCSnapshotResource current snapshot
					dependencies: self children]
		ifFalse: [nil]
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMockDependency>>uuidForName: aName  [
	| nm id |
	nm := aName asString.
	id := '00000000-0000-0000-0000-0000000000' 
				, (nm size = 1 ifTrue: [nm , '0'] ifFalse: [nm]).
	^UUID fromString: id
]
