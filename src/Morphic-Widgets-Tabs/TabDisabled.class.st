"
I am the state corresponding to a tab being disabled.
"
Class {
	#name : #TabDisabled,
	#superclass : #TabState,
	#category : #Morphic-Widgets-Tabs-States,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabDisabled>>backgroundColor [
	^ Smalltalk ui theme disabledColor
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabDisabled>>isEnabledMatchingTheState: aBoolean [

	^ aBoolean not
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabDisabled>>isSelectedMatchingTheState: aBoolean [

	^ aBoolean not
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabDisabled>>newStateForEnabled: aBoolean [

	^ TabEnabled tab: self tab
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabDisabled>>newStateForSelected: aBoolean [
	"An disabled tab can not be selected"
	
	^ self
]
