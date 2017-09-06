"
I am a general suggestion context for a monticello tools. I give the Suggestion framework information about the selection so it can propose the correct suggestions.
"
Class {
	#name : #SugsMonticelloToolContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'GuillermoPolito 2/10/2016 16:29'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMonticelloToolContext>>selectedMethod [
	
	^ nil
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMonticelloToolContext>>sourceTextArea [
	^ model window submorphs detect: [:ea | ea respondsTo: #getTextSelector ].
]
