Extension {
	#name : #LabelMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
LabelMorph>>themeChanged [
	self color: self defaultColor.
	super themeChanged
]
