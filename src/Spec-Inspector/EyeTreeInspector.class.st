"
I am a tree inspector that takes the EyeElements from the default inspectors and displays them in a tree.
"
Class {
	#name : #EyeTreeInspector,
	#superclass : #EyeAbstractInspector,
	#instVars : [
		'tree'
	],
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector class>>inspectorSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: #tree bottom: 0.3;
		addHSplitter;
		newRow: #text top: 0.7;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector class>>label [
	^ 'Tree Inspector'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>childrenFor: anEyeElement [
	^ self childrenForObject: anEyeElement value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>childrenForObject: anObject [
	^ (EyeInspector inspector: anObject) elements 
			select: [ :element | element shouldShowInTree ]
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>elementChanged [
	self text doItReceiver: self selectedElement value.
	self text widget
		ifNotNil: [ :w | 
			w widget editingMode
				classOrMetaClass: self selectedElement value class ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>expandRoots [
	self tree expandRoots
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>iconFor: anEyeElement [
	anEyeElement withErrorsDo: [ :error |
		^ self iconFor: anEyeElement error: error ].
		
	^ [ anEyeElement icon ]
		on: Error do: [ :error |
			self iconFor: anEyeElement error: error ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>iconFor: anEyeElement error: error [
	^ self iconNamed: #smallWarningIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>initializeShortcuts [
	"initialize the inspector' shortcuts with the dictionary defined in self shortCuts"
	
	self shortCuts keysAndValuesDo: [ :key :value |
		self tree bindKeyCombination: key toAction: value ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>inspectionMenu: aMenu [
	self hasSelectedObject ifFalse: [ ^ aMenu ].
	self inspectionSubMenu: aMenu.
	self selectedElement inspectionMenu: aMenu.
	^aMenu.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>labelFor: anEyeElement [
	"Take care of errors that might occur during label access"
	^ [ anEyeElement longLabel ]
		on: Error do: [ :error |
			anEyeElement label, ': ', (self labelFor: anEyeElement error: error) ]
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>objectChanged [
	self text doItReceiver: self object.
	self text widget
		ifNotNil: [ :w | w editingMode classOrMetaClass: self object class ].
	self tree
		roots: self roots;
		expandRoots
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>ownerChanged [
	super ownerChanged.
	self expandRoots.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>roots [
	^ { RootEyeElement host: self object }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>selectedElement [
	self tree hasSelectedItem
		ifFalse: [ ^ nil ].
	^ self tree selectedItem content
]

{
	#category : #'smartSuggestions - support',
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>selectedMessage [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>selectedObject [
	^self selectedElement value
]

{
	#category : #private-focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>takeKeyboardFocus [
	^ self tree takeKeyboardFocus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeTreeInspector>>tree [
	^ tree
		ifNil: [ tree := self instantiate: TreeModel.
			tree whenBuiltDo: [ self initializeShortcuts ].
			tree
				whenSelectedItemChanged: [ :item | item ifNotNil: [ self elementChanged ] ];
				childrenBlock: [ :anObject | self childrenFor: anObject ];
				iconBlock: [ :treeNode | self iconFor: treeNode ];
				displayBlock: [ :anObject | self labelFor: anObject ];
				menu: [ :menu | self inspectionMenu: menu ];
				doubleClick: [ self diveInto: self selectedObject ];
				yourself ]
]
