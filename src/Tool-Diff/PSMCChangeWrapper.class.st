"

"
Class {
	#name : #PSMCChangeWrapper,
	#superclass : #ListItemWrapper,
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>actualClass [
	"Answer the class represented in the receiver."

	^(self operation ifNil: [^nil]) targetClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>icon [
	"Answer a form with an icon to represent the receiver"

	| o |
	o := self operation.
	o isNil
		ifTrue: [ ^ self iconNamed: #changeEmptyIcon ].
	o isAddition
		ifTrue: [ ^ self iconNamed: #changeAddIcon ].
	o isRemoval
		ifTrue: [ ^ self iconNamed: #changeRemoveIcon ].
	^ self iconNamed: #changeUpdateIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>isConflict [
	"Answer whether the receiver is a conflict item."

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>model: anObject [
	"Set the model."

	model := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>operation [
	"Answer the underlying operation."

	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangeWrapper>>preferredColor [

	| op |
	op := self operation.
	op ifNil: [ ^ nil ].
	(op isConflict and: [ op isResolved not ] ) ifTrue: [  ^ Color red ].
	op remoteChosen ifFalse: [ ^ Color gray ].
	^ nil "use default color "
]
