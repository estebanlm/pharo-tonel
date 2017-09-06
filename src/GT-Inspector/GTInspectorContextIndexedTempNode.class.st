"
I am a variable node for representing an  indexed variable stored in a  Context object that does not have a name.  These are values that are pushed and popped on the stack when executing message sends. For example, the parameters neede to perform a message send are pushed in a Context object.
"
Class {
	#name : #GTInspectorContextIndexedTempNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'tempIndex'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 3/4/2017 14:01'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode class>>hostObject: aContext tempIndex: anInteger [
	^ (self hostObject: aContext) 
		tempIndex: anInteger;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode>>label [
	^ self tempIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode>>rawValue [
	^ self hostObject at: self tempIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode>>tempIndex [
	^ tempIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode>>tempIndex: anObject [
	tempIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextIndexedTempNode>>variableTag [
	^  'temp' 
]
