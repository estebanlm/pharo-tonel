"
A ListDialogWindow is a dialog window used to search an element into a list.
A text field is provided to on the fly reduce the field or search
"
Class {
	#name : #ListDialogWindow,
	#superclass : #MessageDialogWindow,
	#instVars : [
		'pattern',
		'list',
		'searchMorph',
		'listMorph',
		'listIndex',
		'answer',
		'listBlock',
		'listCreationProcess',
		'displayBlock',
		'browseBlock',
		'acceptNewEntry'
	],
	#classInstVars : [
		'searchList'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow class>>chooseFromOwner: aMorph [

	^ self new chooseFromOwner: aMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow class>>searchList [
	^ searchList ifNil: [ searchList := OrderedCollection new ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>accept: anItem [
	self answer: anItem.
	self ok.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>acceptNewEntry [

	^ acceptNewEntry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>acceptNewEntry: aBoolean [

	acceptNewEntry := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>answer [
	^ answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>answer: anObject [
	answer := anObject
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>browseAction [
	| aString tmp block |
	aString := searchMorph content.
	list detect: [ :item | (self displayItem: item) = aString ] ifFound: [ :item | self accept: item ].
	tmp := answer.
	block := self browseBlock.
	[ block value: tmp ] fork.
	self cancel
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>browseBlock [

	^ browseBlock
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>browseBlock: aBlock [

	browseBlock := aBlock
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>buildBrowseButton [

	^ (PluggableButtonMorph
		on: self
		getState: #state
		action: #browseAction)
		label: 'Browse';
		yourself
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>buildListMorph [
	^ listMorph := PluggableListMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		on: self
			list: #list
			selected: #listIndex
			changeSelected: #listIndex:
			menu: nil
			keystroke: nil;
		keystrokeSelector: #listKeystroke:;
		doubleClickSelector: #doubleClickOk;
		wrapSelector: #displayItem:;
		yourself
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>buildSearchMorph [
	^ searchMorph := SearchMorph new
			model: self;
			acceptSelector: #searchAccept:;
			updateSelector: #searchUpdate:;
			searchList: self class searchList;
			keystrokeSelector: #searchKeystroke:
			yourself.	
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>cancel [

	self answer: nil.
	super cancel
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>chooseFromOwner: aMorph [

	aMorph openModal: self.
	^ self answer
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>defaultFocusMorph [

	^ searchMorph
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>displayBlock [

	^ displayBlock
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>displayBlock: aBlock [

	displayBlock := aBlock
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>displayItem: anItem [

	^ self displayBlock cull: anItem cull: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>doubleClickOk [
	self listIndex ~= 0
		ifTrue: [ self ok ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>getList: aSymbolOrBlockWithOneArgument [
	aSymbolOrBlockWithOneArgument isBlock
		ifTrue: [ listBlock := aSymbolOrBlockWithOneArgument. ^ self updateList ].
	aSymbolOrBlockWithOneArgument isSymbol 
		ifTrue: [ 
			listBlock := [ :regex| model perform: aSymbolOrBlockWithOneArgument with: regex].
			^ self updateList].
	Error signal: 'invalid argument'.
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>giveFocusToList [
	list ifEmpty: [ ^ self giveFocusToSearch].
	
	self listIndex: (( listIndex max: 1 ) min: list size).
	listMorph takeKeyboardFocus.
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>giveFocusToSearch [
	searchMorph takeKeyboardFocus.
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>initialAnswer: aString [

	searchMorph content: aString.
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>initialExtent [
	^ 300 @ 400
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>initialFilter: aString [
	searchMorph content: aString.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>initialize [

	list := #().
	listIndex := 0.
	isResizeable := true.
	listBlock := [ :regex| #() ].
	displayBlock := [:e | e printString ].
	browseBlock :=  [:tmp | tmp browse ].
	pattern := '.' asRegexIgnoringCase.
	acceptNewEntry := false.
	
	super initialize.

]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>list [
	^ list
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listChanged [
	self changed: #list.
]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listIndex [
	^ listIndex 
]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listIndex: aNumber [
	listIndex := aNumber.
	self answer: (list at: listIndex ifAbsent: [ nil ]).
	self changed: #listIndex.
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listKeystroke: event [
	event keyCharacter = Character arrowUp 
		ifTrue: [ ^ self listKeystrokeUp ].
		
	event keyCharacter = Character arrowDown 
		ifTrue: [ ^ self listKeystrokeDown ].
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listKeystrokeDown [
	listIndex = list size
		ifTrue: [ 
			self listIndex: 0.
			self giveFocusToSearch.
			^ true].
	^ false.
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>listKeystrokeUp [
	listIndex = 1 
		ifTrue: [ 
			self listIndex: 0.
			self giveFocusToSearch.
			^ true].
	^ false.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newOKButton isDefault: true. self buildBrowseButton. self newCancelButton}
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>newContentMorph [
	| panel  |
	panel := PanelMorph new.
	panel layoutPolicy: ProportionalLayout new;
		layoutInset: 0;
		hResizing: #spaceFill;
		vResizing: #spaceFill.					
	panel addMorph: self buildListMorph
			fullFrame: (LayoutFrame identity bottomOffset: -33).
	panel addMorph: self buildSearchMorph
			fullFrame: ((0@1 corner: 1@1) asLayoutFrame topOffset: -30).
	^ panel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>no [
	"overwrite de default"
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>ok [

	(acceptNewEntry and: [ list isEmpty ]) ifTrue: [ 
		self answer: self searchString ].
	
	self answer ifNil: [ self searchAccept: self searchString ].
	
	self 
		cancelled: false;
		delete
]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchAccept: aString [
	self searchUpdate: aString.
	list detect: [ :item | (self displayItem: item) = aString ] ifFound: [ :item | ^ self accept: item ].
	acceptNewEntry
		ifTrue: [ ^ self accept: aString ]
		ifFalse: [ 
			list size = 1
				ifTrue: [ ^ self accept: list first ] ].
	list ifNotEmpty: [ ^ self giveFocusToList ]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchKeystroke: event [
	
	searchMorph content ifNil: [ ^ false ].
	
	(event keyCharacter = Character arrowDown )
		ifTrue: [ ^ self searchKeystrokeDown ].
		
	(event keyCharacter = Character arrowUp)
		ifTrue: [ ^ self searchKeystrokeUp ].
	
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchKeystrokeDown [
	|interval|
	interval := searchMorph selectionInterval .
	((interval last == searchMorph content size)
	and: [ interval last < interval first ])
		ifFalse: [ ^ false ].
		
	self giveFocusToList.
	^ true
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchKeystrokeUp [
	(searchMorph selectionInterval last == 0)
		ifFalse: [ ^ false ].
		
	self listIndex: list size.
	self giveFocusToList.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchString [
	^ searchMorph searchString
]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>searchUpdate: aString [

	pattern := '.' asRegexIgnoringCase.
	
	aString isEmptyOrNil ifFalse: [
		pattern := [aString asRegexIgnoringCase] on: RegexSyntaxError do: [ aString ]].
	
	self updateList.
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>state [

	^ false
]

{
	#category : #'morphic protocol',
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>updateList [
	"update the displayed list in a separate thread to avoid UI blocking"
	
	"if there is already a background thread running for the new list discard it"
	listCreationProcess ifNotNil: [
		listCreationProcess terminate].
	
	"no pattern given => empty list"
	pattern ifNil: [ ^ list :=#() ].
	
	"fork off a possibly costly list calculation"
	listCreationProcess := [
		list := listBlock value: pattern.
		"make sure the ui is updated in a synchronized manner"
		self defer: [self listChanged]] fork.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
ListDialogWindow>>yes [
	"overwrite de default"
]
