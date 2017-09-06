Extension {
	#name : #MorphTreeColumnButton
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>themeChanged [
	self fillStyle: (self theme morphTreeColumnFillStyleFor: self).
	self borderStyle: (self theme morphTreeColumnBorderStyleFor: self).
	super themeChanged
]
