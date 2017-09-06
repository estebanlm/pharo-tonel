"
A GTCodeDebugAction encapsulates the logic for accessing the codePresentation from a debugger.

"
Class {
	#name : #GTCodeDebugAction,
	#superclass : #DebugAction,
	#instVars : [
		'codePresentationSelector'
	],
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 1/20/2015 19:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCodeDebugAction>>codePresentation [
	^ self debugger perform: self codePresentationSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCodeDebugAction>>codePresentationSelector [
	^ codePresentationSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCodeDebugAction>>codePresentationSelector: aSelector [
	codePresentationSelector := aSelector
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCodeDebugAction>>initialize [
	super initialize.
	self codePresentationSelector: #codePresentation
]
