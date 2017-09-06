"
I am a variable node for representing any dynamically computed attribute that should be displayed in the Raw presentation. I should not be used for slots or indexed variables.
"
Class {
	#name : #GTInspectorDynamicNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'label',
		'value',
		'tag'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/20/2017 11:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode class>>hostObject: anObject label: aString value: anotherObject [
	^ (self hostObject: anObject) 
		label: aString;
		rawValue: anotherObject;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>key [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>label: aString [
	label := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>rawValue [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>rawValue: anObject [
	value := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>variableTag [
	^  tag ifNil: [ super variableTag ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorDynamicNode>>variableTag: aTag [
	tag := aTag
]
