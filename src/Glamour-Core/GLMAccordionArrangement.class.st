"

"
Class {
	#name : #GLMAccordionArrangement,
	#superclass : #GLMCompositeArrangement,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAccordionArrangement>>renderGlamorouslyOn: aRenderer [
	^ aRenderer renderAccordionCompositePresentation: self composite
]
