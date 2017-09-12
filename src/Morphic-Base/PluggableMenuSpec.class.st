"
I'm a spec for a menu. The World menu pragma based registration uses it for now. I'm moved in this package so that later we can decide what to do with it. 
We could probably avoid MenuSpec and just use MenuMorph instead. 
"
Class {
	#name : #PluggableMenuSpec,
	#superclass : #Object,
	#instVars : [
		'label',
		'model',
		'items',
		'parentMenu'
	],
	#category : #Morphic-Base-Menus
}

{ #category : #example }
PluggableMenuSpec class >> exampleWithOneSingleItem [
	"self exampleWithOneSingleItem"
	
	| s |
	s := (self withModel: nil ) label: 'Hello'. 
	s add: 'Print Hello' action: (MessageSend receiver: [Transcript show: 'Hello', String cr] selector: #value).
	s asMenuMorph popUpInWorld
]

{ #category : #example }
PluggableMenuSpec class >> exampleWithSubMenu [
	"
	self exampleWithSubMenu
	"
	| s i sub |
	s := (self withModel: nil ) label: 'Tools'. 
	i := s add: 'Tools'.
	sub := (self withModel: nil ).
	sub add: 'System browser'  target: Smalltalk tools selector: #openClassBrowser argumentList: #().
	sub add: 'Workspace'  target: Smalltalk tools selector: #openWorkspace argumentList: #().
	i subMenu: sub.
	s asMenuMorph popUpInWorld
]

{ #category : #example }
PluggableMenuSpec class >> exampleWithTwoSimpleItems [
	"self exampleWithTwoSimpleItems"
	| s |
	s := (self withModel: Transcript ) label: 'Hello'. 
	s add: 'Print Hello' action: (MessageSend receiver: [Transcript show: 'Hello', String cr] selector: #value).
	s add: 'Print Hello again' selector: #show: argumentList: {'Hello again', String cr}.
	s asMenuMorph popUpInWorld
]

{ #category : #'instance creation' }
PluggableMenuSpec class >> withModel: aModel [
	^ self new model: aModel
]

{ #category : #construction }
PluggableMenuSpec >> add: aString [
	^ self add: aString action: nil
	
]

{ #category : #construction }
PluggableMenuSpec >> add: aString action: aMessageSend [
	| item |
	item := self addMenuItem.
	item label: aString translated.
	item action: aMessageSend.
	^item
]

{ #category : #construction }
PluggableMenuSpec >> add: aString selector: aMessageSend [
	| item |
	item := self addMenuItem.
	item label: aString translated.
	item action: aMessageSend.
	^item
]

{ #category : #construction }
PluggableMenuSpec >> add: aString selector: aSelector argumentList: anArray [
	^ self add: aString action: (MessageSend receiver: model selector: aSelector arguments: anArray)
]

{ #category : #construction }
PluggableMenuSpec >> add: aString target: anObject selector: aSelector argumentList: anArray [
	^ self add: aString translated action: (MessageSend receiver: anObject selector: aSelector arguments: anArray)
]

{ #category : #construction }
PluggableMenuSpec >> addList: aList [
	"Add the given items to this menu, where each item is a pair (<string> <actionSelector>)..  If an element of the list is simply the symobl $-, add a line to the receiver.  The optional third element of each entry, if present, provides balloon help."

	aList
		do: [ :tuple | 
			tuple == #-
				ifTrue: [ self addSeparator ]
				ifFalse: [ 
					| item |
					item := self
								add: tuple first
								target: model
								selector: tuple second
								argumentList: #().
					(tuple size > 2 and: [ tuple third notNil ])
						ifTrue: [ item help: tuple third ].
					(tuple size > 3 and: [ tuple fourth notNil ])
						ifTrue: [ item icon: (self theme iconNamed: tuple fourth) ] ] ]
]

{ #category : #construction }
PluggableMenuSpec >> addMenuItem [
	| item |
	item := self newMenuItem.
	self items add: item.
	^item
]

{ #category : #construction }
PluggableMenuSpec >> addSeparator [
	self items isEmpty
		ifTrue: [ ^ nil ].
	self items last separator: true
]

{ #category : #morphic }
PluggableMenuSpec >> asMenuMorph [
	| prior menu myitems |
	prior := parentMenu.
	parentMenu := menu := self morphClass new.
	self label ifNotNil: [ 
		parentMenu buildTitle: [ :titleMorph | 
			titleMorph bigTitle: self label 
		]
	].
	myitems := self items.
	myitems do: [ :each | each asMenuItemMorphFrom: parentMenu isLast: each = myitems last ].
	parentMenu := prior.
	^ menu
]

{ #category : #morphic }
PluggableMenuSpec >> buildWith: aBuilder [
	^ self asMenuMorph
]

{ #category : #accessing }
PluggableMenuSpec >> items [
	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #accessing }
PluggableMenuSpec >> label [
	^ label
]

{ #category : #accessing }
PluggableMenuSpec >> label: aString [
	label := aString.
]

{ #category : #accessing }
PluggableMenuSpec >> model [
	^ model
]

{ #category : #accessing }
PluggableMenuSpec >> model: anObject [ 
	model := anObject
]

{ #category : #morphic }
PluggableMenuSpec >> morphClass [
	^ MenuMorph
]

{ #category : #construction }
PluggableMenuSpec >> newMenuItem [
	^ PluggableMenuItemSpec new
]
