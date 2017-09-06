"
I am a node in the Komit tree representing a method
"
Class {
	#name : #KomitMethodNode,
	#superclass : #KomitLeaf,
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethodNode>>label [

	^ self content selector
]
