"
I model an attribute of an object in the GTInspector. I am used in the Raw presentation of an Object. My main responsibility is to associate a variable name of a host object with its value. 

Public API and Key Messages

- hostObject return the object (host) holding the  attribute that I represent;
- label return a string label of the attribute, which may be an instance variable name or a dynamically generated name for dynamic attributes;
- value return the value  of the attribute; catches any errors and returns nil;
- rawValue return the value of the attribute without any catch for errors;
- key return an object used as unique key to identify an attribute, it may be an integer for indexed variables or a string for dynamic ones.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	hostObject:		<Object>
"
Class {
	#name : #GTInspectorVariableNode,
	#superclass : #Object,
	#instVars : [
		'hostObject'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/27/2017 11:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode class>>hostObject: anObject  [
	^ self new
		hostObject: anObject;
		yourself
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>childrenNodesFor: aVariablesBrowser [
	"Return a collection of subvariable nodes to be displayed in a given raw variables browser.
	Note: by default we dispatch to browser and let it perform collection"
	<return: #Collection of: #GTInspectorVariableNode>

	^ aVariablesBrowser childrenVariableNodesForNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>errorMessage [
	^ 'error obtaining value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>hostObject [
	^ hostObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>hostObject: anObject [

	"
	Allow nil objects for the moment. Normally the inspector should be able to inspect nil.
	self
		assert: [ anObject isNotNil ]
		description: [ 'Host object must not be nil' ]."

	self
		assert: [ hostObject isNil ]
		description: [ 'Host can be assigned only once' ].

	hostObject := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>inspectorActionsForNode [
	"Return a collection of available inspector actions associated with a variable node"
	<return: #Collection of: #GLMAction>

	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>key [
	"Answer the key of this object variable (slot, indexed attribute, computed value)."
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>label [
	"Answer the label of this object variable (slot, indexed attribute, computed value)."
	^ self key asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>rawValue [
	"Answer the object value of this object variable (slot, indexed attribute, computed value)."
	^ self subclassResponsibility
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>save: aValue [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>value [
	"Answer the object value of this object variable (slot, indexed attribute, computed value).
	Return nil in case there is an error obtaining the value"
	^ [ self rawValue ] on: Error do: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorVariableNode>>variableTag [
	^ 'implicit'
]
