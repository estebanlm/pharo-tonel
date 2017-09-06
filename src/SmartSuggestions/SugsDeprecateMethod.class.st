"
I know how to deprecate method.

"
Class {
	#name : #SugsDeprecateMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarkRizun 7/22/2014 14:33'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDeprecateMethod>>execute [
	(NautilusRefactoring model: context) deprecateMethodFor: context selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDeprecateMethod>>label [
	^ 'Deprecate' translated
]
