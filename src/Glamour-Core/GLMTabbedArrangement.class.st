"

"
Class {
	#name : #GLMTabbedArrangement,
	#superclass : #GLMCompositeArrangement,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabbedArrangement>>renderGlamorouslyOn: aRenderer [
	^ aRenderer renderTabbedCompositePresentation: self composite
]
