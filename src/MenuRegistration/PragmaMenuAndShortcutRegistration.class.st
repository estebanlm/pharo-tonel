"
A PragmaMenuAndShortcutRegistration is the list items holder
"
Class {
	#name : #PragmaMenuAndShortcutRegistration,
	#superclass : #Object,
	#instVars : [
		'items',
		'currentRoot',
		'platform',
		'model'
	],
	#category : #MenuRegistration-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration class>>model: aModel [

	^ self new
		model: aModel;
		yourself
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>action: aBlock [

	self currentItem action: aBlock
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>arguments: anArray [

	self currentItem arguments: anArray
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>attachShortcutCategory: aSymbol to: aClass  [

	KMRepository default attachCategoryName: aSymbol to: aClass.
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>category: aByteSymbol [
	
	self currentItem
		category: aByteSymbol
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>category: aByteSymbol default: aKMModifiedShortcut do: aBlockClosure  [
	
	self currentItem
		category: aByteSymbol;
		default: aKMModifiedShortcut;
		action: aBlockClosure 
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>category: aByteSymbol default: aKMModifiedShortcut do: aBlockClosure description: aByteString  [
	
	self currentItem
		category: aByteSymbol;
		default: aKMModifiedShortcut;
		action: aBlockClosure;
		help: aByteString
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>category: aByteSymbol shortcut: aKMModifiedShortcut do: aBlockClosure  [
	
	self currentItem
		category: aByteSymbol;
		default: aKMModifiedShortcut;
		action: aBlockClosure 
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>category: aByteSymbol shortcut: aKMModifiedShortcut do: aBlockClosure description: aByteString  [
	
	self currentItem
		category: aByteSymbol;
		default: aKMModifiedShortcut;
		action: aBlockClosure;
		help: aByteString
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>createNewItem [
	
	items add: self itemClass new.
	
	self currentItem
		platform: platform;
		parent: currentRoot
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>currentItem [

	^ items last
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>currentRoot [

	^ currentRoot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>currentRoot: aMenuRegistration  [

	currentRoot := aMenuRegistration
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>default: aKMModifiedShortcut [
	
	self currentItem
		default: aKMModifiedShortcut
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>description: aByteString  [
	
	self currentItem
		help: aByteString
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>do: aBlockClosure [
	
	self currentItem
		action: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>enabled: aBoolean [
 
	self currentItem enabled: aBoolean
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>enabledBlock: aBlock [

	self currentItem enabledBlock: aBlock
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>group: aSymbol  [
	
	self createNewItem.
	self currentItem group: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>handOutItems [
	"we don't want to hold a reference to the items after they are hand out to the registration"

	| itemsCopy |
	itemsCopy := items copy.
	items removeAll.
	^ itemsCopy
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>help: aString  [
	
	self currentItem help: aString 
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>icon: anIcon [
	
	self currentItem icon: anIcon
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>iconName: aSymbol [
	"instead of forcing clients to refer to an icon builder such Smalltalk ui icons 
	this message encapsulates it inside the builder itself. When removing uses of Smalltalk ui icons it avoid to force to subclass class with menu to inherit from Model."
	
	self icon: (Smalltalk ui icons iconNamed: aSymbol)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>initialize [

	super initialize.

	items := OrderedCollection new.
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>item: aSymbol  [
	
	self createNewItem.
	self currentItem item: aSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>itemClass [

	^ PragmaMenuAndShortcutRegistrationItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>items [

	^ items
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>keyText: aString [
	self currentItem keyText: aString
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>keyText: aString if: aBoolean [
	aBoolean ifFalse: [ ^ self ].
	self keyText: aString
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>label: aString [
	
	self currentItem label: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>model: aModel [

	model := aModel.
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>order: anInteger  [
	
	self currentItem order: anInteger 
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>parent: aSymbol  [
	
	self currentItem parent: aSymbol 
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>platform: anArray [
 
	anArray isEmpty
		ifTrue: [ platform := #all ]
		ifFalse: [ platform := anArray first ]
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>precondition: aBlock  [
	
	self currentItem precondition: aBlock 
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>selector: aSelector  [
	
	self currentItem selector: aSelector
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>setAsGlobalCategory: aGlobalCategory [

	KMRepository default setAsGlobalCategory: aGlobalCategory
]

{
	#category : #'keymapping protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>shortcut: aSymbol [
	
	self createNewItem.
	self currentItem shortcut: aSymbol
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>target: aSymbol  [

	self currentItem target: aSymbol 
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>with: aBlock [
	| old itemOrGroup |
	old := self currentRoot.
	itemOrGroup := self currentItem item ifNil: [ self currentItem group ].
	self currentRoot: itemOrGroup.
	[ aBlock value ]
		ensure: [ self currentRoot: old ]
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistration>>withSeparatorAfter [

	self currentItem withSeparatorAfter
]
