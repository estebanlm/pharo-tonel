"
Abstract step in a wizard

Instance Variables
	input:		<Object>
	name:		<Object>
	numberOfDisplay:		<Object>
	presentationBlock:		<Object>
	previousStep:		<Object>

input
	- xxxxx

name
	- xxxxx

numberOfDisplay
	- xxxxx

presentationBlock
	- xxxxx

previousStep
	- xxxxx

"
Class {
	#name : #GLMAbstractWizardStep,
	#superclass : #Object,
	#instVars : [
		'name',
		'presentationBlock',
		'previousStep',
		'numberOfDisplay',
		'input'
	],
	#category : #Glamour-Browsers-Wizards,
	#timestamp : 'TorstenBergmann 3/10/2015 22:00'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>atBeginning  [

	^ self numberOfDisplay = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>atEnd [

	^ self size = self numberOfDisplay 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>decrementNumberOfDisplay  [

	self numberOfDisplay: self numberOfDisplay - 1
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>from: aSymbol [

	self previousStep: aSymbol  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>incrementNumberOfDisplay [

	self numberOfDisplay: self numberOfDisplay + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>input [

	^ input 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>input: anObject [

	input := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>name [

	^ name ifNil: [name := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>name: aSymbolOrABlock [

	name := aSymbolOrABlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>numberOfDisplay [
	
	^ numberOfDisplay ifNil: [numberOfDisplay := 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>numberOfDisplay: aNumber [
	
	numberOfDisplay := aNumber
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>overBeginning  [

	^ self numberOfDisplay < 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>overEnd [

	^ self size < self numberOfDisplay 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>presentationBlock [

	^ presentationBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>presentationBlock: aBlock [

	presentationBlock :=  aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>previousStep [

	^ previousStep ifNil: [previousStep := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>previousStep: aSymbol [

	self previousStep add: aSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>show: aBlock [

	self presentationBlock: aBlock  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAbstractWizardStep>>size [

	^ self subclassResponsibility 
]
