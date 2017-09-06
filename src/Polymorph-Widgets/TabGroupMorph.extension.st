Extension {
	#name : #TabGroupMorph
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
TabGroupMorph>>themeChanged [
	"Update the corner style."

	self cornerStyle: (self theme tabGroupCornerStyleIn: self window).
	self pageMorphs do: [ :morph | morph themeChanged ].
	super themeChanged
]
