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
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/28/2016 11:30'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel class>>adapterName [

	^ #MenuAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel class>>defaultSpec [
	<spec: #default>
	
	^ #(MenuAdapter
		adapt: #(model))
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel class>>popup [
	<spec>
	
	^ #(MenuAdapter
		adaptAsPopup: #(model))
]

{
	#category : #api-building,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>addAllFromPragma: pragma target: target [

	self fromSpec: (PragmaMenuBuilder 
		pragmaKeyword: pragma
		model: target) menuSpec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>addGroup: aBlock [
	| group |
	
	group := MenuGroupModel new.
	aBlock value: group.
	self addMenuGroup: group
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>addMenuGroup: aMenuGroup [

	groups add: aMenuGroup.
	self autoRefresh 
		ifNotNil: [ aMenuGroup autoRefresh: self autoRefresh ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>addTitle: aString [
	title value: aString translated
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>applyTo: aModel [

	aModel applyMenuModel: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>autoRefresh [

	^ autoRefresh value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>buildWithSpecAsPopup [

	^ self buildWithSpec: #popup
]

{
	#category : #api-building,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>fromSpec: aSpec [

	aSpec addToMenuModel: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>icon [

	^ icon value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>icon: anIcon [

	icon value: anIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>iconName: aSymbol [

	icon value: (self iconNamed: aSymbol)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>initialize [

	super initialize.
	groups := OrderedCollection new asValueHolder.
	title := nil asValueHolder.
	icon := nil asValueHolder.
	autoRefresh := nil asValueHolder.
	autoRefresh whenChangedDo: [ :aBoolean | self menuGroups do: [ :each | each autoRefresh: aBoolean ] ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>menuGroups [

	^ groups value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>neglect: aModel [

	aModel neglectMenuModel: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>openWithSpecAt: aPosition [

	self buildWithSpecAsPopup.
	self changed: #openAt: with: { aPosition }
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>printOn: aStream [
	super printOn: aStream.
	self title value
		ifNotNil: [ :t | 
			aStream
				nextPutAll: ' ''';
				nextPutAll: t;
				nextPutAll: '''' ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>title [

	^ title value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuModel>>title: aString [

	title value: aString
]
