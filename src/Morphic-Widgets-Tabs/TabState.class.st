"
I represent the current state of a tab.

This class is abstract so have a look at my subclasses to have a better overview.

I have tree responsibilities:
	- influence the rendering (color, border)
	- point out if the state changement asked on my tab is relevant (trying to enable an enabled tab by example)
	- provide the next state for each change (disable, enable, selected)
"
Class {
	#name : #TabState,
	#superclass : #Object,
	#instVars : [
		'tab'
	],
	#category : #Morphic-Widgets-Tabs-States,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState class>>tab: tab [

	^ self new
		tab: tab;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>backgroundColor [
	
	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>buildBorderVertices [
	| borderVertices |
	
	borderVertices := OrderedCollection new.
	borderVertices
		add: tab bottomLeft;
		add: tab topLeft" + (7 @ 0)";
		add: tab topRight" + (-8 @ 0)";
		add: tab bottomRight" + (-1@0)".

	^ borderVertices
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>buildVerticesFrom: borderVertices [

	^ borderVertices
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>enabled [

	^ false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>isEnabledMatchingTheState: aBoolean [

	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>isSelectedMatchingTheState: aBoolean [

	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>newStateForEnabled: aBoolean [

	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>newStateForSelected: aBoolean [

	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>selected [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>tab [
	^ tab
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabState>>tab: anObject [
	
	tab := anObject
]
