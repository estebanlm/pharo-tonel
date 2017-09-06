"

"
Class {
	#name : #GLMMorphicRubricHighlightedTextRenderer,
	#superclass : #GLMMorphicRubricTextRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRubricHighlightedTextRenderer>>morph [
	| morph |
	
	morph := super morph.
	morph editingMode: textModel glamourPresentation editingMode.
	morph textFont: textModel glamourPresentation morphicFont.
	"Changing the editing mode makes the editor dirty."
	morph hasUnacceptedEdits: false.
	^ morph
		
]
