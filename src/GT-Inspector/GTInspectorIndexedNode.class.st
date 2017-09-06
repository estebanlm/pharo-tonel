"
I am a variable node for representing the indexed variables of an object. I used the index of a variable as a key. I extract the value from the host object every time #rawValue is called.
"
Class {
	#name : #GTInspectorIndexedNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'index'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/27/2017 11:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode class>>hostObject: anObject index: index [
	^ (self hostObject: anObject)
		index: index;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>errorMessage [
	^ 'error obtaining indexed attribute value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>index: anInteger [
	index := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>key [
	^ self index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>rawValue [
	^ self hostObject basicAt: index
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>save: aValue [
	self hostObject at: self index put: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorIndexedNode>>variableTag [
	^ 'attribute'
]
