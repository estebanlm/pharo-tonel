"

"
Class {
	#name : #EventManagerTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'eventSource',
		'eventListener',
		'succeeded'
	],
	#category : #'Tests-Object Events',
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>addArg1: arg1
addArg2: arg2 [

	eventListener
		add: arg1;
		add: arg2
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>getFalse [

	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>getFalse: anArg [

	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>getTrue [

	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>getTrue: anArg [

	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>heardEvent [

	succeeded := true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>setUp [

	super setUp.
	eventSource := EventManager new.
	eventListener := Bag new.
	succeeded := false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>tearDown [

	eventSource releaseActionMap.
	eventSource := nil.
	eventListener := nil.
	super tearDown.

]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testBlockReceiverNoArgs [
	eventSource when: #anEvent evaluate:[self heardEvent].
	eventSource triggerEvent: #anEvent.
	self should: [succeeded]
]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testBlockReceiverOneArg [
	eventSource when: #anEvent: evaluate:[:arg1| eventListener add: arg1].
	eventSource triggerEvent: #anEvent: with: 9.
	self should: [eventListener includes: 9]
]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testBlockReceiverTwoArgs [
	eventSource when: #anEvent:info: evaluate:[:arg1 :arg2| self addArg1: arg1 addArg2: arg2].
	eventSource triggerEvent: #anEvent:info: withArguments: #( 9 42 ).
	self should: [(eventListener includes: 9) and: [eventListener includes: 42]]
]

{
	#category : #running-copying,
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testCopy [
	"Ensure that the actionMap is zapped when
	you make a copy of anEventManager"

	eventSource when: #blah send: #yourself to: eventListener.
	self assert: eventSource actionMap keys isEmpty not.
	self assert: eventSource copy actionMap keys isEmpty
]

{
	#category : #'running-broadcast query',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testMultipleValueSuppliers [

	eventSource
		when: #needsValue
		send: #getFalse
		to: self.
	eventSource
		when: #needsValue
		send: #getTrue
		to: self.
	succeeded := eventSource triggerEvent: #needsValue.
	self should: [succeeded]
]

{
	#category : #'running-broadcast query',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testMultipleValueSuppliersEventHasArguments [

	eventSource
		when: #needsValue:
		send: #getFalse:
		to: self.
	eventSource
		when: #needsValue:
		send: #getTrue:
		to: self.
	succeeded := eventSource triggerEvent: #needsValue: with: 'kolme'.
	self should: [succeeded]
]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testNoArgumentEvent [

	eventSource when: #anEvent send: #heardEvent to: self.
	eventSource triggerEvent: #anEvent.
	self should: [succeeded]
]

{
	#category : #'running-dependent action supplied arguments',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testNoArgumentEventDependentSuppliedArgument [

	eventSource when: #anEvent send: #add: to: eventListener with: 'boundValue'.
	eventSource triggerEvent: #anEvent.
	self should: [eventListener includes: 'boundValue']
]

{
	#category : #'running-dependent action supplied arguments',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testNoArgumentEventDependentSuppliedArguments [

	eventSource 
		when: #anEvent 
		send: #addArg1:addArg2: 
		to: self 
		withArguments: #('hello' 'world').
	eventSource triggerEvent: #anEvent.
	self should: [(eventListener includes: 'hello') and: [eventListener includes: 'world']]
]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testOneArgumentEvent [

	eventSource when: #anEvent: send: #add: to: eventListener.
	eventSource triggerEvent: #anEvent: with: 9.
	self should: [eventListener includes: 9]
]

{
	#category : #'running-remove actions',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testRemoveActionsForEvent [

	eventSource
		when: #anEvent send: #size to: eventListener;
		when: #anEvent send: #getTrue to: self;
		when: #anEvent: send: #fizzbin to: self.
	eventSource removeActionsForEvent: #anEvent.
	self shouldnt: [eventSource hasActionForEvent: #anEvent]
]

{
	#category : #'running-remove actions',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testRemoveActionsTwiceForEvent [

	eventSource
		when: #anEvent send: #size to: eventListener;
		when: #anEvent send: #getTrue to: self;
		when: #anEvent: send: #fizzbin to: self.
	eventSource removeActionsForEvent: #anEvent.
	self assert: (eventSource hasActionForEvent: #anEvent) not.
	eventSource removeActionsForEvent: #anEvent.
	self assert: (eventSource hasActionForEvent: #anEvent) not.
]

{
	#category : #'running-remove actions',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testRemoveActionsWithReceiver [

	| action |
	eventSource
		when: #anEvent send: #size to: eventListener;
		when: #anEvent send: #getTrue to: self;
		when: #anEvent: send: #fizzbin to: self.
	self assert: (eventSource hasActionsWithReceiver: self).
	eventSource removeActionsWithReceiver: self.
	action := eventSource actionForEvent: #anEvent.
	self assert: (action respondsTo: #receiver).
	self assert: ((action receiver == self) not).
	self assert: ((eventSource hasActionsWithReceiver: self) not)
]

{
	#category : #'running-dependent value',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testReturnValueWithManyListeners [

	| value newListener |
	newListener := 'busybody'.
	eventSource
		when: #needsValue
		send: #yourself
		to: eventListener.
	eventSource
		when: #needsValue
		send: #yourself
		to: newListener.
	value := eventSource triggerEvent: #needsValue.
	self should: [value == newListener]
]

{
	#category : #'running-dependent value',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testReturnValueWithNoListeners [

	| value |
	value := eventSource triggerEvent: #needsValue.
	self should: [value == nil]
]

{
	#category : #'running-dependent value',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testReturnValueWithOneListener [

	| value |
	eventSource
		when: #needsValue
		send: #yourself
		to: eventListener.
	value := eventSource triggerEvent: #needsValue.
	self should: [value == eventListener]
]

{
	#category : #'running-broadcast query',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testSingleValueSupplier [

	eventSource
		when: #needsValue
		send: #getTrue
		to: self.
	succeeded := eventSource triggerEvent: #needsValue.
	self should: [succeeded]
]

{
	#category : #'running-dependent action',
	#timestamp : ' 8/31/2017 05:26:29'
}
EventManagerTest>>testTwoArgumentEvent [

	eventSource when: #anEvent:info: send: #addArg1:addArg2: to: self.
	eventSource triggerEvent: #anEvent:info: withArguments: #( 9 42 ).
	self should: [(eventListener includes: 9) and: [eventListener includes: 42]]
]
