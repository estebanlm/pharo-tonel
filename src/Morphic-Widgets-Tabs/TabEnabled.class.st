"
I am the state of a tab enabled but not yet selected
"
Class {
	#name : #TabEnabled,
	#superclass : #TabState,
	#category : #Morphic-Widgets-Tabs-States,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>backgroundColor [
	^ Smalltalk ui theme darkBaseColor 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>enabled [

	^ true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>isEnabledMatchingTheState: aBoolean [

	^ aBoolean
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>isSelectedMatchingTheState: aBoolean [

	^ aBoolean not
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>newStateForEnabled: aBoolean [
	"aBoolean here must be false"
	self deny: aBoolean.
	
	^ TabDisabled tab: self tab
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabEnabled>>newStateForSelected: aBoolean [
	self assert: aBoolean.
	
	^ TabSelected tab: self tab
]
