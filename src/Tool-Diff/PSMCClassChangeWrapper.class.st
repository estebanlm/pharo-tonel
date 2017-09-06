"

"
Class {
	#name : #PSMCClassChangeWrapper,
	#superclass : #PSMCChangeWrapper,
	#instVars : [
		'conflict',
		'contents'
	],
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>actualClass [
	"Answer the class represented in the receiver."

	^ super actualClass ifNil: [ Smalltalk globals classNamed: self item ]
]

{
	#category : #choosing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>chooseLocal [
	"Choose the local version."

	self operation chooseLocal
]

{
	#category : #choosing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>chooseRemote [
	"Choose the remote version."

	self operation chooseRemote
]

{
	#category : #choosing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>clearChoice [
	"Choose neither version (be in conflict)."

	self operation clearChoice
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>contents [
	"Answer the contents of the change."

	^contents ifNil: [contents := self gatherContents]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>gatherContents [
	"Answer the contents of the change from the model."

	^((self model select: [:i | i targetClassName = self item and: [
			i definition isClassDefinition not]])
		collect: [:o |  o patchWrapper model: self model]) asSortedCollection: [:a :b |
			a asString <= b asString]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>icon [
	"Answer a form with an icon to represent the receiver"

	self isConflict
		ifTrue: [ self localChosen
				ifTrue: [ ^ self iconNamed: #changeBlockIcon ] ].
	^ super icon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>isConflict [
	"Answer whether the receiver is a conflict item."

	| op |
	op := self operation.
	^ op notNil and: [op isConflict ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>localChosen [
	"Answer whether the local version is chosen."

	^self operation localChosen
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>operation [
	"Answer the patch operation for the class itself or nil if none."

	^ self model detect: [ :i | i targetClassName = self item and: [ i definition isClassDefinition ] ] ifNone: [ nil ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCClassChangeWrapper>>remoteChosen [
	"Answer whether the remote version is chosen."

	^self conflict remoteChosen
]
