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
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 7/18/2016 17:33'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column |  ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel class>>example [
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

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>addRadioButton: aButton [
	self linkRadioButton: aButton.
	aButton canDeselectByClick: self canDeselectByClick.
	buttons add: aButton.
	aButton privateSetState: false;
		owner: self.
	self focusOrder add: aButton ..
	self rebuildWidget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>buttons [
	^ buttons
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>canDeselectByClick [
	<api: #inspect>
	"Return true clicking on a selected radio button deselects it"

	^ canDeselectByClick value
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>canDeselectByClick: aBoolean [
	<api: #boolean getter: #canDeselectByClick registration: #whenCanDeselectByClickChanged>
	"Set if clicking on a selected radio button can deselect it"
	
	canDeselectByClick value: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>createWidgets [
	buttons
		withIndexDo: [ :each :i | 
			self assign: each to: ('radio' , i asString) asSymbol.
			 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>currentActivated [
	^ currentActivated value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>currentActivated: aRadioButton [
	currentActivated value: aRadioButton
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>default: aButton [
	aButton privateSetState: true.
	aButton takeKeyboardFocus.
	aButton
		whenBuiltDo: [ aButton privateSetState: true.
			self currentActivated: aButton]
	
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>defaultOnce: aButton [
	aButton privateSetState: true.
	self currentActivated: aButton.
	"This method is used to avoid a problem of default: with a DynamicComposableModel but a fix would be better (if possible)"
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>dynamicLayout [
	|lay|
	lay := SpecLayout composed
		newColumn: [ :column | 
			widgets keysDo: [ :item | column newRow: [ :row | row add: item ] ].
			column newRow: [ :row |  ] ].
	self layout: lay.
	^ lay
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>initialize [
	buttons := OrderedCollection new.
	canDeselectByClick := false asValueHolder.
	currentActivated := nil asValueHolder.
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>initializePresenter [
	self
		whenCanDeselectByClickChanged: [ :aBoolean | buttons do: [ :each | each canDeselectByClick: aBoolean ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>linkRadioButton: aButton [
	buttons
		do: [ :b | 
			aButton whenActivatedDo: [ b privateSetState: false ].
			b whenActivatedDo: [ aButton privateSetState: false ] ].
	aButton whenActivatedDo: [ self currentActivated: aButton ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>rebuildWidget [
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	self buildWithSpecLayout: self dynamicLayout
]

{
	#category : #protocol-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>whenCanDeselectByClickChanged: aBlock [
	"This method is triggered when `canDeselectByClick` changes"
	
	canDeselectByClick whenChangedDo: aBlock
]

{
	#category : #protocol-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
RadioButtonGroupModel>>whenCurrentActivatedChanged: aBlock [

	currentActivated whenChangedDo: aBlock
]
