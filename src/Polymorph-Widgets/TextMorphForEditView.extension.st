Extension {
	#name : #TextMorphForEditView
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
TextMorphForEditView>>themeChanged [
	self color: self defaultColor.
	super themeChanged
]
