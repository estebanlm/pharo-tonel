"
I am a variable node for representing a  temporary  variable stored in a  Context object that has a name attached. This includes  local variables and method parameters.
"
Class {
	#name : #GTInspectorContextNamedTempNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'tempName',
		'tempIndex',
		'tag'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 3/4/2017 14:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode class>>hostObject: aContext tempName: aString tempIndex: anInteger [
	^ (self hostObject: aContext) 
		tempName: aString;
		tempIndex: anInteger;
		variableTag: ((aContext method argumentNames includes: aString)
			ifTrue: [ 'parameter' ]
			ifFalse: [ 'temp' ])
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>errorMessage [
	^ 'error obtaining field value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>key [
	^ self tempName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>label [
	^ '[' , self key , ']'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>rawValue [
	^ self hostObject debuggerMap namedTempAt: tempIndex in: self hostObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>tempIndex [
	^ tempIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>tempIndex: anObject [
	tempIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>tempName [
	^ tempName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>tempName: aString [
	tempName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>variableTag [
	^ tag ifNil: [ 'temp' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorContextNamedTempNode>>variableTag: aTag [
	tag := aTag
]
