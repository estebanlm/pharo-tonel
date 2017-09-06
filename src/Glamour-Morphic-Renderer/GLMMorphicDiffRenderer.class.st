"

"
Class {
	#name : #GLMMorphicDiffRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicDiffRenderer>>render: aPresentation [
	| textMorph |
	textMorph := (DiffMorph
		from: aPresentation displayValue first
		to: aPresentation displayValue last
		contextClass: aPresentation contextClassValue)
"			onKeyStrokeSend: #keystroke:from: to: textModel;
"			layoutFrame: (LayoutFrame identity);
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
"	self installActionsOnUI: textModel fromPresentation: aTextPresentation.
	aTextPresentation selectedTextBlock: [ textMorph textMorph editor selection ].
	aTextPresentation textBlock: [ textMorph textMorph editor text ].
"	^textMorph
]
