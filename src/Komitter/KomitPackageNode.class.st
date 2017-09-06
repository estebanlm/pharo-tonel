"
I am a node in the Komit tree representing a package
"
Class {
	#name : #KomitPackageNode,
	#superclass : #KomitNode,
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>getClasses [

	^ self content classes
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>icon [
	^ self iconNamed: #dirtyPackageIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>initialize [
	super initialize.
	self icon: (self iconNamed: #dirtyPackageIcon).
	self
		whenSelectedChanged: [ :aBoolean | 
			self
				ifNotSilentDo: [ aBoolean
						ifTrue: [ self selectAllChildren ]
						ifFalse: [ self unselectAllChildren ] ] ].
	self
		whenContentChanged: [ :c | 
			| childrenNode |
			childrenNode := self getClasses
				collect: [ :each | 
					KomitClassNode new
						content: each;
						yourself ].
			self children: [ childrenNode ] ].
	self hasChildren: [ self isEmpty not ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>isEmpty [

	^ self content patch operations isEmpty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>label [

	^ self content package name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackageNode>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self content package name printOn: aStream.
	aStream << ' ]'.
]
