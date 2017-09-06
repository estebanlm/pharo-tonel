"
I am a node in the Komit tree representing a class
"
Class {
	#name : #KomitClassNode,
	#superclass : #KomitNode,
	#classInstVars : [
		'deletedClassIcon',
		'modifiedClassIcon',
		'addedClassIcon'
	],
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode class>>addedClassIcon [
	^ addedClassIcon
		ifNil: [ addedClassIcon := (self defaultClassIcon asFormOfDepth: 32)
				mergeBottomRightWith: (self iconNamed: #overlayAdd) ]
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode class>>defaultClassIcon [
	^ self iconNamed: #classIcon
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode class>>deletedClassIcon [
	^ deletedClassIcon
		ifNil: [ deletedClassIcon := (self defaultClassIcon asFormOfDepth: 32)
				mergeBottomRightWith: (self iconNamed: #overlayRemove) ]
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode class>>modifiedClassIcon [
	^ modifiedClassIcon
		ifNil: [ modifiedClassIcon := (self defaultClassIcon asFormOfDepth: 32)
				mergeBottomRightWith: (self iconNamed: #overlayModification) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>getDefinitions [

	^ self content definitions
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>getMethods [

	^ self content methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>icon [
	
	self content added ifTrue: [ ^ self class addedClassIcon ].
	self content modified ifTrue: [ ^ self class modifiedClassIcon ].
	self content removed ifTrue: [ ^ self class deletedClassIcon ].
	
	^ self class defaultClassIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>initialize	 [
	super initialize.
	
	self whenSelectedChanged: [ :aBoolean |
		self parentNode ifNotNil: [ :parent | parent checkChildren ].
		self ifNotSilentDo: [
			aBoolean
				ifTrue: [ self selectAllChildren ]
				ifFalse: [ self unselectAllChildren ] ] ].
		
	self whenContentChanged: [ :c || childrenNode |
		childrenNode := self getDefinitions 
			collect: [ :each | KomitDefinitionNode new
				content: each;
				yourself ].
			childrenNode addAll: (self getMethods
				collect: [ :each | KomitMethodNode new
					content: each;
					yourself ]).
		self children: [ childrenNode ] ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>label [

	^ self content trackedClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClassNode>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self content trackedClass printOn: aStream.
	aStream << ' ]'.
]
