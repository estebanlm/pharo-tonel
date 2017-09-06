"
I model the  `self` variable. This the value of this variable is always the host object. 
"
Class {
	#name : #GTInspectorSelfNode,
	#superclass : #GTInspectorVariableNode,
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/20/2017 11:39'
}

{
	#category : #composition,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSelfNode>>childrenNodesFor: aVariablesBrowser [
	"Self node does not have any subvariables, just return empty collection"
	<return: #Collection of: #GTInspectorVariableNode>

	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSelfNode>>key [
	^ 'self'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSelfNode>>rawValue [
	^ self hostObject
]
