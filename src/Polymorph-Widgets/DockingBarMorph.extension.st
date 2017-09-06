Extension {
	#name : #DockingBarMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
DockingBarMorph>>themeChanged [
	self
		color: self theme settings derivedMenuColor;
		borderColor: self theme menuBorderColor.
	super themeChanged
]
