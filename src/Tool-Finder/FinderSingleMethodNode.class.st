"
A FinderSingleMethodNode is a node used to display a selector implemented only once in the system
"
Class {
	#name : #FinderSingleMethodNode,
	#superclass : #FinderMethodNode,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderSingleMethodNode>>childrenItems [

	^ #()
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderSingleMethodNode>>displayString  [

	^ self itemMethod selector, ' (',self itemMethod methodClass name,')'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderSingleMethodNode>>isSingle [

	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderSingleMethodNode>>itemMethod [
	| itemClass |
	itemClass := (self model resultDictionary at: self item) first.
	^ itemClass >> self item
]
