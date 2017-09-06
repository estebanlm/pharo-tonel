"
I know how to find senders from a message
"
Class {
	#name : #SugsFindSenders,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFindSenders>>execute [
	SystemNavigation default
				browseSendersOf: context selectedMessageName
				name: 'Senders of ' translated , context selectedMessageName
				autoSelect: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFindSenders>>label [
	^ 'Senders' translated
]
