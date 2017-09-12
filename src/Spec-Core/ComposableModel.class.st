"
ComposableModel is an abstract class which represent a applicative model made to be composed with other ComposableModel

Most often, I am used to display other subclasses of ComposableModel or subclasses of AbstractWidgetModel.

I collaborate with 
-  ValueHolder to managed some of my variables.
- SpecFocusOrder when no focusOrder are specified.
- SpecLayout
- WindowModel or DialogWindowModel  to display myself.

A new subclass of ComposableModel must at least define initializeWidgets and defaultSpec on the class side.

I provide the following methods
- aboutText: set the text displayed in the About.
- title: set the title of the window.
- extent: set the initial size of the window, alternative possibility is define again initialExtent, it must be called before have displayed the widget. 
- focusOrder: set an instance what manage the order of focus of the keyboard navigation.
- bindKeyCombination:toAction: create a shortcut on keyboard what perform the block of the  action.
- owner getter of my parent.
- window getter of the window displaying me.

On my class side, I provide methods returning standard height and width for some elements.

todo
- announce:
- applyMenuModel: and neglectMenuModel:
- keyStrokeForNextFocus: , giveFocusToNextFrom: and takeKeyboardFocus
- ensureExtentFor:
- hide
- needRebuild
- on:do:
- update:
- widget

Window
=======

- openWithSpec instantiate a WindowModel using the lookup to found the layout to use.
- openDialogWithSpec instanciate a DialogWindowModel using the lookup to found the layout to use.
Their variants openWithSpec: and openDialogWithSpec:  use the layout parameter.

These methods can be useful to manage the window
- isDisplayed return true if the window of the widget is displayed
- hasWindow return true if the widget have a window
- centered to center the window in the world.
- delete to delete the window.

todo
- cancelled
- setModal:
- windowIcon:


Instantiation
===========

* initializeWidgets is called by the initialize method, it should contain initialization of subwidgets and of the focusorder.

The instantiation of a subwidget should use one of that way
- instantiate: take a class in parameter and return the created instance.
- methods named 'new' followed by a widget name are shortcut working with instatiate:

Usually, the subwidgets must be added in the focusOrder using something like 'self focusOrder add: accessor of  the  subwidget'

Note that instantiateModels: is legacy code in ComposableModel and must not be used. It will be deprecated and removed.

* initializePresenter is called by the initialize method after initializeWidgets, it should manage interaction of subwidgets.

Methods named 'when' followed by an event provide hook to perform the action in parameter.

Note
-------
Be careful about code order if you are overriding initialize method.
Normally in Spec initializing instance variables should be done BEFORE calling super initialize (so the opposite of the normal approach), because super initialize calls initalizeWidgets and initializePresenter that normally would make use of those variables.

Layout
======

See SpecLayout

defaultSpec or a method containing the pragma <spec: #default> must be defined in the class side of my subclasses.
It contains informations about how place its elements.
It possible to define more than one method to give the possibility to use another layout, by default the one containing the pragma will be used if it exists, if not defaultSpec will be used.
"
Class {
	#name : #ComposableModel,
	#superclass : #Model,
	#instVars : [
		'focusOrder',
		'owner',
		'window',
		'spec',
		'extentHolder',
		'needRebuild',
		'additionalKeyBindings',
		'announcer',
		'keyStrokesForNextFocusHolder',
		'keyStrokesForPreviousFocusHolder',
		'windowIcon',
		'aboutText',
		'askOkToClose',
		'titleHolder'
	],
	#category : #Spec-Core
}

