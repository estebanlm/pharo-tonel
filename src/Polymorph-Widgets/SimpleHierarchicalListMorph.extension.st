Extension {
	#name : #SimpleHierarchicalListMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
SimpleHierarchicalListMorph>>themeChanged [
	"Update the selection colour."

	self selectionColor: self theme selectionColor.
	self color: self defaultColor.
	super themeChanged
]
