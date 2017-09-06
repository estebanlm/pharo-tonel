"

"
Class {
	#name : #GLMExpanderMorphicTest,
	#superclass : #GLMMorphicTest,
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMExpanderMorphicTest>>testCreation [
	| browser |
	browser := GLMExpander new.
	browser show: [ :a | a text ].
	window := browser openOn: #(#a #b #c).
	self assert: window submorphs last class equals: GeneralScrollPane.
	self assert: window submorphs last scrollTarget submorphs size equals: 3.
	self assert: window submorphs last scrollTarget submorphs first complexContents class equals: ExpanderMorph
]
