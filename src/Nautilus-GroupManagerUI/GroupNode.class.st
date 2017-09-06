"
A group node in the morph tree
"
Class {
	#name : #GroupNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Nautilus-GroupManagerUI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupNode>>childNodeClassFromItem: anItem [

	^ ItemNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupNode>>childrenItems [

	^ self item elements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupNode>>icon [
	^ self iconNamed: #publishIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupNode>>isGroup [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupNode>>rowMorphForColumn: aTreeColumn [

	^ self item ifNotNil: [:i | i name asMorph] 
]
