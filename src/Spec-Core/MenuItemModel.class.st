"
I represent a menu item.

You can also have a look at ApplicationWithToolbar for a full example of how to use them.

I collaborate with MenuGroupModel to manage me.

I provide the following variables and their accessors
- name is the text I display.
- icon is the text I display.
- description is the text I display in my tooltip.
- action is the action to perform when I am clicked.
- subMenu is the submenu to display when I am clicked.

Usually I do NOT have an action AND a submenu.

todo
- autoRefresh
- enabled
- fromSpec:
- performMenuActionWith:
- shortcut is ..., the shortcut is displayed near my name.
- state
"
Class {
	#name : #MenuItemModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'action',
		'name',
		'shortcut',
		'subMenu',
		'icon',
		'description',
		'state',
		'enabled',
		'autoRefresh'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 7/19/2016 11:15'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel class>>adapterName [

	^ #MenuItemAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel class>>defaultSpec [
	<spec: #default>
	
	^ #(MenuItemAdapter
		adapt: #(model))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>action [

	^ action value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>action: aBlock [

	action value: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>autoRefresh [

	^ autoRefresh value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>autoRefresh: aBlock [

	autoRefresh value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>description [

	^ description value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>description: aString [

	description value: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>enabled [

	^ enabled value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>enabled: aBoolean [

	enabled value: aBoolean
]

{
	#category : #api-building,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>fromSpec: aSpec [

	aSpec addToMenuItemModel: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>icon [

	^ icon value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>icon: anIcon [

	icon value: anIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>iconName: aSymbol [

	icon value: (self iconNamed: aSymbol)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>initialize [

	super initialize.

	action := [] asValueHolder.
	enabled := true asValueHolder.
	state := nil asValueHolder.
	description := nil asValueHolder.
	name := '' asValueHolder.
	shortcut := nil asValueHolder.
	subMenu := nil asValueHolder.
	autoRefresh := false asValueHolder.
	icon := nil asValueHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>name [

	^ name value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>name: aString [

	name value: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>performMenuActionWith: aMenuItem [
	| en |

	en := self enabled.
	en isBlock ifTrue: [ en := en value ].
	en ifFalse: [ ^ self ].

	action value cull: aMenuItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>shortcut [

	^ shortcut value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>shortcut: aShortcut [

	shortcut value: aShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>state [

	^ state value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>state: aBoolean [

	state value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>subMenu [

	^ subMenu value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
MenuItemModel>>subMenu: aMenuModel [

	subMenu value: aMenuModel
]
