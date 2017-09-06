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
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/28/2016 11:30'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel class>>adapterName [

	^ #MenuGroupAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel class>>defaultSpec [
	<spec: #default>
	
	^ #(MenuGroupAdapter
		adapt: #(model))
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>addItem: aBlock [
	| item |
	
	item := MenuItemModel new.
	aBlock value: item.
	self addMenuItem: item
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>addMenuItem: aMenuItem [

	items add: aMenuItem.
	self autoRefresh 
		ifNotNil: [ aMenuItem autoRefresh: self autoRefresh ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>autoRefresh [

	^ autoRefresh value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>buildWithSpecLayout: aSpecLayout [
	"Build the widget using the spec name provided as argument"
	| adapter widget|
	adapter := self adapterFrom: aSpecLayout model: self.
	widget := adapter asWidget.
	self announce: (WidgetBuilt model: self widget: widget).
	^ widget
]

{
	#category : #api-building,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>fromSpec: aSpec [

	aSpec addToMenuGroupModel: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>initialize [
	super initialize.
	items := OrderedCollection new asValueHolder.
	autoRefresh := nil asValueHolder.
	autoRefresh whenChangedDo: [ :aBoolean | self menuItems do: [ :each | each autoRefresh: aBoolean ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>isEmpty [

	^ items isEmpty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuGroupModel>>menuItems [

	^ items value
]
