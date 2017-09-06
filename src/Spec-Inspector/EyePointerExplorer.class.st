"
A variant on the TreeInspector that works ""backwards"".

By default it shows both weak and strong references (#openOn:) but I can be configured to omit weak refs with #openStrongOn:

Like the TreeInspector, it shows a tree of objects, but expanding a node won't show the objects which that node references, but rather the objects that reference that node.  Its main use is to track down memory leaks: if you want to know why a particular object is still alive, open a PointerExplorer on it and drill down until you find the root object that's referencing it.  For example, find all the references to the symbol #zot with:

EyePointerExplorer openOn: #zot

For the ""name"" of the object, the PointerExplorer shows each object's identityHash, to allow the user to identify when two similar objects are identical and notice cycles.


"
Class {
	#name : #EyePointerExplorer,
	#superclass : #EyeTreeInspector,
	#instVars : [
		'onlyStrong'
	],
	#category : #Spec-Inspector,
	#timestamp : 'MarcusDenker 8/5/2014 16:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer class>>label [
	^ 'Pointer Explorer'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer class>>openOn: anObject [
	^(self new inspect: anObject) openWithSpec
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer class>>openStrongOn: anObject [
	"only show strong references"
	^(self new 
		onlyStrong;
		inspect: anObject) openWithSpec
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer class>>registerToolsOn: registry [
	"Add ourselves to registry. See [Smalltalk tools class]
	self registerToolsOn: Smalltalk tools
	" 
	registry register: self as: #pointerExplorer

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>childrenForObject: anObject [
	| objects  |
	objects := anObject wrappedObject pointersToExcept: { self. anObject}.
	"filter out all wrappers and (otionally) all those who pointing only weakly to subject"
	objects := objects reject: [ :each | each class =  EyePointerWrapper].
	onlyStrong ifTrue: [objects := objects reject: [ :each | each pointsOnlyWeaklyTo: anObject wrappedObject]]. 
	^ objects collect: [ :each |
		(PointerEyeElement
			host: anObject wrappedObject 
			value: each)]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>initialize [
	super initialize.
	onlyStrong := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>object: anObject [
	Smalltalk garbageCollect.
	super object: (EyePointerWrapper wrap: anObject)
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>objectChanged [
	self text doItReceiver: self object.
	self text widget
		ifNotNil: [ :w | w editingMode classOrMetaClass: self object class ].
	self tree roots: self roots
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>onlyStrong [
	onlyStrong := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>roots [
	^ self childrenForObject: self object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>selectedObjectDo: aBlock [

	self selectedElement ifNotNil: [ :element |
		aBlock value: element value wrappedObject ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>title [
	^ 'Pointers to: ', self object printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>tree [
	^ tree ifNil: [ 
		tree := self instantiate: TreeModel.
		tree whenBuiltDo: [ self initializeShortcuts ].
		tree 
			whenSelectedItemChanged: [ :item | item ifNotNil: [ self text doItReceiver: item value ]];	
			displayBlock:  [ :anObject | self labelFor: anObject ];
			menu:          [ :menu |  self inspectionMenu: menu ];
			hasChildrenBlock: [ :o | true  ];
			childrenBlock: [ :anObject | self childrenFor: anObject ];
			yourself]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyePointerExplorer>>valueClass [
	^ self value wrappedObject class
]
