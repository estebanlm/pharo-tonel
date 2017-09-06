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
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 7/19/2016 11:01'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel class>>adapterName [

	^ self subclassResponsibility
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel class>>defaultSpec [

	^ { self adapterName. #adapt:. #model }
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>acceptDropBlock [

	^ acceptDropBlock value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>acceptDropBlock: aBlock [

	acceptDropBlock value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>borderColor [
	"<api: #inspect>"
	"Return the border color"
	
	^ borderColor value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>borderColor: aColor [
	"<api: #color getter:#borderColor registration: #whenBorderColorChanged:>"
	"Set the border width"
	
	borderColor value: aColor 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>borderWidth [
	"<api: #inspect>"
	"Return the border width"
	
	^ borderWidth value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>borderWidth: anInteger [
	"<api: #integer min:0 max: 5 getter:#borderWidth registration: #whenBorderWidthChanged:>"
	"Set the border width"
	
	borderWidth value: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>color [

	^ color value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>color: aColor [

	^ color value: aColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>defaultColor [
	^ Smalltalk ui theme backgroundColor
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>disable [
	"<api: #do>"
	"Disable the label"
	
	self enabled: false
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dragEnabled [

	^ dragEnabled value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dragEnabled: anObject [

	dragEnabled value: anObject
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dragTransformationBlock [

	^ dragTransformationBlock value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dragTransformationBlock: aBlock [

	dragTransformationBlock value: aBlock
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dropEnabled [

	^ dropEnabled value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>dropEnabled: aBoolean [

	dropEnabled value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>enable [
	"<api: #do>"
	"Enable the label"
	
	self enabled: true
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>enabled [
	"<api: #inspect>"
	^ enabledHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>enabled: aBoolean [
	"<api: #boolean getter: #enabled registration: #whenEnabledChanged:>"
	"Set if the button is enabled (clickable)"
	
	enabledHolder value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>enabledHolder [
	
	^ enabledHolder
]

{
	#category : #api-focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	
	^ { Character arrowRight asKeyCombination. Character tab asKeyCombination}
]

{
	#category : #api-focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the next widget"
	
	^ { Character arrowLeft asKeyCombination. Character tab shift asKeyCombination}
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>help [
	"<api: #inspect>"
	"Return the ballon text"
	
	^ helpHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>help: aString [
	"<api: #string getter:#help registration: #whenHelpChanged:>"
	"Set the help string"
	
	helpHolder value: aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>initialize [

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

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>initializeWidgets  [
	"ignore this method since there is no composition in basic widgets"
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>transferBlock [

	^ transferBlock value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>transferBlock: aBlock [

	transferBlock value: aBlock
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>transferFor: passenger from: source [

	^ TransferModel new
		transfer: passenger;
		from: source;
		yourself
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>wantDropBlock [

	^ wantDropBlock value
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>wantDropBlock: aBlock [

	wantDropBlock value: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>whenBorderColorChanged: aBlock [
	"Set a block to be performed when the brder width changed"
	
	borderColor whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>whenBorderWidthChanged: aBlock [
	"Set a block to be performed when the brder width changed"
	
	borderWidth whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>whenEnabledChanged: aBlock [
	"Set a block to performed when the widget is enabled or disabled"
	
	enabledHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractWidgetModel>>whenHelpChanged: aBlock [
	"Set a block to be performed when the help changed"
	
	helpHolder whenChangedDo: aBlock
]
