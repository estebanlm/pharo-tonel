"
unselectedItems is the original list to search in

selectItems is the list of the selected items
"
Class {
	#name : #DialogItemsChooserUI,
	#superclass : #DialogWindow,
	#instVars : [
		'dialogItemsChooser',
		'selectedItems',
		'selectedItemsModel',
		'unselectedItems',
		'unselectedItemsModel',
		'unselectedItemsSearchingString',
		'selectedItemsSearchingString',
		'unselectedItemsTextArea',
		'selectedItemsTextArea',
		'unselectedSelection',
		'selectedSelectionIndex',
		'selectedSelectionList',
		'unselectedSelectionList',
		'unselectedSelectionIndex'
	],
	#classVars : [
		'AlreadySearchedSelectedItemsList',
		'AlreadySearchedUnselectedItemsList'
	],
	#classInstVars : [
		'alreadySearchedSelectedItemsListMaxSize',
		'alreadySearchedUnselectedItemsListMaxSize'
	],
	#category : #Tool-Finder,
	#timestamp : 'BenjaminVanRyseghem 9/17/2010 00:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>alreadySearchedSelectedItemsListMaxSize [

	^ alreadySearchedSelectedItemsListMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>alreadySearchedSelectedItemsListMaxSize: anObject [
	anObject ifNil: [^self].
	alreadySearchedSelectedItemsListMaxSize := anObject.
	self allInstancesDo: [:each | each alreadySearchedSelectedItemsListMaxSize: anObject]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>alreadySearchedUnselectedItemsListMaxSize [

	^ alreadySearchedUnselectedItemsListMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>alreadySearchedUnselectedItemsListMaxSize: anObject [
	anObject ifNil: [^self].
	alreadySearchedUnselectedItemsListMaxSize := anObject.
	self allInstancesDo: [:each | each alreadySearchedUnselectedItemsListMaxSize: anObject]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>dialogItemsChooserSettingsOn: aBuilder [
	<systemsettings>
		(aBuilder group: #dialogItemsChooser)
		target: self;
		label: 'Items Chooser Dialog Window';
		parent: #morphic;
		description: 'Settings related to the Dialog Window for choosing elements among a list' ;
			with: [
				(aBuilder setting: #alreadySearchedUnselectedItemsListMaxSize)
					label: 'Number of the Unselected Items in History'.
				(aBuilder setting: #alreadySearchedSelectedItemsListMaxSize)
					label: 'Number of the Selected Items in History'.]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>initialize [
	super initialize.
	alreadySearchedUnselectedItemsListMaxSize := 15.
	alreadySearchedSelectedItemsListMaxSize := 15
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI class>>on: aDialogItemsChooser [
	^self basicNew 
		unselectedItems: aDialogItemsChooser unselectedItems;
		selectedItems: aDialogItemsChooser selectedItems;
		dialogItemsChooser: aDialogItemsChooser;
		initialize.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addAllButtonAction [
	self addAllItems.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addAllButtonLabel [
	^'>>'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addAllButtonState [
	^false
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addAllItems [

	| selection |
	selection := self unselectedItemsProbablyRestricted.
	selection ifEmpty: [^self].
	self unselectedItems removeAll: selection.
	self selectedItems addAll: selection.
	unselectedSelectionList removeAll.
	self unselectedSelectionIndex: 0.
	self
		changed: #selectedItemsProbablyRestricted;
		changed: #hasSelectedItems;
		changed: #unselectedItemsProbablyRestricted;
		changed: #hasUnselectedItems;
		changed: #hasUnselectedSelections
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addButtonAction [
	self addSelectedItems.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addButtonLabel [
	^'>'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addButtonState [
	^false
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addSelectedItems [

	| selection |
	selection := self unselectedSelectionItems.
	selection ifEmpty: [^self].
	self unselectedItems removeAll: selection.
	self selectedItems addAll: selection.
	unselectedSelectionList removeAll.
	self unselectedSelectionIndex: 0.
	self
		changed: #selectedItemsProbablyRestricted;
		changed: #hasSelectedItems;
		changed: #unselectedItemsProbablyRestricted;
		changed: #hasUnselectedItems;
		changed: #hasUnselectedSelections
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addToAlreadySearchedSelectedItemsList: aString [
	self alreadySearchedSelectedItemsList size = self alreadySearchedSelectedItemsListMaxSize
		ifTrue: [self alreadySearchedSelectedItemsList removeLast ].
	self alreadySearchedSelectedItemsList addFirst: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>addToAlreadySearchedUnselectedItemsList: aString [
	self alreadySearchedUnselectedItemsList size = self alreadySearchedUnselectedItemsListMaxSize
		ifTrue: [self alreadySearchedUnselectedItemsList removeLast ].
	self alreadySearchedUnselectedItemsList addFirst: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedSelectedItemsList [
	^AlreadySearchedSelectedItemsList ifNil: [AlreadySearchedSelectedItemsList := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedSelectedItemsListMaxSize [
	^self class alreadySearchedSelectedItemsListMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedSelectedItemsListMaxSize: anInteger [

	[self alreadySearchedSelectedItemsList size > anInteger]
		whileTrue: [self alreadySearchedSelectedItemsList removeLast]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedUnselectedItemsList [
	^AlreadySearchedUnselectedItemsList ifNil: [AlreadySearchedUnselectedItemsList := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedUnselectedItemsListMaxSize [
	^self class alreadySearchedUnselectedItemsListMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>alreadySearchedUnselectedItemsListMaxSize: anInteger [

	[self alreadySearchedUnselectedItemsList size > anInteger]
		whileTrue: [self alreadySearchedUnselectedItemsList removeLast]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>applyChanges [
	self valid
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildAddAllButton [
	"Answer a new button for removing all items
	form the unslected list and adding to the selected list."
	
	^(self
		newButtonFor: self
		getState: #addAllButtonState
		action: #addAllButtonAction 
		arguments: nil
		getEnabled: #hasUnselectedItems
		getLabel: #addAllButtonLabel
		help: nil)
		hResizing: #spaceFill
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildAddButton [
	"Answer a new button for removing selected items
	from the unselected list and adding to the selected list."
	
	^(self
		newButtonFor: self
		getState: #addButtonState
		action: #addButtonAction 
		arguments: nil
		getEnabled: #hasUnselectedSelections
		getLabel: #addButtonLabel
		help: nil)
		hResizing: #spaceFill
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildRemoveAllButton [
	"Answer a new button for removing all items from the
	selected list and adding to the unselected list."
	
	^(self
		newButtonFor: self
		getState: #removeAllButtonState
		action: #removeAllButtonAction
		arguments: nil
		getEnabled: #hasSelectedItems
		getLabel: #removeAllButtonLabel
		help: nil)
		hResizing: #spaceFill
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildRemoveButton [
	"Answer a new button for removing selected items
	from the selected list and adding to the unselected list."
	
	^(self
		newButtonFor: self
		getState: #removeButtonState
		action: #removeButtonAction 
		arguments: nil
		getEnabled: #hasSelectedSelections
		getLabel: #removeButtonLabel
		help: nil)
		hResizing: #spaceFill
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildSelectedItemsList [

	^(PluggableListMorph
		on: self 
		list: #selectedItemsProbablyRestricted 
		primarySelection: #selectedSelectionIndex
		changePrimarySelection: #selectedSelectionIndex:
		listSelection: #selectedSelectionAt:
		changeListSelection: #selectedSelectionAt:put:
		menu: nil)
			hResizing: #spaceFill;
			vResizing: #spaceFill.
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildSelectedItemsSearchingTextArea: aWindow [

	^aWindow
		newAutoAcceptTextEntryFor: self
		get: #selectedItemsSearchingString
		set: #selectedItemsSearchingString:
		class: String
		getEnabled: nil
		help: 'Enter the name of a package' translated
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildUnselectedItemsList [

	^(PluggableListMorph
		on: self 
		list: #unselectedItemsProbablyRestricted 
		primarySelection: #unselectedSelectionIndex
		changePrimarySelection: #unselectedSelectionIndex:
		listSelection: #unselectedSelectionAt:
		changeListSelection: #unselectedSelectionAt:put:
		menu: nil)
			hResizing: #spaceFill;
			vResizing: #spaceFill.
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>buildUnselectedItemsSearchingTextArea: aWindow [

	^aWindow
		newAutoAcceptTextEntryFor: self
		get: #unselectedItemsSearchingString
		set: #unselectedItemsSearchingString:
		class: String
		getEnabled: nil
		help: 'Enter the name of a package' translated
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>cancelButtonLabel [
	^'Cancel'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>cancelButtonState [
	^false
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>centering [
	self left: ((World width / 2) - (self width /2)) rounded.
	self top: ((World height / 2) - (self height /2)) rounded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>dialogItemsChooser [
	^ dialogItemsChooser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>dialogItemsChooser: aDialogItemsChooser [
	dialogItemsChooser := aDialogItemsChooser
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>hasSelectedItems [
	"Answer whether the selected list has items."

	^self selectedItems notEmpty
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>hasSelectedSelections [
	"Answer whether the selected list has selected items."

	^selectedSelectionList anySatisfy: [:selected | selected]
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>hasUnselectedItems [
	"Answer whether the unselected list has items."

	^self unselectedItems notEmpty
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>hasUnselectedSelections [
	"Answer whether the unselected list has selected items."

	^unselectedSelectionList anySatisfy: [:selected | selected]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>initialize [

	unselectedItemsSearchingString := String new.
	selectedItemsSearchingString := String new.
	selectedSelectionList := Dictionary new.
	unselectedSelectionList := Dictionary new.
	
	super initialize.
	
	self vResizing: #shrinkWrap.
	self hResizing: #shrinkWrap.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>isResizeable [
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>msgPaneMenu: aMenu shifted: shifted [
	| donorMenu |
	
	donorMenu := shifted
		ifTrue: [SmalltalkEditor shiftedYellowButtonMenu]
		ifFalse: [SmalltalkEditor yellowButtonMenu].
	^ aMenu addAllFrom: donorMenu
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>newContentMorph [
	| trees unselectedItemsCol selectedItemsCol buttons |
	buttons := (self newGroupboxFor: (
		(self newColumn: {
			self buildAddAllButton.
			self buildAddButton.
			self buildRemoveButton.
			self buildRemoveAllButton})
			vResizing: #shrinkWrap))
		vResizing: #shrinkWrap.
	
	unselectedItemsCol := self newGroupbox: self unselectedLabel for: (self newColumn: {
							self buildUnselectedItemsSearchingTextArea: self.
							self buildUnselectedItemsList.}).
	selectedItemsCol := self newGroupbox: self selectedLabel for: (self newColumn: {
							self buildSelectedItemsSearchingTextArea: self.
							self buildSelectedItemsList.}).
	trees := self newRow: {
					unselectedItemsCol.
					"self newGroupboxFor: self buildUnselectedItemsTree."
					buttons hResizing: #shrinkWrap.
					selectedItemsCol}.
	^trees vResizing: #spaceFill.

]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>okButtonAction [
	self valid.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>okButtonLabel [
	^'Ok'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>okButtonState [
	^false
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>openInWorld [

	super openInWorld.
	self width: 500.
	self height: 400.
	self centering

]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeAllButtonAction [
	self removeAllItems.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeAllButtonLabel [
	^'<<'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeAllButtonState [
	^false
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeAllItems [

	| selection |
	selection := self selectedItemsProbablyRestricted.
	selection ifEmpty: [^self].
	self selectedItems removeAll: selection.
	self unselectedItems addAll: selection.
	selectedSelectionList removeAll.
	self selectedSelectionIndex: 0.
	self
		changed: #selectedItemsProbablyRestricted;
		changed: #hasSelectedItems;
		changed: #hasSelectedSelections;
		changed: #unselectedItemsProbablyRestricted;
		changed: #hasUnselectedItems
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeButtonAction [
	self removeSelectedItems.
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeButtonLabel [
	^'<'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeButtonState [
	^false
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>removeSelectedItems [

	| selection |
	selection := self selectedSelectionItems.
	selection ifEmpty: [^self].
	self selectedItems removeAll: selection.
	self unselectedItems addAll: selection.
	selectedSelectionList removeAll.
	self selectedSelectionIndex: 0.
	self
		changed: #selectedItemsProbablyRestricted;
		changed: #hasSelectedItems;
		changed: #hasSelectedSelections;
		changed: #unselectedItemsProbablyRestricted;
		changed: #hasUnselectedItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>roots: aTree [
	aTree == unselectedItemsModel
		ifTrue: [ ^ self unselectedItemsProbablyRestricted].
	aTree == selectedItemsModel
		ifTrue:[ ^ self selectedItemsProbablyRestricted].
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>searchButtonLabel [
	^'Search'
]

{
	#category : #'buttons creations',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>searchButtonState [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItems [
	^ selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItems: aList [
	selectedItems := aList.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsModel [

	^ selectedItemsModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsModel: anObject [

	selectedItemsModel := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsProbablyRestricted [

	| matcher string |
	string := self selectedItemsSearchingString.
	matcher := string
					ifEmpty: ['*']
					ifNotEmpty: [
						(string last = $*) 
							ifTrue: [string]
							ifFalse:[string, '*']].
	^self selectedItems select: [:each | matcher match: each].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsSearchingString [

	^ selectedItemsSearchingString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsSearchingString: anObject [

	selectedItemsSearchingString := anObject.
	selectedSelectionList removeAll.
	self selectedSelectionIndex: 0.
	self
		changed: #selectedItemsProbablyRestricted;
		changed: #selectedSelectionAt:;
		changed: #selectedSelectionIndex;
		changed: #hasSelectedSelections
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsTextArea [

	^ selectedItemsTextArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedItemsTextArea: anObject [

	selectedItemsTextArea := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedLabel [
	^self dialogItemsChooser isNil
		ifTrue: ['Selected Items' translated]
		ifFalse: [self dialogItemsChooser selectedLabel]
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedSelectionAt: index [

	^selectedSelectionList at: index ifAbsent: [false]
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedSelectionAt: index put: aBoolean [
	"Mark the item as selected or not."
	
	selectedSelectionList at: index put: aBoolean.
	self changed: #hasSelectedSelections
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedSelectionIndex [
	selectedSelectionIndex ifNil: [selectedSelectionIndex := 0].
	^selectedSelectionIndex
]

{
	#category : #selectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedSelectionIndex: anObject [

	selectedSelectionIndex := anObject.
	self changed: #selectedSelectionIndex
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>selectedSelectionItems [

	| result |
	result := OrderedCollection new.
	self selectedItemsProbablyRestricted doWithIndex: [:item :index |
		(self selectedSelectionAt: index)
			ifTrue: [result add: item]].
	^result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItems [
	^unselectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItems: anOrderedCollection  [
	
	unselectedItems := anOrderedCollection.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsModel [

	^ unselectedItemsModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsModel: anObject [

	unselectedItemsModel := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsProbablyRestricted [

	| matcher string |
	string := self unselectedItemsSearchingString.
	matcher := string
					ifEmpty: ['*']
					ifNotEmpty: [
						(string last = $*) 
							ifTrue: [string]
							ifFalse:[string, '*']].
	^self unselectedItems select: [:each | matcher match: each].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsSearchingString [

	^ unselectedItemsSearchingString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsSearchingString: anObject [

	unselectedItemsSearchingString := anObject.
	unselectedSelectionList removeAll.
	self unselectedSelectionIndex: 0.
	self
		changed: #unselectedItemsProbablyRestricted;
		changed: #unselectedSelectionAt:;
		changed: #unselectedSelectionIndex;
		changed: #hasUnselectedSelections
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsTextArea [
	^unselectedItemsTextArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedItemsTextArea: anObject [

	unselectedItemsTextArea := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedLabel [
	^self dialogItemsChooser isNil
		ifTrue: ['Unselected Items' translated]
		ifFalse: [self dialogItemsChooser unselectedLabel]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelection [
	unselectedSelection ifNil: [unselectedSelection := 0].
	^unselectedSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelection: anObject [

	unselectedSelection := anObject
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionAt: index [

	^unselectedSelectionList at: index ifAbsent: [false]
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionAt: index Put: anObject [
	unselectedSelectionList at: index put: anObject
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionAt: index put: aBoolean [
	"Mark the item as selected or not."
	
	unselectedSelectionList at: index put: aBoolean.
	self changed: #hasUnselectedSelections
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionIndex [
	unselectedSelectionIndex ifNil: [unselectedSelectionIndex := 0].
	^unselectedSelectionIndex
]

{
	#category : #unselectedList,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionIndex: anObject [

	unselectedSelectionIndex := anObject.
	self changed: #unselectedSelectionIndex
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>unselectedSelectionItems [

	| result |
	result := OrderedCollection new.
	self unselectedItemsProbablyRestricted doWithIndex: [:item :index |
		(self unselectedSelectionAt: index)
			ifTrue: [result add: item]].
	^result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooserUI>>valid [
	self dialogItemsChooser sendSelection
]
