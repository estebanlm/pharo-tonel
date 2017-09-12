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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
MenuItemModel class >> adapterName [

	^ #MenuItemAdapter
]

{ #category : #specs }
MenuItemModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuItemAdapter
		adapt: #(model))
]

{ #category : #accessing }
MenuItemModel >> action [

	^ action value
]

{ #category : #accessing }
MenuItemModel >> action: aBlock [

	action value: aBlock
]

{ #category : #accessing }
MenuItemModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #accessing }
MenuItemModel >> autoRefresh: aBlock [

	autoRefresh value: aBlock
]

{ #category : #api }
MenuItemModel >> description [

	^ description value
]

{ #category : #api }
MenuItemModel >> description: aString [

	description value: aString
]

{ #category : #accessing }
MenuItemModel >> enabled [

	^ enabled value
]

{ #category : #accessing }
MenuItemModel >> enabled: aBoolean [

	enabled value: aBoolean
]

{ #category : #api-building }
MenuItemModel >> fromSpec: aSpec [

	aSpec addToMenuItemModel: self
]

{ #category : #api }
MenuItemModel >> icon [

	^ icon value
]

{ #category : #api }
MenuItemModel >> icon: anIcon [

	icon value: anIcon
]

{ #category : #api }
MenuItemModel >> iconName: aSymbol [

	icon value: (self iconNamed: aSymbol)
]

{ #category : #initialization }
MenuItemModel >> initialize [

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

{ #category : #api }
MenuItemModel >> name [

	^ name value
]

{ #category : #api }
MenuItemModel >> name: aString [

	name value: aString
]

{ #category : #api }
MenuItemModel >> performMenuActionWith: aMenuItem [
	| en |

	en := self enabled.
	en isBlock ifTrue: [ en := en value ].
	en ifFalse: [ ^ self ].

	action value cull: aMenuItem
]

{ #category : #api }
MenuItemModel >> shortcut [

	^ shortcut value
]

{ #category : #api }
MenuItemModel >> shortcut: aShortcut [

	shortcut value: aShortcut
]

{ #category : #accessing }
MenuItemModel >> state [

	^ state value
]

{ #category : #accessing }
MenuItemModel >> state: aBoolean [

	state value: aBoolean
]

{ #category : #api }
MenuItemModel >> subMenu [

	^ subMenu value
]

{ #category : #api }
MenuItemModel >> subMenu: aMenuModel [

	subMenu value: aMenuModel
]
