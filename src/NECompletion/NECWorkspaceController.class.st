"
I'm a specialized controller, that works with Workspaces.
"
Class {
	#name : #NECWorkspaceController,
	#superclass : #NECController,
	#category : #NECompletion-View,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECWorkspaceController>>additionals [
	^ self workspace completionAdditionals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECWorkspaceController>>workspace [
	^model
]
