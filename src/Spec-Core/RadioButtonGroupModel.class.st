"
I am a group for radio buttons.
See DynamicComposableModel

self example

You can also have a look at MrAndMrsRadioButton and RadioButtonGroupExample for more examples.

I ensures that only one button is activated at the same time and I hold the button activated.

I provide the following variables and their accessors
- buttons is the collection of the buttons I manage.
- currentActivated is the last activated button.

I provide the following methods
- addRadioButton: to add a button in my collection and link it at others.
- default: to activate the button when I am built.
- linkRadioButton: to make the button deselected when another is selected.

defaultOnce: is use to avoid a problem appearing with default: when it is include in other DynamicComposableModel but it should be replace by a fix.

I use the following method for my internal work
- createWidgets assign each button of my collection in my super class collection that manage dynamical subwidgets.
- dynamicLayout refresh the layout using my super class collection.
- rebuildWidget trigger the steps for refresh the widget and the layout.

todo
- canDeselectByClick
"
Class {
	#name : #RadioButtonGroupModel,
	#superclass : #DynamicComposableModel,
	#instVars : [
		'buttons',
		'canDeselectByClick',
		'currentActivated'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
RadioButtonGroupModel class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column |  ];
		yourself
]

{ #category : #example }
RadioButtonGroupModel class >> example [
	| example |
	example := RadioButtonGroupModel new.
	example
		addRadioButton: (RadioButtonModel new label: '1');
		addRadioButton: (RadioButtonModel new label: '2');
		addRadioButton: (RadioButtonModel new label: '3');
		whenCurrentActivatedChanged: [ self inform: example currentActivated label ].
	example openWithSpec.
	^ example
]

{ #category : #protocol }
RadioButtonGroupModel >> addRadioButton: aButton [
	self linkRadioButton: aButton.
	aButton canDeselectByClick: self canDeselectByClick.
	buttons add: aButton.
	aButton privateSetState: false;
		owner: self.
	self focusOrder add: aButton ..
	self rebuildWidget
]

{ #category : #accessing }
RadioButtonGroupModel >> buttons [
	^ buttons
]

{ #category : #protocol }
RadioButtonGroupModel >> canDeselectByClick [
	<api: #inspect>
	"Return true clicking on a selected radio button deselects it"

	^ canDeselectByClick value
]

{ #category : #protocol }
RadioButtonGroupModel >> canDeselectByClick: aBoolean [
	<api: #boolean getter: #canDeselectByClick registration: #whenCanDeselectByClickChanged>
	"Set if clicking on a selected radio button can deselect it"
	
	canDeselectByClick value: aBoolean
]

{ #category : #accessing }
RadioButtonGroupModel >> createWidgets [
	buttons
		withIndexDo: [ :each :i | 
			self assign: each to: ('radio' , i asString) asSymbol.
			 ]
]

{ #category : #accessing }
RadioButtonGroupModel >> currentActivated [
	^ currentActivated value
]

{ #category : #accessing }
RadioButtonGroupModel >> currentActivated: aRadioButton [
	currentActivated value: aRadioButton
]

{ #category : #protocol }
RadioButtonGroupModel >> default: aButton [
	aButton privateSetState: true.
	aButton takeKeyboardFocus.
	aButton
		whenBuiltDo: [ aButton privateSetState: true.
			self currentActivated: aButton]
	
]

{ #category : #protocol }
RadioButtonGroupModel >> defaultOnce: aButton [
	aButton privateSetState: true.
	self currentActivated: aButton.
	"This method is used to avoid a problem of default: with a DynamicComposableModel but a fix would be better (if possible)"
]

{ #category : #specs }
RadioButtonGroupModel >> dynamicLayout [
	|lay|
	lay := SpecLayout composed
		newColumn: [ :column | 
			widgets keysDo: [ :item | column newRow: [ :row | row add: item ] ].
			column newRow: [ :row |  ] ].
	self layout: lay.
	^ lay
]

{ #category : #initialization }
RadioButtonGroupModel >> initialize [
	buttons := OrderedCollection new.
	canDeselectByClick := false asValueHolder.
	currentActivated := nil asValueHolder.
	super initialize.
]

{ #category : #initialization }
RadioButtonGroupModel >> initializePresenter [
	self
		whenCanDeselectByClickChanged: [ :aBoolean | buttons do: [ :each | each canDeselectByClick: aBoolean ] ]
]

{ #category : #protocol }
RadioButtonGroupModel >> linkRadioButton: aButton [
	buttons
		do: [ :b | 
			aButton whenActivatedDo: [ b privateSetState: false ].
			b whenActivatedDo: [ aButton privateSetState: false ] ].
	aButton whenActivatedDo: [ self currentActivated: aButton ].
]

{ #category : #accessing }
RadioButtonGroupModel >> rebuildWidget [
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	self buildWithSpecLayout: self dynamicLayout
]

{ #category : #protocol-events }
RadioButtonGroupModel >> whenCanDeselectByClickChanged: aBlock [
	"This method is triggered when `canDeselectByClick` changes"
	
	canDeselectByClick whenChangedDo: aBlock
]

{ #category : #protocol-events }
RadioButtonGroupModel >> whenCurrentActivatedChanged: aBlock [

	currentActivated whenChangedDo: aBlock
]
