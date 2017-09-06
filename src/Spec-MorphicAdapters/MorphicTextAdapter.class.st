"
I am the adapter used to bridge a TextModel and a PluggableTextMorph
"
Class {
	#name : #MorphicTextAdapter,
	#superclass : #AbstractMorphicAdapter,
	#traits : 'TViewModel',
	#classTraits : 'TViewModel classTrait',
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>accept [
	"We use RubScrolledTextMorph>>#acceptContents but we keep accept as method name for compatibility"
	self widgetDo: [ :w | w acceptContents ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>accept: aText notifying: aNotifyier [

	self model accept: aText notifying: aNotifyier
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>acceptAllowed [
	^self widget editingMode acceptAllowed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>announcer [
	^ self model announcer

	
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>askBeforeDiscardingEdits [

	^ self model askBeforeDiscardingEdits
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>askBeforeDiscardingEdits: aBoolean [
	self widget askBeforeDiscardingEdits: aBoolean
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>autoAccept [

	^ self model autoAccept
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>autoAccept: aBoolean [

	^ self model autoAccept: aBoolean
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>behavior [

	^ self model behavior
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>buildWidget [
	| newWidget |
	newWidget := RubPluggableTextMorph new
		on: self
			text: #getText
			accept: #accept:notifying:
			readSelection: #readSelection
			menu: #codePaneMenu:shifted:
			setSelection: #setSelection:;
		beWrapped;
		enabled: self enabled;
		askBeforeDiscardingEdits: self askBeforeDiscardingEdits;
		autoAccept: self autoAccept;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		setBalloonText: self help;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		registerScrollChanges: #scrollValueChanged:;
		yourself.
	self setEditingModeFor: newWidget withBehavior: self behavior.
	^ newWidget
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>canChangeText [
	^ self widget textArea canChangeText
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>classOrMetaClass: aClass [
	self setEditingModeFor: self widget withBehavior: aClass
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>clearUserEditFlag [

	self model text: self getText.
	self changed: #clearUserEdits
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>codePaneMenu: aMenu shifted: shifted  [

	^ self model codePaneMenu: aMenu shifted: shifted 
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>doItContext [

	^ self model doItContext
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>doItReceiver [

	^ self model doItReceiver
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>font: aFont [
	self widgetDo: [ :w | w font: aFont ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>getText [

	^ self model text
]

{
	#category : #NOCompletion,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>guessTypeForName: aString [

	^nil
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>hasEditingConflicts: aBoolean [
 
	self widgetDo: [ :w | w hasEditingConflicts: aBoolean ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>hasUnacceptedEdits: aBoolean [

	self model hasUnacceptedEdits: aBoolean
]

{
	#category : #protocol-shout,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>isAboutToStyle [

	^ self model isAboutToStyle
]

{
	#category : #NOCompletion,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>isCodeCompletionAllowed [

	^ self model isCodeCompletionAllowed
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>isForSmalltalkCode [
	^ self model isForSmalltalkCode
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>notify: errorMessage at: position in: sourceCode [

	self widgetDo: [ :w | w notify: errorMessage at: position in: sourceCode ]
]

{
	#category : #private-shout,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>okToStyle [

	^ true
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>pendingText [

	^ self widgetDo: [ :w | w text ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>pendingText: aText [

	self widgetDo: [ :w | 
		w setText: aText.
		w hasUnacceptedEdits: true ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>readSelection [

	^ self model readSelection
]

{
	#category : #NOCompletion,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>receiverClass [

	^ self behavior
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>scrollValueChanged: aValue [

	self model scrollValue: aValue step
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>selectAll [
	self widgetDo: [ :w | w selectAll ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>selectFrom: nodeStart to: nodeStop [
	self widget selectFrom: nodeStart to: nodeStop
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>selectedBehavior [

	^ self model selectedBehavior
]

{
	#category : #NOCompletion,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>selectedClassOrMetaClass [

	^ self behavior
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>selectionInterval [
	^ self widget selectionInterval 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>setEditingModeFor: textArea withBehavior: behavior [
	behavior
		ifNil:
			[
			self isForSmalltalkCode
				ifTrue: [ textArea beForSmalltalkScripting ]
				ifFalse: [ textArea beForPlainText ] ]
		ifNotNil: [ :class | 
			textArea
				beForSmalltalkCodeInClass: class ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>setHasUnacceptedEdits: aBoolean [

	self widgetDo: [ :w | w basicHasUnacceptedEdits: aBoolean ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>setScrollValue: aValue [
	self
		widgetDo: [ :w | 
			w scrollPane
				hScrollbarValue: aValue x;
				vScrollbarValue: aValue y;
				updateScrollbars ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>setSelection: interval [

	self model setSelectionInterval: interval
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>setSelectionFromModel: aSelection [

	self widget ifNotNil: [:w | w setSelection: aSelection ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>shoutAboutToStyle: aMorph [
	
	^ self model isAboutToStyle
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTextAdapter>>wantsVisualFeedback [

	^ self model wantsVisualFeedback
]
