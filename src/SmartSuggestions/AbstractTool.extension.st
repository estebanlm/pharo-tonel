Extension {
	#name : #AbstractTool
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
AbstractTool>>browseAllStoresInto: aVariableName from: aClass  [
	^self systemNavigation browseAllStoresInto: aVariableName from: aClass 
]
