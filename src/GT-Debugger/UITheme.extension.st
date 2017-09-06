Extension {
	#name : #UITheme
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
UITheme>>sameClassContextStyleFor: aContext [

	^ {TextColor blue}
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
UITheme>>samePackageContextStyleFor: aContext [

	^ {TextColor black}
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
UITheme>>styleContext: aContext from: aDebugger. [

	(aDebugger selectedContext == aContext) ifTrue: [ ^ {TextColor color: Smalltalk ui theme textColor}  ].

	(aContext receiver class = aDebugger selectedContext receiver class)
		ifTrue: [ ^ self sameClassContextStyleFor: aContext ].
	(aContext receiver class package = aDebugger selectedContext receiver class package)
		ifTrue: [ ^ self samePackageContextStyleFor: aContext ]. 

	^ self unrelatedContextStyleFor: aContext
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
UITheme>>unrelatedContextStyleFor: aContext [

	^ {TextColor gray}
]
