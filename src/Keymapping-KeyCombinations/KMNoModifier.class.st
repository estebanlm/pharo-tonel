"
I represent the absense of a key modifier. I fulfill the role of a null pattern, having as default no printing and not matching.
"
Class {
	#name : #KMNoModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : 'GuillermoPolito 8/10/2014 13:24'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoModifier>>initialize [
	super initialize.
	identifier := #''.
	name := ''.
]
