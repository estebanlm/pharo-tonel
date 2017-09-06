"
I represent a subscription to an event.  I'm kind of an announcement, that's why I will be replaced by them soon :)
"
Class {
	#name : #MorphEventSubscription,
	#superclass : #Object,
	#instVars : [
		'event',
		'selector',
		'recipient',
		'valueParameter'
	],
	#category : #Morphic-Base-Events,
	#timestamp : 'GuillermoPolito 4/22/2012 19:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription class>>on: anEvent send: aSelector to: anObject [
	^self new
		event: anEvent;
		selector: aSelector;
		recipient: anObject;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription class>>on: anEvent send: aMessageSelector to: anObject withValue: aValue [
	^self new
		event: anEvent;
		selector: aMessageSelector;
		recipient: anObject;
		valueParameter: aValue;
		yourself
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>click: anEvent fromMorph: aMorph  [
	^self notify: anEvent from: aMorph
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>doubleClick: anEvent fromMorph: aMorph  [
	^self notify: anEvent from: aMorph
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>doubleClickTimeout: anEvent fromMorph: aMorph  [
	^self notify: anEvent from: aMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>event [

	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>event: anEvent [

	event := anEvent
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>mouseEnter: anEvent fromMorph: aMorph  [
	^self notify: anEvent from: aMorph
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>mouseLeave: anEvent fromMorph: aMorph  [
	^self notify: anEvent from: aMorph
]

{
	#category : #events-triggering,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>notify: anEvent from: sourceMorph [
	| arity |
	recipient ifNil: [^ self].
	arity := selector numArgs.
	arity = 0 ifTrue:
		[^ recipient perform: selector].
	arity = 1 ifTrue:
		[^ recipient perform: selector with: anEvent].
	arity = 2 ifTrue:
		[^ recipient perform: selector with: anEvent with: sourceMorph].
	arity = 3 ifTrue:
		[^ recipient perform: selector with: valueParameter with: anEvent with: sourceMorph].
	self error: 'Event handling selectors must be Symbols and take 0-3 arguments'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>recipient [

	^ recipient
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>recipient: anObject [

	recipient := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>selector [

	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>selector: anObject [

	selector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>valueParameter [

	^ valueParameter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MorphEventSubscription>>valueParameter: anObject [

	valueParameter := anObject
]
