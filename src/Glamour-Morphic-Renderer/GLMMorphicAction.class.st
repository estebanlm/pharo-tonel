"
A GLMMorphicAction is special GLMAction that is only active when rendering Glamour browsers with Morphic.
"
Class {
	#name : #GLMMorphicAction,
	#superclass : #GLMAction,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicAction>>worksWithMorphic [
	^ true
]
