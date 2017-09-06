Extension {
	#name : #LazyListMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
LazyListMorph>>themeChanged [
	self color: self theme textColor.
	super themeChanged
]
