"
I encapsulate a condition that can be verified against a Context.

To add concrete conditions a subclass should be create that overrides the method #matchContext:

Public API and Key Messages
- #matches: 
- #hasMatched
- #result

Instance Variables
result:		the last value returned by matches:


"
Class {
	#name : #GTDebuggerContextPredicate,
	#superclass : #Object,
	#instVars : [
		'result'
	],
	#category : #GT-Debugger-Model,
	#timestamp : 'AndreiChis 12/30/2015 10:17'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerContextPredicate>>hasMatched [

	^ self result ifNil: [ ^ false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerContextPredicate>>matchContext: aContext [
	"Subclasses should implement this method to add concrete conditions. "
	
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerContextPredicate>>matches: aContext [
	"Return true if the given context satisfies the condition contained by this predicate,
	or false otherwise."
	
	^ result := self matchContext: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebuggerContextPredicate>>result [
	"The value returned by the most recent call to matches: "
	
	^ result
]
