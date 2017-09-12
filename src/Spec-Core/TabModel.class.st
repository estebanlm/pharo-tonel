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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
TabModel class >> adapterName [

	^ #TabAdapter
]

{ #category : #specs }
TabModel class >> defaultSpec [
	<spec: #default>
	
	^ #(TabAdapter
		adapt: #(model))
]

{ #category : #api }
TabModel >> actions [

	^ actionsHolder value
]

{ #category : #api }
TabModel >> actions: aCollection [

	actionsHolder value: aCollection
]

{ #category : #api-valueHolder }
TabModel >> actionsHolder [

	^ actionsHolder
]

{ #category : #api }
TabModel >> closeable [

	^ closeableHolder value
]

{ #category : #api }
TabModel >> closeable: aBoolean [

	closeableHolder value: aBoolean
]

{ #category : #api-valueHolder }
TabModel >> closeableHolder [

	^ closeableHolder
]

{ #category : #api }
TabModel >> contents [

	^ morphHolder value
]

{ #category : #api }
TabModel >> contents: aMorph [

	morphHolder value: aMorph
]

{ #category : #private }
TabModel >> defaultIcon [

	^ self iconNamed: #blankIcon
]

{ #category : #api }
TabModel >> icon [

	^ iconHolder value
]

{ #category : #api }
TabModel >> icon: aForm [

	iconHolder value: aForm
]

{ #category : #api-valueHolder }
TabModel >> iconHolder [

	^ iconHolder
]

{ #category : #api }
TabModel >> iconName: aSymbol [

	iconHolder value: (self iconNamed: aSymbol)
]

{ #category : #initialization }
TabModel >> initialExtent [

	^ 200@25
]

{ #category : #initialization }
TabModel >> initialize [
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

{ #category : #api }
TabModel >> label [

	^ labelHolder value
]

{ #category : #api }
TabModel >> label: aString [

	labelHolder value: aString
]

{ #category : #api-valueHolder }
TabModel >> labelHolder [

	^ labelHolder
]

{ #category : #api }
TabModel >> menu [

	^ menuHolder value
]

{ #category : #api }
TabModel >> menu: aBlock [

	menuHolder value: aBlock
]

{ #category : #api-valueHolder }
TabModel >> menuHolder [

	^ menuHolder
]

{ #category : #api }
TabModel >> model: aComposableModel [
	aComposableModel owner: self.
	self retrievingBlock: [ aComposableModel buildWithSpec asWidget ]
]

{ #category : #api-valueHolder }
TabModel >> morphHolder [

	^ morphHolder
]

{ #category : #api }
TabModel >> retrievingBlock [

	^ retrievingBlockHolder value
]

{ #category : #api }
TabModel >> retrievingBlock: aBlock [

	retrievingBlockHolder value: aBlock
]

{ #category : #api-valueHolder }
TabModel >> retrievingBlockHolder [

	^ retrievingBlockHolder
]

{ #category : #api }
TabModel >> selected: aBoolean [

	selectedHolder value: aBoolean
]

{ #category : #api-valueHolder }
TabModel >> selectedHolder [

	^ selectedHolder
]

{ #category : #api }
TabModel >> tabSelected [ 

	tabSelectedActionHolder value cull: self
]

{ #category : #api }
TabModel >> tabSelectedAction [

	^ tabSelectedActionHolder value
]

{ #category : #api-valueHolder }
TabModel >> tabSelectedActionHolder [

	^ tabSelectedActionHolder
]

{ #category : #api-events }
TabModel >> whenTabSelected: aBlock [

	tabSelectedActionHolder value: aBlock
]
