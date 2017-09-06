"
I am the state of a selected tab
"
Class {
	#name : #TabSelected,
	#superclass : #TabEnabled,
	#category : #Morphic-Widgets-Tabs-States,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabSelected>>backgroundColor [
	^ Smalltalk ui theme selectionColor
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabSelected>>isSelectedMatchingTheState: aBoolean [

	^ aBoolean
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabSelected>>newStateForSelected: aBoolean [

	^ TabEnabled tab: self tab
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabSelected>>selected [

	^ true
]
