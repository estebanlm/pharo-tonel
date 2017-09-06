"
I decide when the SUnit debugger should be active.
"
Class {
	#name : #GTSUnitActivationPredicate,
	#superclass : #GTDebuggerContextPredicate,
	#category : #GT-SUnitDebugger,
	#timestamp : 'AndreiChis 12/30/2015 10:47'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitActivationPredicate>>matchContext: aContext [
	
	^ aContext method isTestMethod
]
