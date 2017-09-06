"
A generic step in a wizard

Instance Variables
	numberOfDisplayBlock:		<Object>
	size:		<Object>

numberOfDisplayBlock
	- xxxxx

size
	- xxxxx

"
Class {
	#name : #GLMWizardGenericStep,
	#superclass : #GLMAbstractWizardStep,
	#instVars : [
		'size',
		'numberOfDisplayBlock'
	],
	#category : #Glamour-Browsers-Wizards,
	#timestamp : 'TorstenBergmann 3/10/2015 22:01'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>initialize [

	super initialize.
	size := 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>numberOfDisplay [
	
	self numberOfDisplayBlock isNil 
		ifFalse: [
			^ self numberOfDisplayBlock moValue: self input
			]
		ifTrue: [
			^ super numberOfDisplay
			].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>numberOfDisplayBlock [

	^ numberOfDisplayBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>numberOfDisplayBlock: aBlock [

	"this method allow the user to externally control the progression of this step. In merlin for exemple, it can be usefull to have some 'conditions' to validate before going on. If those conditions are not validated, we do not progress"
	numberOfDisplayBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>size [

	^ size glamourValue: self input
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWizardGenericStep>>size: aNumberOrAblock [

	size := aNumberOrAblock 
]
