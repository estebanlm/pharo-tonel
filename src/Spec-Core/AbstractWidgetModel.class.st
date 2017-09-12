"
AbstractBasicWidget is an abstract class for basic widgets

I collaborate with
-  ValueHolder to managed some of my variables.
- ComposableModel to manage me with other elements.

I provide the following variables and their accessors
- enabled is a boolean representing if I am usable or not, it is true by default. It  have also shortcut enable and disable.
- help is the text displayed in the tooltip.
- borderWidth, its default value is 0, it must be called after have displayed the widget. 
- borderColor, its default value is transparent, it must be called after have displayed the widget. 

For the two methods borderWidth and borderColor, notice that some of my subclasses don't display my border

Me and my subclasses provide shortcut hook for my valueHolder, they are named ""when"" followed of the event.

My drag and drop system don't work well.

todo
- defaultColor
- color
- eventKeyStrokesForNextFocus

"
Class {
	#name : #AbstractWidgetModel,
	#superclass : #ComposableModel,
	#instVars : [
		'helpHolder',
		'borderWidth',
		'borderColor',
		'enabledHolder',
		'dragEnabled',
		'dropEnabled',
		'dragTransformationBlock',
		'wantDropBlock',
		'acceptDropBlock',
		'transferBlock',
		'color'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
AbstractWidgetModel class >> adapterName [

	^ self subclassResponsibility
]

{ #category : #specs }
AbstractWidgetModel class >> defaultSpec [

	^ { self adapterName. #adapt:. #model }
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> acceptDropBlock [

	^ acceptDropBlock value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> acceptDropBlock: aBlock [

	acceptDropBlock value: aBlock
]

{ #category : #api }
AbstractWidgetModel >> borderColor [
	"<api: #inspect>"
	"Return the border color"
	
	^ borderColor value
]

{ #category : #api }
AbstractWidgetModel >> borderColor: aColor [
	"<api: #color getter:#borderColor registration: #whenBorderColorChanged:>"
	"Set the border width"
	
	borderColor value: aColor 
]

{ #category : #api }
AbstractWidgetModel >> borderWidth [
	"<api: #inspect>"
	"Return the border width"
	
	^ borderWidth value
]

{ #category : #api }
AbstractWidgetModel >> borderWidth: anInteger [
	"<api: #integer min:0 max: 5 getter:#borderWidth registration: #whenBorderWidthChanged:>"
	"Set the border width"
	
	borderWidth value: anInteger
]

{ #category : #api }
AbstractWidgetModel >> color [

	^ color value
]

{ #category : #api }
AbstractWidgetModel >> color: aColor [

	^ color value: aColor
]

{ #category : #initialization }
AbstractWidgetModel >> defaultColor [
	^ Smalltalk ui theme backgroundColor
]

{ #category : #api }
AbstractWidgetModel >> disable [
	"<api: #do>"
	"Disable the label"
	
	self enabled: false
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dragEnabled [

	^ dragEnabled value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dragEnabled: anObject [

	dragEnabled value: anObject
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dragTransformationBlock [

	^ dragTransformationBlock value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dragTransformationBlock: aBlock [

	dragTransformationBlock value: aBlock
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dropEnabled [

	^ dropEnabled value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> dropEnabled: aBoolean [

	dropEnabled value: aBoolean
]

{ #category : #api }
AbstractWidgetModel >> enable [
	"<api: #do>"
	"Enable the label"
	
	self enabled: true
]

{ #category : #api }
AbstractWidgetModel >> enabled [
	"<api: #inspect>"
	^ enabledHolder value
]

{ #category : #api }
AbstractWidgetModel >> enabled: aBoolean [
	"<api: #boolean getter: #enabled registration: #whenEnabledChanged:>"
	"Set if the button is enabled (clickable)"
	
	enabledHolder value: aBoolean
]

{ #category : #api }
AbstractWidgetModel >> enabledHolder [
	
	^ enabledHolder
]

{ #category : #api-focus }
AbstractWidgetModel >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	
	^ { Character arrowRight asKeyCombination. Character tab asKeyCombination}
]

{ #category : #api-focus }
AbstractWidgetModel >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the next widget"
	
	^ { Character arrowLeft asKeyCombination. Character tab shift asKeyCombination}
]

{ #category : #api }
AbstractWidgetModel >> help [
	"<api: #inspect>"
	"Return the ballon text"
	
	^ helpHolder value
]

{ #category : #api }
AbstractWidgetModel >> help: aString [
	"<api: #string getter:#help registration: #whenHelpChanged:>"
	"Set the help string"
	
	helpHolder value: aString
]

{ #category : #initialization }
AbstractWidgetModel >> initialize [

	super initialize.

	helpHolder := nil asValueHolder.
	borderWidth := 0 asValueHolder.
	borderColor := Color transparent asValueHolder.
	enabledHolder := true asValueHolder.
	dragEnabled := false asValueHolder.
	dropEnabled := false asValueHolder.
	dragTransformationBlock := [ :item :source | item ] asValueHolder.
	wantDropBlock := [ :draggedItem :event :source | self dropEnabled ] asValueHolder.
	acceptDropBlock := [ :draggedItem :event :source | ] asValueHolder.
	transferBlock := [:passenger :source | self transferFor: passenger from: source ] asValueHolder.
	color := self defaultColor asValueHolder.
	
	helpHolder whenChangedDo: [:string | 
		self widget ifNotNil: [:w | w update: #setBalloonText: with: { string } ] ].
	
	borderWidth whenChangedDo: [:int | 
		self widget ifNotNil: [:w | w update: #borderWidth: with: { int } ] ].
	
	borderColor whenChangedDo: [:newColor | 
		self widget ifNotNil: [:w | w update: #borderColor: with: { newColor } ] ].
	
	color whenChangedDo: [:newColor | 
		self widget ifNotNil: [:w | w update: #color: with: { newColor } ] ].
	
	enabledHolder whenChangedDo: [:b |
		self widget ifNotNil: [:w | w update: #enabled: with: { b } ] ].
	
	dragEnabled whenChangedDo: [:b |
		self widget ifNotNil: [:w | w update: #dragEnabled: with: { b } ] ].
	
	dropEnabled whenChangedDo: [:b |
		self widget ifNotNil: [:w | w update: #dropEnabled: with: { b } ] ].
]

{ #category : #initialization }
AbstractWidgetModel >> initializeWidgets [ 
	"ignore this method since there is no composition in basic widgets"
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> transferBlock [

	^ transferBlock value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> transferBlock: aBlock [

	transferBlock value: aBlock
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> transferFor: passenger from: source [

	^ TransferModel new
		transfer: passenger;
		from: source;
		yourself
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> wantDropBlock [

	^ wantDropBlock value
]

{ #category : #'drag and drop' }
AbstractWidgetModel >> wantDropBlock: aBlock [

	wantDropBlock value: aBlock
]

{ #category : #api-events }
AbstractWidgetModel >> whenBorderColorChanged: aBlock [
	"Set a block to be performed when the brder width changed"
	
	borderColor whenChangedDo: aBlock
]

{ #category : #api-events }
AbstractWidgetModel >> whenBorderWidthChanged: aBlock [
	"Set a block to be performed when the brder width changed"
	
	borderWidth whenChangedDo: aBlock
]

{ #category : #api-events }
AbstractWidgetModel >> whenEnabledChanged: aBlock [
	"Set a block to performed when the widget is enabled or disabled"
	
	enabledHolder whenChangedDo: aBlock
]

{ #category : #api-events }
AbstractWidgetModel >> whenHelpChanged: aBlock [
	"Set a block to be performed when the help changed"
	
	helpHolder whenChangedDo: aBlock
]
