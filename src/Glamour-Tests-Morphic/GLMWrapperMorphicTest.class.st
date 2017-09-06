"

"
Class {
	#name : #GLMWrapperMorphicTest,
	#superclass : #GLMMorphicTest,
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMWrapperMorphicTest>>testSimple [
	| wrapper textMorph |
	wrapper := GLMWrapper new.
	wrapper show: [ :a | a text ].
	window := wrapper openOn: 42.
	textMorph := self findWherePresentationIs: wrapper defaultPane presentations first in: window.
	self assert: textMorph text = '42'
]
