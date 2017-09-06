Extension {
	#name : #Clipboard
}

{
	#category : #'*GT-SpotterExtensions-Core-private',
	#timestamp : ' 8/31/2017 05:26:36'
}
Clipboard>>recentItems [
	recent isEmptyOrNil ifTrue: [ ^ #() ].
	^ recent allButFirst reject: [ :each | 
		each isEmptyOrNil 
			or: [ each asString trimBoth isEmptyOrNil ] ]
]
