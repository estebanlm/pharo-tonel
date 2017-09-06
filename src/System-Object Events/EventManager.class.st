"
An EventManager is used to registers a 'observer' object's interest in in changes to an 'observed' object.  Then when the observered object is changed,  EventManager broadcasts the an update message to all objects with a registered interest.  Finally, the Event manager can be used to remove an object from the list of observer object.

An interested object is said to be a dependant on the target object.  Registering an interest in an event is called adding a dependant. Deregistering is called removing  a dependant.  The EventManager's action map is a WeakIdentityDictionary that maps events (selectors) to dependants (objects & selectors) in a way that ensures the mapping is to specific objects (hence identity) and in a way that allows the object to be garbage collected if not other used (hence weak.)  EventManager class has ActionMaps which has one actionMap for each object.

Classic uses of an EventManager are to implement the Observer Pattern, see ChangeNotification or the MorphicModle as examples.
"
Class {
	#name : #EventManager,
	#superclass : #Object,
	#instVars : [
		'actionMap'
	],
	#classVars : [
		'ActionMaps'
	],
	#category : #'System-Object Events',
	#timestamp : 'tlk 5/7/2006 20:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>actionMapFor: anObject [

    ^self actionMaps
        at: anObject
        ifAbsent: [self createActionMap]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>actionMaps [

	^ActionMaps ifNil: [ActionMaps := WeakIdentityKeyDictionary new]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>cleanUp: aggressive [
	"Dump all ActionMaps but only when we're aggressively cleaning"

	aggressive ifTrue: [ActionMaps := nil].
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>flushEvents [
	"EventManager flushEvents"
	
	self actionMaps keysAndValuesDo:[:rcvr :evtDict| rcvr ifNotNil:[
		"make sure we don't modify evtDict while enumerating"
		evtDict keysDo: [:evtName| | msgSet |
			msgSet := evtDict at: evtName ifAbsent:[nil].
			(msgSet == nil) ifTrue:[rcvr removeActionsForEvent: evtName]]]].
	EventManager actionMaps finalizeValues. 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>initialize [

	"self initialize."
	
	SessionManager default registerSystemClassNamed: self name
]

{
	#category : #releasing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>releaseActionMapFor: anObject [

	self actionMaps
		removeKey: anObject
		ifAbsent: []
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>shutDown	 [
	self flushEvents.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager class>>updateableActionMapFor: anObject [

    ^self actionMaps
        at: anObject
        ifAbsentPut: [self createActionMap]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>actionMap [
	^ actionMap
		ifNil:  [ self createActionMap ]
		ifNotNil: [ actionMap ]
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>addDependent: anObject [
	"Make the given object one of the receiver's dependents."

	self
		when: self changedEventSelector
		send: self updateEventSelector
		to: anObject.
	^anObject
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>breakDependents [
	"Remove all of the receiver's dependents."

	self removeActionsForEvent: self changedEventSelector
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>changed: aParameter  [
	"Receiver changed. The change is denoted by the argument aParameter. 
	Usually the argument is a Symbol that is part of the dependent's change 
	protocol. Inform all of the dependents."

	self 
		triggerEvent: self changedEventSelector
		with: aParameter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>changedEventSelector [

	^#changed:
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>dependents [

	^(self actionSequenceForEvent: self changedEventSelector) asSet
		collect:
			[:each | each receiver]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>postCopy [

	super postCopy.
	self releaseActionMap.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>releaseActionMap [

    actionMap := nil
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>removeDependent: anObject [
	"Remove the given object as one of the receiver's dependents."

	self 
		removeActionsWithReceiver: anObject
		forEvent: self changedEventSelector.
	^ anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>updateEventSelector [

	^#update:
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
EventManager>>updateableActionMap [
	actionMap 
		ifNil: [ actionMap := self createActionMap ].
	^actionMap 
	
]
