"
I am an abstract class for tree filters.
My children should propose a filter for tree nodes
"
Class {
	#name : #AbstractTreeFilter,
	#superclass : #Object,
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractTreeFilter>>keepTreeNode: aNode [

	^ false
]
