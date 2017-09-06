Extension {
	#name : #PluggableListMorph
}

{
	#category : #'*FreeType-override',
	#timestamp : ' 8/31/2017 05:26:12'
}
PluggableListMorph>>setListFont [
	"set the font for the list"

	StandardFonts chooseFontWithTitle: 'Choose the font for this list' translated  for: self setSelector: #font:  getSelector: #font

]
