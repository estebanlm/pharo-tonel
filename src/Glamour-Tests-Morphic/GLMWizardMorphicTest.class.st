"

"
Class {
	#name : #GLMWizardMorphicTest,
	#superclass : #GLMMorphicTest,
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMWizardMorphicTest>>testClose [
	| wizard |
	wizard := GLMWizard new.
	(wizard genericStep: #step) show: [:a | a text ] ; size: 2.
	window := wizard openOn: 123.
	self assert: window owner notNil.
	wizard close.
	self assert: window owner isNil
]
