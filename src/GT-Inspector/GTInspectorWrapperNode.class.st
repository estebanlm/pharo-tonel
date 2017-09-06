"
I am a node that wraps in the host object another node and delegates all API methods to the wrapped node. I can further provide a different label for the wrapped node.
"
Class {
	#name : #GTInspectorWrapperNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'label'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/27/2017 11:51'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode class>>hostObject: anObject label: aString [
	^ (self hostObject: anObject) 
		label: aString;
		yourself
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>childrenNodesFor: aVariablesBrowser [
	^ self hostObject childrenNodesFor: aVariablesBrowser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>errorMessage [
	^ self hostObject errorMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>inspectorActionsForNode [
	^ self hostObject inspectorActionsForNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>key [
	^ label ifNil: [ self hostObject key ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>label: aString [
	label := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>rawValue [
	^ self hostObject rawValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorWrapperNode>>variableTag [
	^ self hostObject variableTag
]
