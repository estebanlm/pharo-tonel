"
I know how to move a method from instance side to class side and the oposit, depending the method.
"
Class {
	#name : #SugsSwapMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSwapMethod>>execute [
	^(NautilusRefactoring model: context) 
		swapMethodFor: (OrderedCollection with: context selectedMethod).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSwapMethod>>label [
	
	^ context selectedMethod 
		ifNil: ['Swap method' translated] 
		ifNotNil: [context selectedMethod methodClass isMeta ifTrue: ['Move to instance side' translated] ifFalse:['Move to class side' translated]]

]
