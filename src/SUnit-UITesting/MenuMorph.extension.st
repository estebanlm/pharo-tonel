Extension {
	#name : #MenuMorph
}

{
	#category : #'*SUnit-UITesting',
	#timestamp : ' 8/31/2017 05:26:20'
}
MenuMorph>>choose: aString  [

	| item |
	item := self itemWithWording: aString.
	item ifNil: [ self error: 'Menu does not have "', aString, '" item' ].
	item simulateClick.
]

{
	#category : #'*SUnit-UITesting',
	#timestamp : ' 8/31/2017 05:26:20'
}
MenuMorph>>itemWithWording: wording [
	"If any of the receiver's items or submenu items have the given wording (case-blind comparison done), then return it, else return nil."
	
	self items do:[:anItem | | found |
		found := anItem itemWithWording: wording.
		found ifNotNil:[^found]].
	^ nil
]
