"
Your code may be more readable if you use

	#iconName asIcon
	
instead of

	Smalltalk ui icons iconNamed: #iconName
"
Class {
	#name : #IconShortcutRule,
	#superclass : #ReNodeRewriteRule,
	#category : #Polymorph-Widgets-Rules,
	#timestamp : 'YuriyTymchuk 8/29/2016 21:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconShortcutRule>>group [

	^ 'Style'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconShortcutRule>>initialize [
	super initialize.
	self
		replace: 'Smalltalk ui icons iconNamed: `@iconName'
		with: '`@iconName asIcon'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconShortcutRule>>name [

	^ '#iconName asIcon shortcut available'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconShortcutRule>>severity [

	^ #information
]
