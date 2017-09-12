"
I am a group of menu items.

I am part of a menu (MenuModel), and groups items (MenuItemModel) by meaning.

You can also have a look at ApplicationWithToolbar for a full example of how to use them.

I provide the following methods
- addItem: use the block in parameter to initialize a new item, then add it in my collection.
- addMenuItem: add the item in parameter in my collection.
- isEmpty return a boolean representing if my collection is empty.
- menuItems getter of my collection.


todo
- autoRefresh
- buildWithSpecLayout:
- fromSpec:
"
Class {
	#name : #MenuGroupModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'items',
		'autoRefresh'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
MenuGroupModel class >> adapterName [

	^ #MenuGroupAdapter
]

{ #category : #specs }
MenuGroupModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuGroupAdapter
		adapt: #(model))
]

{ #category : #api }
MenuGroupModel >> addItem: aBlock [
	| item |
	
	item := MenuItemModel new.
	aBlock value: item.
	self addMenuItem: item
]

{ #category : #private }
MenuGroupModel >> addMenuItem: aMenuItem [

	items add: aMenuItem.
	self autoRefresh 
		ifNotNil: [ aMenuItem autoRefresh: self autoRefresh ]
]

{ #category : #api }
MenuGroupModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #api }
MenuGroupModel >> autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{ #category : #private }
MenuGroupModel >> buildWithSpecLayout: aSpecLayout [
	"Build the widget using the spec name provided as argument"
	| adapter widget|
	adapter := self adapterFrom: aSpecLayout model: self.
	widget := adapter asWidget.
	self announce: (WidgetBuilt model: self widget: widget).
	^ widget
]

{ #category : #api-building }
MenuGroupModel >> fromSpec: aSpec [

	aSpec addToMenuGroupModel: self
]

{ #category : #initialization }
MenuGroupModel >> initialize [
	super initialize.
	items := OrderedCollection new asValueHolder.
	autoRefresh := nil asValueHolder.
	autoRefresh whenChangedDo: [ :aBoolean | self menuItems do: [ :each | each autoRefresh: aBoolean ] ]
]

{ #category : #testing }
MenuGroupModel >> isEmpty [

	^ items isEmpty
]

{ #category : #api }
MenuGroupModel >> menuItems [

	^ items value
]
