"

"
Class {
	#name : #KomitLeaf,
	#superclass : #KomitNode,
	#category : #Komitter-UI,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitLeaf>>icon [
	self content added
		ifTrue: [ ^ self iconNamed: #changeAddIcon ].
	self content modified
		ifTrue: [ ^ self iconNamed: #changeUpdateIcon ].
	self content removed
		ifTrue: [ ^ self iconNamed: #changeRemoveIcon ].
	^ nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitLeaf>>initialize [

	super initialize.
	
	self children: [ #() ].
	self whenSelectedChanged: [ :aBoolean | self parentNode ifNotNil: [ :parent | parent checkChildren ] ]
]