{ #category : #defaults }
ComposableModel class >> buttonHeight [

	^ StandardFonts defaultFont height + 12
]

{ #category : #defaults }
ComposableModel class >> buttonWidth [

	^ (StandardFonts defaultFont widthOfString: 'eilwp') + 44
]

{ #category : #specs }
ComposableModel class >> defaultSpec [

	^ self subclassResponsibility
]

{ #category : #defaults }
ComposableModel class >> inputTextHeight [

	^ StandardFonts defaultFont height + 12
]

{ #category : #'instance creation' }
ComposableModel class >> owner: owner [

	^ self new
		owner: owner;
		yourself
]

{ #category : #protocol }
ComposableModel class >> specSelectors [
	
	^  self class withAllSuperclasses flatCollect: [ :class |
		(((SpecPragmaCollector behavior: class)
			filter: [ :pragma | pragma keyword = #spec])
			reset;
			collected)
			collect: [ :pragmas | pragmas method selector ]]
]

{ #category : #specs }
ComposableModel class >> title [
	
	^ 'Untitled window'
]

{ #category : #defaults }
ComposableModel class >> toolbarHeight [

	^ StandardFonts defaultFont height + 12
]

{ #category : #api }
ComposableModel >> aboutText [

	^ aboutText value ifNil: [ aboutText value: 'The about text for this window has not been set.']
]

{ #category : #api }
ComposableModel >> aboutText: aString [

	aboutText value: aString
]

{ #category : #api }
ComposableModel >> adapterFrom: aSpecLayout model: aModel [
	^ SpecInterpreter interpretASpec: aSpecLayout model: aModel
]

{ #category : #private }
ComposableModel >> addAll: aWindow withSpec: aSpec [

	aWindow
		addMorph: (self buildWithSpec: aSpec)
		frame: (0@0 corner: 1@1).
]

{ #category : #private }
ComposableModel >> addAll: aWindow withSpecLayout: aSpec [

	aWindow
		addMorph: (self buildWithSpecLayout: aSpec)
		frame: (0@0 corner: 1@1).
]

{ #category : #'window menu' }
ComposableModel >> addMenuItemsToWindowMenu: aMenu [
	"Do nothing"
]

{ #category : #api-shortcuts }
ComposableModel >> additionalKeyBindings [

	^ additionalKeyBindings value
]

{ #category : #api }
ComposableModel >> announce: anAnnouncement [

	self announcer announce: anAnnouncement
]

{ #category : #accessing }
ComposableModel >> announcer [

	^ announcer
]

{ #category : #api }
ComposableModel >> apiSelectors [

	^ self class apiSelectors
]

{ #category : #api }
ComposableModel >> applyMenuModel: aMenuModel [

	aMenuModel menuGroups do: [ :group |
		group menuItems do: [ :item |
			item shortcut ifNotNil: [ :shortcut | self bindMenuKeyCombination: shortcut toAction: [ item performMenuActionWith: {} ] ].
			item subMenu ifNotNil: [ :subMenu | subMenu applyTo: self	] ] ]
]

{ #category : #api }
ComposableModel >> askOkToClose [

	^ askOkToClose value
]

{ #category : #api }
ComposableModel >> askOkToClose: aBoolean [

	askOkToClose value: aBoolean
]

{ #category : #api-shortcuts }
ComposableModel >> bindKeyCombination: aShortcut toAction: aBlock [

	additionalKeyBindings at: aShortcut put: aBlock.
	
	self changed: #bindKeyCombination:toAction: with: {aShortcut . aBlock}
]

{ #category : #api-shortcuts }
ComposableModel >> bindMenuKeyCombination: aShortcut toAction: aBlock [

	additionalKeyBindings at: aShortcut put: aBlock.
	
	self changed: #bindMenuKeyCombination:toAction: with: {aShortcut . aBlock}
]

{ #category : #api }
ComposableModel >> buildWithSpec [
	"Build the widget using the default spec"
	
	^ self buildWithSpec: self defaultSpecSelector
]

{ #category : #api }
ComposableModel >> buildWithSpec: aSpec [
	"Build the widget using the spec name provided as argument"
	
	^ self buildWithSpecLayout: (self retrieveSpec: aSpec)
]

{ #category : #api }
ComposableModel >> buildWithSpecLayout: aSpecLayout [
	"Build the widget using the spec name provided as argument"
	| widget adapter|
	adapter := self adapterFrom: aSpecLayout model: self.
	widget := adapter asWidget.
	self setExtentAndBindingTo: widget.
	^ widget
]

{ #category : #api }
ComposableModel >> cancelled [

	^ self window
		ifNil: [ false ]
		ifNotNil: [ :w | w cancelled ]
]

{ #category : #api }
ComposableModel >> centerWidget: aWindow [

	self changed: #centerWidget: with: { aWindow }
]

{ #category : #api }
ComposableModel >> centered [

	window value ifNotNil: [ :w | w centered ]
]

{ #category : #api }
ComposableModel >> centeredRelativeTo: aModel [

	window value ifNotNil: [ :w | w centeredRelativeTo: aModel ]
]

{ #category : #'instance creation' }
ComposableModel >> createInstanceFor: aClassSymbol [
	"Retrieve the class corresponding to aClassSymbol using the bindings, then create a new instance of theis class"
	| class |
	
	class := self resolveSymbol: aClassSymbol.
	^ self instantiate: class.
]

{ #category : #specs }
ComposableModel >> defaultSpec [

	^ self class perform: self defaultSpecSelector
]

{ #category : #private }
ComposableModel >> defaultSpecSelector [

	self class class withAllSuperclassesDo: [ :class |
		(((SpecPragmaCollector behavior: class)
			filter: [ :pragma | 
				pragma keyword = 'spec:' and: [ pragma arguments includes: #default ]])
			reset;
			collected)
				ifNotEmpty: [ :pragmas | ^ pragmas first method selector ]].

	self specSelectors
		ifNotEmpty: [:col | col size = 1 ifTrue: [ ^ col first ]].
		
	"should use pragmas"
	^ #defaultSpec
	

]

{ #category : #accessing }
ComposableModel >> defaultWindowModelClass [ 
	^ WindowModel
]

{ #category : #private }
ComposableModel >> delete [

	window value
		ifNil: [ self changed: #delete with: #() ]
		ifNotNil: [ :w | w delete ]
]

{ #category : #api }
ComposableModel >> ensureExtentFor: widget [

	self extent
		ifNil: [ self initialExtent
			ifNotNil: [ :ex | 
				(widget respondsTo: #extent:)
					ifTrue: [ widget extent: ex ] ] ]
		ifNotNil: [ :ex | 
			(widget respondsTo: #extent:)
				ifTrue: [ widget extent: ex ] ].
	
]

{ #category : #private-focus }
ComposableModel >> ensureKeyBindingsFor: aWidget [

	self registerKeyStrokesForNextFor: aWidget.
	self registerKeyStrokesForPreviousFor: aWidget.
	
	additionalKeyBindings associationsDo: [:association | aWidget bindKeyCombination: association key toAction: association value ]
]

{ #category : #api-focus }
ComposableModel >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"

	^ keyStrokesForNextFocusHolder value
]

{ #category : #api-focus }
ComposableModel >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"

	^ keyStrokesForPreviousFocusHolder value
]

{ #category : #api }
ComposableModel >> extent [

	^  extentHolder value
]

{ #category : #api }
ComposableModel >> extent: aPoint [

	^  extentHolder value: aPoint
]

{ #category : #accessing }
ComposableModel >> focusOrder [

	^ focusOrder ifNil: [ focusOrder := OrderedCollection new ].
]

{ #category : #accessing }
ComposableModel >> focusOrder: anObject [
	^ focusOrder := anObject
]

{ #category : #private-focus }
ComposableModel >> giveFocusToNextFrom: aModel [
	| focus |
	
	focus := self focusOrder.

	(focus includes: aModel)
		ifTrue: [
			| index next |
			index := (focus indexOf: aModel) + 1.
			(index <= focus size)
				ifTrue: [
					next := focus at: index.
					next takeKeyboardFocus.
					^ true ]].

	^ owner 
		ifNil: [ " I loop "
			| next |
			next := focus at: 1 ifAbsent: [ ^ false ].
			next takeKeyboardFocus.
			true ]
		ifNotNil: [ 
			owner giveFocusToNextFrom: self.
			true ]
]

{ #category : #private-focus }
ComposableModel >> giveFocusToPreviousFrom: aModel [ 
	| focus |
	
	focus := self focusOrder.

	(focus includes: aModel)
		ifTrue: [
			| index previous |
			index := (focus indexOf: aModel) - 1.
			(index > 0)
				ifTrue: [
					previous := focus at: index.
					previous takeLastKeyboardFocus.
					^ true ]].

	^ owner 
		ifNil: [ " I loop "
			| next |
			next := focus at: focus size ifAbsent: [ ^ false ].
			next takeLastKeyboardFocus.
			true]
		ifNotNil: [ 
			owner giveFocusToPreviousFrom: self.
			true ]
]

{ #category : #private-focus }
ComposableModel >> handlesKeyboard: evt [

	^ true
]

{ #category : #testing }
ComposableModel >> hasWindow [
	"Answers true if there is an open window using this model."

	self owner ifNil: [ ^ self window ifNotNil: [ :w | w isClosed not ] ifNil: [ false ] ].
	 ^ self owner hasWindow
]

{ #category : #api }
ComposableModel >> hide [

	self widget ifNotNil: [:widget |
		(widget respondsTo: #hide) ifTrue: [ widget hide ]].
]

{ #category : #icon }
ComposableModel >> icon: aSymbol [
	"Return the icon associated with the argument."
	self flag: #remove.
	^ self iconNamed: aSymbol
]

{ #category : #api }
ComposableModel >> initialExtent [

	^ nil
]

{ #category : #initialization }
ComposableModel >> initialize [

	super initialize.
	extentHolder := nil asValueHolder.
	needRebuild := true asValueHolder.
	keyStrokesForNextFocusHolder := { KMNoShortcut new } asValueHolder.
	keyStrokesForPreviousFocusHolder := { KMNoShortcut new } asValueHolder.
	additionalKeyBindings := Dictionary new.
	announcer := Announcer new.
	aboutText := nil asValueHolder.
	windowIcon := nil asValueHolder.
	window := nil asValueHolder.
	askOkToClose := false asValueHolder.
	titleHolder := self class title asValueHolder.
	
	self initializeWidgets.
	self initializePresenter.
	
	keyStrokesForNextFocusHolder whenChangedDo: [ self registerKeyStrokesForNextFor: self widget ].
	keyStrokesForPreviousFocusHolder whenChangedDo: [ self registerKeyStrokesForPreviousFor: self widget ].
	titleHolder whenChangedDo: [ self updateTitle ]
]

{ #category : #initialization }
ComposableModel >> initializeDialogWindow: aWindow [
	"used to initialize the model in the case of the use into a dialog window"
]

{ #category : #initialization }
ComposableModel >> initializePresenter [
	"Used to specify the subwidgets, and/or to bind them together"
	"By default, do not do anything"
	
	extentHolder whenChangedDo: [:ex | 
		self widget ifNotNil: [:widget |
			(widget respondsTo: #extent:)
				ifTrue: [ widget extent: ex ]]].
]

{ #category : #initialization }
ComposableModel >> initializeWidgets [
	
	self subclassResponsibility
]

{ #category : #'instance creation' }
ComposableModel >> instantiate: aComposableModelClass [
	"Instantiate a ComposableModel subclass and set its instance owner"
	^ aComposableModelClass owner: self
]

{ #category : #'instance creation' }
ComposableModel >> instantiateModels: aCollectionOfPairs [
	"instantiateModels: is legacy code in ComposableModel and must not be used. It will be deprecated and removed."

	"Used to instantiate multiple sub widget at once. Take aCollectionOfPairs where each odd element is an inst var name and each even element is a class name, create an instance from the class name and store it into the inst var"

	(aCollectionOfPairs anySatisfy: [ :e | e isKindOf: Association ])
		ifTrue: [ aCollectionOfPairs
				do: [ :a | 
					| k v |
					k := a key.
					v := a value.
					self instVarNamed: k asString put: (self createInstanceFor: v) ] ]
		ifFalse: [ aCollectionOfPairs
				pairsDo: [ :k :v | self instVarNamed: k asString put: (self createInstanceFor: v) ] ]
]

{ #category : #api }
ComposableModel >> isDisplayed [
	"Return true if the widget is currently displayed on screen"
	
	^ self window notNil and: [ self window isDisplayed ]
]

{ #category : #api-focus }
ComposableModel >> keyStrokeForNextFocus: aKMShortcut [

	keyStrokesForNextFocusHolder value: { aKMShortcut }
]

{ #category : #api-focus }
ComposableModel >> keyStrokeForPreviousFocus: aKMShortcut [

	keyStrokesForPreviousFocusHolder value: { aKMShortcut }
]

{ #category : #api-focus }
ComposableModel >> keyStrokesForNextFocus: aCollection [

	keyStrokesForNextFocusHolder value: aCollection
]

{ #category : #api-focus }
ComposableModel >> keyStrokesForPreviousFocus: aCollection [

	keyStrokesForPreviousFocusHolder value: aCollection 
]

{ #category : #accessing }
ComposableModel >> needRebuild [

	^ needRebuild value
]

{ #category : #accessing }
ComposableModel >> needRebuild: aBoolean [

	needRebuild value: aBoolean
]

{ #category : #api }
ComposableModel >> neglectMenuModel: aMenuModel [

	aMenuModel menuGroups do: [ :group |
		group menuItems do: [ :item |
			item shortcut ifNotNil: [ :shortcut | self removeMenuKeyCombination: shortcut ].
			item subMenu ifNotNil: [ :subMenu | subMenu neglect: self	] ] ]
]

{ #category : #widgets }
ComposableModel >> newButton [
	^ self instantiate: ButtonModel
]

{ #category : #widgets }
ComposableModel >> newCheckBox [
	^ self instantiate: CheckBoxModel
]

{ #category : #widgets }
ComposableModel >> newCode [
	^ (self instantiate: TextModel)
		beForCode;
		yourself
]

{ #category : #widgets }
ComposableModel >> newDiff [
	^ self instantiate: DiffModel
]

{ #category : #widgets }
ComposableModel >> newDropList [
	^ self instantiate: DropListModel
]

{ #category : #widgets }
ComposableModel >> newIconList [
	^ self instantiate: IconListModel
]

{ #category : #widgets }
ComposableModel >> newImage [
	^ self instantiate: ImageModel
]

{ #category : #widgets }
ComposableModel >> newLabel [
	^ self instantiate: LabelModel
]

{ #category : #widgets }
ComposableModel >> newList [
	^ self instantiate: ListModel
]

{ #category : #widgets }
ComposableModel >> newMultiColumnList [
	^ self instantiate: MultiColumnListModel
]

{ #category : #widgets }
ComposableModel >> newRadioButton [
	^ self instantiate: RadioButtonModel
]

{ #category : #widgets }
ComposableModel >> newSlider [
	^ self instantiate: SliderModel
]

{ #category : #widgets }
ComposableModel >> newTab [
	^ self instantiate: TabModel
]

{ #category : #widgets }
ComposableModel >> newTabManager [
	^ self instantiate: TabManagerModel
]

{ #category : #widgets }
ComposableModel >> newText [
	^ self instantiate: TextModel
]

{ #category : #widgets }
ComposableModel >> newTextInput [
	^ self instantiate: TextInputFieldModel
]

{ #category : #widgets }
ComposableModel >> newTree [
	^ self instantiate: TreeModel
]

{ #category : #private }
ComposableModel >> okToChange [

	^ owner 
		ifNil: [
			self canDiscardEdits ifTrue: [^ true].
			self changed: #wantToChange.  "Solicit cancel from view"
			^ self canDiscardEdits]
		ifNotNil: [ owner okToChange ]
]

{ #category : #api-shortcuts }
ComposableModel >> on: aShortcut do: aBlock [

	self bindKeyCombination: aShortcut toAction: aBlock
]

{ #category : #api-announcements }
ComposableModel >> on: anAnnouncement send: aSelector [ to: aTarget

	self announcer
		when: anAnnouncement 
		send: aSelector 
		to: aTarget
]

{ #category : #api }
ComposableModel >> openDialogWithSpec [
	"Build the widget using the default spec and display it into a window"

	^ self openDialogWithSpec: self defaultSpecSelector.
]

{ #category : #api }
ComposableModel >> openDialogWithSpec: aSpec [
	"Build the widget using the spec name provided as argument and display it into a window"

	^ self openDialogWithSpecLayout: (self retrieveSpec: aSpec)
]

{ #category : #api }
ComposableModel >> openDialogWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument and display it into a window"

	(window value notNil and: [ self needRebuild not ])
		ifTrue: [
			window value rebuildWithSpec: aSpec ]
		ifFalse: [
			window value: (DialogWindowModel new model: self).
			window value openWithSpecLayout: aSpec.
			self initializeDialogWindow: window value.
			window value updateTitle.
			self takeKeyboardFocus ].
		
	^ window value
]

{ #category : #api }
ComposableModel >> openWithSpec [
	"Build the widget using the default spec and display it into a window"

	^ self openWithSpec: self defaultSpecSelector.
]

{ #category : #api }
ComposableModel >> openWithSpec: aSpec [
	"Build the widget using the spec name provided as argument and display it into a window"

	^ self openWithSpecLayout: (self retrieveSpec: aSpec)
]

{ #category : #api }
ComposableModel >> openWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument and display it into a window"

	(window value notNil and: [ self needRebuild not ])
		ifTrue: [
			window value rebuildWithSpecLayout: aSpec ]
		ifFalse: [ 
			window value: (self defaultWindowModelClass new model: self).
			window value openWithSpecLayout: aSpec.
			self takeKeyboardFocus ].
		
	^ window value
]

{ #category : #accessing }
ComposableModel >> owner [

	^ owner
]

{ #category : #accessing }
ComposableModel >> owner: anObject [

	owner := anObject.
]

{ #category : #private }
ComposableModel >> privateAdapterFromModel: aModel withSpec: aSpec [
	"apparently when looking at the implementation, it does not return a widget but an adapter so it should be called adapter :)"
	^ SpecInterpreter private_buildWidgetFor: self withSpec: aSpec.
]

{ #category : #private }
ComposableModel >> private_buildWithSpec [
	"Build the widget using the default spec"
	
	^ self private_buildWithSpec: self defaultSpecSelector
]

{ #category : #private }
ComposableModel >> private_buildWithSpec: aSpec [
	"Build the widget using the spec name provided as argument"
	| adapter |
	adapter := self privateAdapterFromModel: self withSpec: aSpec.
	self setExtentAndBindingTo: adapter widget.	
	^ adapter
]

{ #category : #private-focus }
ComposableModel >> registerKeyStrokesForNextFor: aWidget [

	aWidget ifNil: [ ^ self ].
	
	self eventKeyStrokesForNextFocus do: [:each |
		aWidget bindKeyCombination: each toAction: [ self giveFocusToNextFrom: self ] ]
]

{ #category : #private-focus }
ComposableModel >> registerKeyStrokesForPreviousFor: aWidget [

	aWidget ifNil: [ ^ self ].
	
	self eventKeyStrokesForPreviousFocus do: [:each |
		aWidget bindKeyCombination: each toAction: [ self giveFocusToPreviousFrom: self ] ]
]

{ #category : #api-shortcuts }
ComposableModel >> removeKeyCombination: aShortcut [

	additionalKeyBindings 
		removeKey: aShortcut 
		ifAbsent: [ ^ self ].
	
	self changed: #removeKeyCombination: with: { aShortcut }
]

{ #category : #api-shortcuts }
ComposableModel >> removeMenuKeyCombination: aShortcut [

	additionalKeyBindings 
		removeKey: aShortcut 
		ifAbsent: [ ^ self ].
	
	self changed: #removeMenuKeyCombination: with: { aShortcut }
]

{ #category : #'instance creation' }
ComposableModel >> resolveSymbol: aSymbol [

	^ Smalltalk at: aSymbol
]

{ #category : #api }
ComposableModel >> retrieveSpec: aSelector [
	| layout |
	
	layout := self class perform: aSelector.
	layout isSpecLayout ifTrue: [ layout selector: aSelector ].
	^ layout
]

{ #category : #api }
ComposableModel >> setExtentAndBindingTo: widget [

	self ensureExtentFor: widget.
	self ensureKeyBindingsFor: widget.
	self announce: (WidgetBuilt model: self widget: widget).
	
]

{ #category : #api }
ComposableModel >> setModal: aWindow [ 
	
	self changed: #setModal: with: { aWindow }
]

{ #category : #api }
ComposableModel >> show [

	self widget ifNotNil: [:widget |
		(widget respondsTo: #show) ifTrue: [ widget show ]].
]

{ #category : #accessing }
ComposableModel >> spec [

	^ spec
]

{ #category : #accessing }
ComposableModel >> spec: aSpec [

	spec := aSpec
]

{ #category : #api }
ComposableModel >> specSelectors [
	"Return all the spec names"
	
	^ self class specSelectors
]

{ #category : #private-focus }
ComposableModel >> takeKeyboardFocus [

	self focusOrder ifNotEmpty:[:focus | ^ focus first takeKeyboardFocus ].
	^ self changed: #takeKeyboardFocus with: #()
]

{ #category : #private-focus }
ComposableModel >> takeLastKeyboardFocus [

	self focusOrder
		ifEmpty: [ self takeKeyboardFocus ]
		ifNotEmpty: [:focus | focus last takeKeyboardFocus ].
]

{ #category : #api }
ComposableModel >> title [
	"Return the window's title"

	^ titleHolder value
]

{ #category : #api }
ComposableModel >> title: aString [

	titleHolder value: aString
]

{ #category : #private }
ComposableModel >> update: aParameter [

	self changed: aParameter
]

{ #category : #api }
ComposableModel >> updateTitle [
	"Update the window title"

	self window ifNotNil: [:w | w updateTitle ]
]

{ #category : #api-events }
ComposableModel >> whenBuiltDo: aBlock [

	self announcer 
		when: WidgetBuilt
		do: aBlock
]

{ #category : #api-events }
ComposableModel >> whenShortcutsChanged: aBlock [
	"Set a block to value when the shortcuts block has changed"
	additionalKeyBindings whenChangedDo: aBlock
]

{ #category : #api-events }
ComposableModel >> whenWindowChanged: aBlock [

	window whenChangedDo: aBlock
]

{ #category : #accessing }
ComposableModel >> widget [

	^ spec
		ifNil: [ nil ]
		ifNotNil: [:s | s instance ]
]

{ #category : #accessing }
ComposableModel >> window [

	^ window value
		ifNil: [
			owner
				ifNil: [ nil ]
				ifNotNil: [:o | o window ]]
]

{ #category : #api }
ComposableModel >> windowIcon [

	^ windowIcon value
]

{ #category : #api }
ComposableModel >> windowIcon: aForm [

	windowIcon value: aForm
]
