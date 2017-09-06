"
I define a default null suggestion context that provides no suggestions
"
Class {
	#name : #SugsNullContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'GuillermoPolito 2/26/2016 15:41'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNullContext>>selectedClass [
	^ nil
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNullContext>>selectedMethod [
	
	^ nil
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsNullContext>>sourceTextArea [
	^ nil
]
