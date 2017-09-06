"

"
Class {
	#name : #PSMCPatchOperationWrapper,
	#superclass : #PSMCChangeWrapper,
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>asString [
	"Answer the method name."
	
	^self item definition summary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>chooseLocal [
	"Choose the local version."

	self operation chooseLocal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>chooseRemote [
	"Choose the remote version."

	self operation chooseRemote
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>clearChoice [
	"Choose neither version (be in conflict)."

	self operation clearChoice
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>icon [
	"Answer a form with an icon to represent the receiver"

	self item localChosen
		ifTrue: [ ^ self iconNamed: #changeBlockIcon ].
	^ super icon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>isConflict [
	"Answer whether the receiver is a conflict item."

	^ self operation isConflict
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>localChosen [
	"Answer whether the local version is chosen."

	^self operation localChosen
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>operation [
	"Answer the pacth operation for the receiver or nil if none."

	^self item
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchOperationWrapper>>remoteChosen [
	"Answer whether the remote version is chosen."

	^self operation remoteChosen
]
