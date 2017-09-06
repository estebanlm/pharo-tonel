"
I'm in charge to style an ast when there is a message send of #flag:.
This is used to tag methods for TODOs, having many of these is a bad
sign...

	self flag: #Bob
"
Class {
	#name : #FlagIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'MarcusDenker 6/29/2016 14:35'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
FlagIconStyler>>highlightColor [
	^(Color yellow alpha: 0.3)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
FlagIconStyler>>iconFor: aNode [
	^ self iconNamed: #flag.
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
FlagIconStyler>>iconLabel: aNode [
	^''
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FlagIconStyler>>shouldStyleNode: aNode [
	^aNode isMessage and: [aNode selector = #flag:]
]
