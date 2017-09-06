"
I am an abstract class representing a node in the tree
"
Class {
	#name : #KomitNode,
	#superclass : #TreeNodeModel,
	#instVars : [
		'silent'
	],
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>><= aKomitNode  [

	^ self content <= aKomitNode content
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>= anotherNode [

	^ self species = anotherNode species
		and: [ self content = anotherNode content ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>checkChildren [
	
	self silentWhile: [
		(self children value allSatisfy: [ :e | e selected ])
			ifTrue: [ self selected: true ]
			ifFalse: [ self selected: false ] ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>hash [

	^ self content hash
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>icon [

	self subclassResponsibility
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>ifNotSilentDo: aBlock [

	silent ifFalse: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>initialize [
	silent := false.
	super initialize.
	self hasContentToShow: true.
	self whenSelectedChanged: [ :aBoolean | self content selected: aBoolean ].
	self whenIsExpandedChanged: [ :aBoolean | self content expanded: aBoolean ].
	self
		whenContentChanged:
			[ :c | 
			self silentWhile: [ self selected: c selected ].
			self isExpanded: c expanded ].
	self hasChildren: [ self children value isEmptyOrNil not ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>label [

	self subclassResponsibility
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNode>>silentWhile: aBlock [
	| oldSilent |
	
	oldSilent := silent.
	silent := true.
	aBlock value.
	silent := oldSilent
]
