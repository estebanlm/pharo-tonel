"
I am a spec model representing a single tab.

I should not be used without being contained into a TabManagerModel.

You can also have a look at TabsExample for another example.

!! #retrievingBlock: warning

If you specify #retrievingBlock: directly, you should also set the ownership of the appropriate. (See TabModel>>#model:)
"
Class {
	#name : #TabModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'tabSelectedActionHolder',
		'labelHolder',
		'iconHolder',
		'morphHolder',
		'retrievingBlockHolder',
		'menuHolder',
		'actionsHolder',
		'closeableHolder',
		'selectedHolder'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/28/2016 10:08'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel class>>adapterName [

	^ #TabAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel class>>defaultSpec [
	<spec: #default>
	
	^ #(TabAdapter
		adapt: #(model))
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>actions [

	^ actionsHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>actions: aCollection [

	actionsHolder value: aCollection
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>actionsHolder [

	^ actionsHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>closeable [

	^ closeableHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>closeable: aBoolean [

	closeableHolder value: aBoolean
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>closeableHolder [

	^ closeableHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>contents [

	^ morphHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>contents: aMorph [

	morphHolder value: aMorph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>defaultIcon [

	^ self iconNamed: #blankIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>icon [

	^ iconHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>icon: aForm [

	iconHolder value: aForm
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>iconHolder [

	^ iconHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>iconName: aSymbol [

	iconHolder value: (self iconNamed: aSymbol)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>initialExtent [

	^ 200@25
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>initialize [
	"Initialization code for TabModel"

	super initialize.

	labelHolder := '' asValueHolder.
	iconHolder := self defaultIcon asValueHolder.
	morphHolder := nil asValueHolder.
	retrievingBlockHolder := nil asValueHolder.
	menuHolder := nil asValueHolder.
	actionsHolder := OrderedCollection new asValueHolder.
	closeableHolder := true asValueHolder.
	tabSelectedActionHolder := [  ] asValueHolder.
	selectedHolder := false asValueHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>label [

	^ labelHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>label: aString [

	labelHolder value: aString
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>labelHolder [

	^ labelHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>menu [

	^ menuHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>menu: aBlock [

	menuHolder value: aBlock
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>menuHolder [

	^ menuHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>model: aComposableModel [
	aComposableModel owner: self.
	self retrievingBlock: [ aComposableModel buildWithSpec asWidget ]
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>morphHolder [

	^ morphHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>retrievingBlock [

	^ retrievingBlockHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>retrievingBlock: aBlock [

	retrievingBlockHolder value: aBlock
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>retrievingBlockHolder [

	^ retrievingBlockHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>selected: aBoolean [

	selectedHolder value: aBoolean
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>selectedHolder [

	^ selectedHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>tabSelected  [

	tabSelectedActionHolder value cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>tabSelectedAction [

	^ tabSelectedActionHolder value
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>tabSelectedActionHolder [

	^ tabSelectedActionHolder
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TabModel>>whenTabSelected: aBlock [

	tabSelectedActionHolder value: aBlock
]
