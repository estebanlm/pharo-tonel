"
A SugsMorphicTextAdapterContext is a context that know how to work with the MorphicTextAdapter.

"
Class {
	#name : #SugsMorphicTextAdapterContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>code [
	^ model getText .
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>contentSelection [
	^model widget textArea selection
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>selectedClass [
	^model behavior
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>selectedInterval [
	^ model selectionInterval
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>selectedMethod [
	^model model owner selectedMessage
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>selectionInterval [
	^self selectedInterval 
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsMorphicTextAdapterContext>>sourceTextArea [
	^model widget  
]
