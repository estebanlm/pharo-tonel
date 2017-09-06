"
A GLMRenderer is the abstract class for the renderer hierarchy. This should be subclassed for each rendering platform (e.g. Morphic)
"
Class {
	#name : #GLMRenderer,
	#superclass : #Object,
	#category : #Glamour-Core,
	#timestamp : 'tg 9/20/2009 12:43'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMRenderer>>doOpen: aUI  [
	 
	^self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMRenderer>>open: aRenderable  [
	 
	^self doOpen: (self render: aRenderable)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMRenderer>>render: aRenderable  [
	 
	^aRenderable renderGlamorouslyOn: self
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMRenderer>>renderPane: aPane  [
	 
	^nil
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMRenderer>>renderPresentation: aPresentation  [

	^ nil
]
