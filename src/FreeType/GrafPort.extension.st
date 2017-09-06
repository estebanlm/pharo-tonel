Extension {
	#name : #GrafPort
}

{
	#category : #'*FreeType-addition',
	#timestamp : ' 8/31/2017 05:26:12'
}
GrafPort>>installFreeTypeFont: aFreeTypeFont foregroundColor: foregroundColor backgroundColor: backgroundColor [

	super installFreeTypeFont: aFreeTypeFont foregroundColor: foregroundColor backgroundColor: backgroundColor.
	lastFont := aFreeTypeFont.
	lastFontForegroundColor := foregroundColor.
	lastFontBackgroundColor := backgroundColor.

]
