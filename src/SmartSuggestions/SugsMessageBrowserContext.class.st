"
I know how to use a Text model that came from a SmalltalkEditor and extract the information needed for the suggestions :)
"
Class {
	#name : #SugsMessageBrowserContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : '<historical>'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMessageBrowserContext>>selectedClass [
	^model selectedBehavior
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMessageBrowserContext>>selectedMethod [
	^model owner selectedMessage.
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMessageBrowserContext>>sourceTextArea [
	^ model widget.
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMessageBrowserContext>>tools [
	^ model systemNavigation
]
