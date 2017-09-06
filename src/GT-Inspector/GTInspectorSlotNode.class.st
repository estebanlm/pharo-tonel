"
I am a variable node for representing the slots of an object. I used the name of a slot as a key. I extract the value from the host object every time #rawValue is called.
"
Class {
	#name : #GTInspectorSlotNode,
	#superclass : #GTInspectorVariableNode,
	#instVars : [
		'slot'
	],
	#category : #GT-Inspector,
	#timestamp : 'AndreiChis 2/27/2017 11:20'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode class>>hostObject: anObject slot: aSlot [
	^ (self hostObject: anObject)
		slot: aSlot;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>browsingActionsForNode [

	^ {
			GLMGenericAction new 
				action: [ self systemNavigation browseAllAccessesTo: self label from: self hostObject class ]; 
				title: 'List methods using this variable'.
			GLMGenericAction new 
				action: [ self systemNavigation browseAllStoresInto: self label from: self hostObject class ]; 
				title: 'List methods storing into this variable'.		
		}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>errorMessage [
	^ 'error obtaining attribute value'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>inspectorActionsForNode [
	"Return a collection of available inspector actions associated with a variable node"
	<return: #Collection of: #GLMAction>

	^ self browsingActionsForNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>key [
	^ self slot name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>rawValue [
	^ self hostObject readSlot: slot
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>save: anObject [
	self hostObject writeSlot: self slot value: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>slot [
	^ slot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>slot: aSlot [

	self
		assert: [ aSlot isNotNil ]
		description: [ 'Slot can not be nil' ].

	slot := aSlot.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspectorSlotNode>>variableTag [
	^ 'attribute'
]
