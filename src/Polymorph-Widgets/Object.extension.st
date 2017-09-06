Extension {
	#name : #Object
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>iconNamed: aSymbol [
	
	^ Smalltalk ui icons iconNamed: aSymbol
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>okToClose [
	"Sent to models when a window closing.
	Allows this check to be independent of okToChange."
	
	^true
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>systemIcon [
	"dont use this method. It will be deprecated.
	Tools should resolve real icon object based on icon name"
	^ self iconNamed: self systemIconName
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>systemIconName [

	^ #classIcon
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object>>taskbarLabel [
	"Answer the label string for the receiver in a task bar
	or nil for the default."

	^self class taskbarLabel
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
Object class>>taskbarLabel [
	"Answer the label string for the receiver in a task bar
	or nil for the default."

	^nil
]
