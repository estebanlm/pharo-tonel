"
I'm an abstract class that represent an single delta element between two packages: removal, addition or modification.
"
Class {
	#name : #MCPatchOperation,
	#superclass : #Object,
	#instVars : [
		'isApplicable',
		'isConflict'
	],
	#category : #Monticello-Patching,
	#timestamp : 'StephaneDucasse 6/24/2011 14:15'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>><= other [
	^ self definition <= other definition
]

{
	#category : #'applying operation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>applyTo: anObject [

	(self isConflict and: [self isResolved not] ) ifTrue: [
		self error: 'Cannot continue until this conflict has been resolved' ].
	
	self remoteChosen ifTrue: [ self basicApplyTo: anObject ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>beConflict [
	isConflict := true.
	isApplicable := nil. "not resolved"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>beNonConflict [
	isConflict := false.
	isApplicable := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>chooseLocal [
	isApplicable := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>chooseNewer [
	self isLocalNewer 
		ifTrue: [ self chooseLocal ]
		ifFalse: [ self isRemoteNewer ifTrue: [ self chooseRemote ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>chooseOlder [
	self isRemoteNewer 
		ifTrue: [ self chooseLocal ]
		ifFalse: [ self isLocalNewer ifTrue: [ self chooseRemote ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>chooseRemote [
	isApplicable := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>clearChoice [
	isApplicable := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>definition [
	^ self subclassResponsibility 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>initialize [
	super initialize.
	self beNonConflict
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>inverse [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isAddition [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isClassPatch [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isConflict [
	^ isConflict == true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isLocalNewer [
	^ self localDefinition fullTimeStamp > self remoteDefinition fullTimeStamp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isModification [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isRemoteNewer [
	^ self localDefinition fullTimeStamp < self remoteDefinition fullTimeStamp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isRemoval [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>isResolved [
	^ isConflict and: [ isApplicable notNil ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>localChosen [
	^ isApplicable == false

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>localDefinition [
	^ self baseDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>operation [
	"for compatibility with MCConflict interface"
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>prefixForOperation: aSymbol [
	aSymbol == #insert ifTrue: [^ '+'].
	aSymbol == #remove ifTrue: [^ '-'].
	^ ' '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>printAnnotations: requests on: aStream [
	"Add a string for an annotation pane, trying to fulfill the CodeHolder annotationRequests"

	self definition printAnnotations: requests on: aStream.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>remoteChosen [
	^ isApplicable ~~ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>remoteDefinition [
	^ self targetDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>status [
	^ self isResolved
		ifFalse: ['']
		ifTrue: [self remoteChosen
					ifFalse: ['L']
					ifTrue: ['R']]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>summarySuffix [
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatchOperation>>targetClass [
	self subclassResponsibility.
]
