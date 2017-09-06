"
I know how to  extract the information needed for the suggestions from a finder UI object
"
Class {
	#name : #SugsFinderContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'GuillermoPolito 2/18/2016 11:15'
}

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFinderContext>>selectedClass [
	
	^ model selectedClass
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFinderContext>>selectedMethod [
	
	model selectedClass ifNil: [ ^ nil ].
	model selectedMethod ifNil: [ ^ nil ].
	^ model selectedClass >> model selectedMethod
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFinderContext>>sourceTextArea [
	
	^ model sourceTextArea
]
