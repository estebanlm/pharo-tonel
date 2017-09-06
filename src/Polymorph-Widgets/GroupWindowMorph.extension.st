Extension {
	#name : #GroupWindowMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
GroupWindowMorph>>themeChanged [
	self color: self defaultColor.
	super themeChanged
]
