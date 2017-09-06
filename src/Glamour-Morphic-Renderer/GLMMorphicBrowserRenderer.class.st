"

"
Class {
	#name : #GLMMorphicBrowserRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicBrowserRenderer>>actOnBrowserClosed: ann [
	self renderer window delete
]
