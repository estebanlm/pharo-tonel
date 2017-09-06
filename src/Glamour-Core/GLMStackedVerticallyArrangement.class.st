"

"
Class {
	#name : #GLMStackedVerticallyArrangement,
	#superclass : #GLMCompositeArrangement,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMStackedVerticallyArrangement>>renderGlamorouslyOn: aRenderer [
	^ aRenderer renderStackedVerticallyCompositePresentation: self composite
]
