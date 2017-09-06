"
I am the abstract superclass for all kind of inspectors
"
Class {
	#name : #EyeAbstractInspector,
	#superclass : #ComposableModel,
	#traits : 'TInspectorActions',
	#classTraits : 'TInspectorActions classTrait',
	#instVars : [
		'object',
		'customMenuActions',
		'text'
	],
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector class>>debuggerSpec [
	<spec:#default>
	^ self inspectorSpec
]

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector class>>inspectorSpec [
	<spec>
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector class>>label [
	"Override to return a proper label displayd in the inspector choice"
	^ self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector class>>taskbarIconName [
	^#smallInspectItIcon
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>close [
	"Override in sublcasses for special actions"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>customMenuActions [
	^ customMenuActions ifNil: [ customMenuActions := [  ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>customMenuActions: anObject [
	customMenuActions := anObject
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>diveInto: anObject [
	self owner ifNotNil: [ :navigator | 
		(navigator respondsTo: #diveInto:)
			ifTrue: [ ^ navigator diveInto: anObject ] ].
		
	self inspectInNewWindow: anObject.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>diveIntoSelectedObject [
	self selectedObjectDo: [ :anObject | self diveInto: anObject ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>hasSelectedObject [
	^ self selectedElement isNotNil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>initialize [

	"The inspected object will be stored in the valueObject object to be able to use WhenObjectChanged:"
	
	object := nil asValueHolder.
	super initialize.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>initializePresenter [
	object whenChangedDo: [ self objectChanged ].
	self text
		whenBuiltDo: [ :w | w widget editingMode classOrMetaClass: self object class ].
	self initializeShortcuts
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>initializeShortcuts [
	"override to add custom shortcuts to your model"
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>initializeWidgets [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>inspect: anObject  [
	self object: anObject.
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>inspectionMenu: aMenu [
	| menuModel |
	self hasSelectedObject ifFalse: [ ^ aMenu ].
	menuModel := MenuModel new.
	self inspectionSubMenu: menuModel.
	self selectedElement inspectionMenu: menuModel.
	aMenu addAllMorphs: (menuModel buildWithSpec: #popup) items.
	^aMenu
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>inspectionSubMenu: aMenu [

	aMenu addGroup: [:aGroup |
		aGroup addItem: [ :item |
			item
				name: 'Inspect' translated;
				action: [ self inspectSelectedObjectInNewWindow ];
				shortcut: $i meta ].
		aGroup addItem: [ :item |
			item
				name: 'Explore' translated;
				action: [ self exploreSelectedObject ];
				shortcut: $i meta shift ].

	self customMenuActions cull: aMenu cull: aGroup.
			
	]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>labelFor: anEyeElement error: error [
	^ 'Error while accessing label of ', anEyeElement accessorCode printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>object [

	^ object value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>object: anObject [

	object value: anObject
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>objectChanged [
	"triggered when the inspected object is changed"
	self subclassResponsibility
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>ownerChanged [
	self
		customMenuActions: self owner customMenuActions;
		takeKeyboardFocus
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>refreshSubMenu: aMenu [
	"Add a refresh button in the inspector. Not used anymore since there is this loop in initializeInspectorLoop."

	aMenu 
		add: 'Refresh Inspector'
		target: self
		selector: #refresh.	
	aMenu addLine.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>selectedElement [
	"return the currently selected object wrapper / eye-element"
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>selectedElementDo: aBlock [
	self selectedElement ifNotNil: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>selectedObject [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>selectedObjectDo: aBlock [
	self selectedElement ifNotNil: [ :element |
		aBlock value: element value ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>shortCuts [
	"Answers a dictionary of the shortcuts usable in EyeInspector"

	|shortCuts|

	shortCuts := Dictionary new.
	
	shortCuts at: $d meta put: [ self diveIntoSelectedObject ].
	
	shortCuts at: $i meta put: [ self inspectSelectedObjectInNewWindow ].
	shortCuts at: $i meta shift put: [ self exploreSelectedObject ].
	
	shortCuts at: $b meta put: [ self browseSelectedObject ].
	shortCuts at: $h meta put: [ self browseSelectedObjectClassHierarchy ].
	
	^shortCuts
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>text [
	^ text ifNil: [ 
		text := self newCode.
		text aboutToStyle: true. ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>title [
	^ self object class printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeAbstractInspector>>variants [
	| variants defaultInspectorClass |
	
	variants := OrderedCollection new.
	defaultInspectorClass := self object class inspectorClass.
	
	variants add: defaultInspectorClass. 
	"We only need the basic inspector if we modify something"
	defaultInspectorClass = Object inspectorClass
		ifFalse: [  variants add: EyeBasicInspector ].
	variants add: EyeTreeInspector.
	variants addAll: self object class additionalInspectorClasses. 
	^ variants
]
