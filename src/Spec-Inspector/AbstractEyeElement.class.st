"
I represent an abstract inspection element. In an EyeInspector, a eye element corresponds to a wrapper around a field element.

Public API :
label: display on left list panel of the eye inspector
description: printed on the right panel of the eye inspector
host: object inspected in the eye inspector 
value: object represented by this eye element 
"
Class {
	#name : #AbstractEyeElement,
	#superclass : #Model,
	#traits : 'TInspectorActions',
	#classTraits : 'TInspectorActions classTrait',
	#instVars : [
		'host'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement class>>host: anObject  [
	^ self new
		host: anObject;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>= anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ host == anObject host
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>accessorCode [
	"Answers a code string to access the value from the inspector"
	self subclassResponsibility
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>browseSubMenu: aMenu [
	
	aMenu addGroup: [ :aGroup |
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Browse Full';
				action: [ self browseSelectedObject ];
				shortcut: PharoShortcuts current browseShortcut  ].
			
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Browse Class';
				action: [ self browseSelectedObjectClass ] ].
			
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Browse Hierarchy';
				action: [ self browseSelectedObjectClassHierarchy ];
				shortcut: $h meta ] ]
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>browseValue [
	^ self value browse
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>browseValueClass [
	"Open an class browser on the selectObject (class side)"
	
	^ self valueClass browse
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>browseValueClassHierarchy [
	"Create and schedule a class list browser on the receiver's hierarchy."

	^ self valueClass browseHierarchy
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>copyAccessorCode [
	"Copy the name of the current variable, so the user can paste it into the 
	window below and work with is."

	Clipboard clipboardText: self accessorCode asText
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>customSubMenu: aMenu [
	"Subclasse may add more menu items here"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>description [
	^ self value printStringLimitedTo: 2000
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>endSubMenu: aMenu  [
	
	aMenu addGroup: [ :aGroup |
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Copy Name';
				action: [ self copyAccessorCode ];
				shortcut: $c meta ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>errorPropertySelectors [
	"Return a collection of selectors on this eye-element that are checked against errors.
	See #withErrorsDo: and #errorSubMenu:"
	^ #(icon label longLabel description)
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>errorSubMenu: aMenu [
	"Add debug menu entries for the failing #errorPropertySelectors of this eye element"
	
	self hasError 
		ifFalse: [ ^ self ].
		
	aMenu addGroup: [ :aGroup |
		
		self withErrorsDo: [ :accessError :itemSelector |
			aGroup addItem: [ :anItem |
				anItem 
					name: 'Debug Accessing ', itemSelector printString, ' of ', self accessorCode ;
					icon: (self iconNamed: #smallWarningIcon);
					action: [ [ self perform: itemSelector] fork ]]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>errorWhileAccessing: selector do: aBlock [
	[ self perform: selector ]
		on: Error do: [ :error |  
			aBlock cull: error cull: selector ].
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>explorePointers [
	^ Smalltalk tools pointerExplorer openStrongOn: self value
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>exploreSubMenu: aMenu [

	aMenu addGroup: [ :aGroup |
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Explore Pointers';
				action: [ self explorePointers ] ] ]
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>exploreValue [
	^ self value explore
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>hasError [
	self withErrorsDo: [ ^ true ].
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>hasSelectedObject [
	^ true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>hash [
	^ host hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>host [
	"Answers the object currently inspected by the outer inspector.
	See #value for the object represented by this EyeElement."
	^ host
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>host: anObject [
	host := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>hostClass [
	^ host class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>icon [
	^ (self value iconOrThumbnailOfSize: 16)
		ifNil: [ self value class systemIcon ]
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>inspectValue [
	"Bring up a non-special inspector"
	^ self value inspect
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>inspectionMenu: aMenu [
	"specific menu for the current element"
		
	self 
		exploreSubMenu: aMenu;
		browseSubMenu: aMenu;
		customSubMenu: aMenu;
		endSubMenu: aMenu;
		errorSubMenu: aMenu.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>label [
	"Answers the label associated with this EyeElement"
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>longLabel [
	"This is used by EyeTreeInspector"
	
	| description |
	description := self description.
	description size > 150
		ifTrue: [ description := description first: 150 ].
	^ self label 
		ifNotNil: [ :label | label , ': ' , description ] 
		ifNil: [ description ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>mainInspectSubMenu: aMenu  [
	aMenu 
		add: 'Inspect (i)' 
		target: self
		selector: #inspectSelectedObjectInNewWindow.
				
	aMenu
		add: 'Explore (I)' 
		target: self
		selector: #exploreSelectedObject.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>printOn: aStream [
	aStream
		print: self label;
		<< '->';
		<< (self value printStringLimitedTo: 50)
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>save: aValue [
	"Subclasse may override this"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>selectedObject [
	^ self value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>selectedObjectDo: aBlock [
	aBlock value: self selectedObject 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>shouldShowInTree [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>value [
	"Answers the object associated with this EyeElement."
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>valueClass [
	^ self value class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractEyeElement>>withErrorsDo: aBlock [
	self errorPropertySelectors
		do: [ :selector | 
			self errorWhileAccessing: selector do: aBlock ].
]
