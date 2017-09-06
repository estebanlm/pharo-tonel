"
An item in the group UI
"
Class {
	#name : #ItemNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Nautilus-GroupManagerUI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ItemNode>>icon [
	^ self iconNamed: #packageIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ItemNode>>isGroup [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ItemNode>>rowMorphForColumn: aTreeColumn [

	^ self item ifNotNil: [:i | i printString asMorph] 
]
