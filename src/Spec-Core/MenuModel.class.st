"
I am a simple model describing a menu.
See AbstractWidgetModel

I only contains a list of menu groups (MenuGroupModel). Each group is separated by a splitter.

I provide the following variables and their accessors
- addGroup: use the block in parameter to initialize a new group, then add it in my collection.
- addMenuGroup: add the group in parameter in my collection.
- menuGroups getter of my collection.


todo
- addAllFromPragma:target:
- applyTo: activate the shortcut of the items of my groups.
- autoRefresh
- buildWithSpecAsPopup
- fromSpec:
- icon
- neglect:
- openWithSpecAt:
- printOn:
- title , addTitle:

"
Class {
	#name : #MenuModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'groups',
		'title',
		'icon',
		'autoRefresh'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
MenuModel class >> adapterName [

	^ #MenuAdapter
]

{ #category : #specs }
MenuModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuAdapter
		adapt: #(model))
]

{ #category : #specs }
MenuModel class >> popup [
	<spec>
	
	^ #(MenuAdapter
		adaptAsPopup: #(model))
]

{ #category : #api-building }
MenuModel >> addAllFromPragma: pragma target: target [

	self fromSpec: (PragmaMenuBuilder 
		pragmaKeyword: pragma
		model: target) menuSpec
]

{ #category : #api }
MenuModel >> addGroup: aBlock [
	| group |
	
	group := MenuGroupModel new.
	aBlock value: group.
	self addMenuGroup: group
]

{ #category : #private }
MenuModel >> addMenuGroup: aMenuGroup [

	groups add: aMenuGroup.
	self autoRefresh 
		ifNotNil: [ aMenuGroup autoRefresh: self autoRefresh ]
]

{ #category : #api }
MenuModel >> addTitle: aString [
	title value: aString translated
]

{ #category : #api }
MenuModel >> applyTo: aModel [

	aModel applyMenuModel: self
]

{ #category : #api }
MenuModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #api }
MenuModel >> autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{ #category : #api }
MenuModel >> buildWithSpecAsPopup [

	^ self buildWithSpec: #popup
]

{ #category : #api-building }
MenuModel >> fromSpec: aSpec [

	aSpec addToMenuModel: self
]

{ #category : #api }
MenuModel >> icon [

	^ icon value
]

{ #category : #api }
MenuModel >> icon: anIcon [

	icon value: anIcon
]

{ #category : #api }
MenuModel >> iconName: aSymbol [

	icon value: (self iconNamed: aSymbol)
]

{ #category : #initialization }
MenuModel >> initialize [

	super initialize.
	groups := OrderedCollection new asValueHolder.
	title := nil asValueHolder.
	icon := nil asValueHolder.
	autoRefresh := nil asValueHolder.
	autoRefresh whenChangedDo: [ :aBoolean | self menuGroups do: [ :each | each autoRefresh: aBoolean ] ]
]

{ #category : #api }
MenuModel >> menuGroups [

	^ groups value
]

{ #category : #api }
MenuModel >> neglect: aModel [

	aModel neglectMenuModel: self
]

{ #category : #api }
MenuModel >> openWithSpecAt: aPosition [

	self buildWithSpecAsPopup.
	self changed: #openAt: with: { aPosition }
]

{ #category : #printing }
MenuModel >> printOn: aStream [
	super printOn: aStream.
	self title value
		ifNotNil: [ :t | 
			aStream
				nextPutAll: ' ''';
				nextPutAll: t;
				nextPutAll: '''' ]
]

{ #category : #api }
MenuModel >> title [

	^ title value
]

{ #category : #api }
MenuModel >> title: aString [

	title value: aString
]
