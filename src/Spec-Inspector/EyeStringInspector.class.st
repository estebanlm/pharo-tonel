"
EyeStringInspector is is the EyeInspector for Strings.
Right now, the only difference is that the list of elements for the tree is overridden to be empty.

"
Class {
	#name : #EyeStringInspector,
	#superclass : #EyeCollectionInspector,
	#category : #Spec-Inspector,
	#timestamp : 'SvenVanCaekenberghe 3/14/2014 10:35'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeStringInspector>>elements [
	^ #()
]
