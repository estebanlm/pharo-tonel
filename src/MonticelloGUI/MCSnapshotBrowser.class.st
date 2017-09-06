"
Browser for snapshots
"
Class {
	#name : #MCSnapshotBrowser,
	#superclass : #MCCodeTool,
	#instVars : [
		'categorySelection',
		'classSelection',
		'protocolSelection',
		'methodSelection',
		'switch'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser class>>forSnapshot: aSnapshot [
	^ self new snapshot: aSnapshot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>allClassNames [
	^ (items 
		select: [:ea | (ea isOrganizationDefinition | ea isScriptDefinition) not]
		thenCollect: [:ea | ea className]) asSet.

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>buttonSpecs [
	^ #(('instance' switchBeInstance 'show instance' buttonEnabled switchIsInstance)
		('?' switchBeComment 'show comment' buttonEnabled switchIsComment)
		('class' switchBeClass 'show class' buttonEnabled switchIsClass))
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>categoryList [
	^ self visibleCategories
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>categoryListMenu: aMenu  [
	categorySelection
		ifNotNil: [aMenu
				add: (categorySelection = '*Extensions'
						ifTrue: ['Load all extension methods']
						ifFalse: ['Load class category {1}' format: {categorySelection}])
				selector: #loadCategorySelection].
	^ aMenu
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>categorySelection [
	^ categorySelection ifNil: [0] ifNotNil: [self visibleCategories indexOf: categorySelection]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>categorySelection: aNumber [
	categorySelection := aNumber = 0 ifFalse: [self visibleCategories at: aNumber].
	self classSelection: 0.
	self changed: #categorySelection;
		changed: #classList.

]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>classCommentString [
	^ items
		detect: [ :ea | ea isClassDefinition and: [ ea className = classSelection ] ]
		ifFound: [ :classDefinition | classDefinition comment ]
		ifNone: [ '' ]
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>classDefinitionString [
	| defs |
	defs := items select: [:ea | (ea isClassDefinition or: [ea isClassDefinitionExtension])
			and: [ea className = classSelection]].

	defs isEmpty ifTrue: [^ 'This class is defined elsewhere.'].

	^ String streamContents: [:stream | 
		defs asArray sort 
			do: [:ea | ea printDefinitionOn: stream]
			separatedBy: [stream nextPut: $.; cr]
	].
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>classList [
	^ self visibleClasses
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>classListMenu: aMenu  [
	classSelection ifNil: [ ^aMenu ].
	super classListMenu: aMenu.
	aMenu
		addLine;
		add: ('Load class {1}'  format: {classSelection})
		selector: #loadClassSelection.
	^ aMenu
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>classSelection [
	^ classSelection ifNil: [0] ifNotNil: [self visibleClasses indexOf: classSelection]
]

{
	#category : #selecting,
	#timestamp : 'EstebanLorenzano 9/4/2017 12:18'
}
MCSnapshotBrowser>>classSelection: aNumber [
	classSelection := aNumber = 0 ifFalse: [self visibleClasses at: aNumber].
	self protocolSelection: 0.
	self changed: #classSelection; 
		changed: #protocolList;
		changed: #methodDefList.

]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>defaultLabel [
	^ 'Snapshot Browser'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>extensionClassNames [
	^ (self allClassNames difference: self packageClassNames) asSortedCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>extensionsCategory [
	^ '*Extensions'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>hasExtensions [
	^self extensionClassNames notEmpty
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>initialExtent [
	^ 650@400.
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>inspectSelection [
	^ self methodSelection inspect
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>loadCategorySelection [
	"Load the entire selected category"
	categorySelection ifNil: [ ^self ].
	self methodsForSelectedClassCategory do: [ :m | m load ].
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>loadClassSelection [
	classSelection ifNil: [ ^self ].
	(self packageClasses detect: [ :ea | ea className = classSelection ] ifNone: [ ^self ]) load.
	self methodsForSelectedClass do: [ :m | m load ].
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>loadMethodSelection [
	methodSelection ifNil: [ ^self ].
	methodSelection load.
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>loadProtocolSelection [
	protocolSelection ifNil: [ ^self ].
	self methodsForSelectedProtocol do: [ :m | m load ].
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>metaclassDefinitionString [
	| defs |
	defs := items select: [:ea | (ea isClassDefinition or: [ea isClassDefinitionExtension])
			and: [ea className = classSelection]].

	defs isEmpty ifTrue: [^ 'This class is defined elsewhere.'].

	^ String streamContents: [:stream | 
		defs asArray sort 
			do: [:ea | ea printClassDefinitionOn: stream]
			separatedBy: [stream nextPut: $.; cr]
	].
]

{
	#category : #listing,
	#timestamp : 'EstebanLorenzano 9/4/2017 12:18'
}
MCSnapshotBrowser>>methodDefList [
	^ self visibleMethods collect: [:ea | ea selector]
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodListMenu: aMenu  [
	super methodListMenu: aMenu.
	( self selectedMessageName notNil and: [ methodSelection isLoadable ] )
		ifTrue: [ aMenu addLine; add: 'Load method' selector: #loadMethodSelection ].
	^ aMenu
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodSelection [
	^ methodSelection
			ifNil: [0] 
			ifNotNil: [self visibleMethods indexOf: methodSelection]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodSelection: aNumber [
	methodSelection := aNumber = 0 ifFalse: [self visibleMethods at: aNumber].
	self changed: #methodSelection; changed: #text.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodsForSelectedClass [
	^ items select: [:ea | (ea className = classSelection) 
							and: [ea isMethodDefinition
									and: [ea classIsMeta = self switchIsClass]]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodsForSelectedClassCategory [
	| visibleClasses |
	visibleClasses := self visibleClasses.
	^ items select: [:ea | (visibleClasses includes: ea className) 
								and: [ea isMethodDefinition
									and: [ea classIsMeta = self switchIsClass]]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>methodsForSelectedProtocol [
	| methods |
	protocolSelection ifNil: [^ Array new].
	methods := self methodsForSelectedClass asOrderedCollection.
	(protocolSelection = '-- all --') 
		ifFalse: [methods removeAllSuchThat: [:ea | ea category ~= protocolSelection]].
	^ methods 
	
								
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>packageClassNames [
	^ self packageClasses collect: [:ea | ea className]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>packageClasses [
	^ items select: [:ea | ea isClassDefinition]
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>packageOrganizations [
	^ items select: [:ea | ea isOrganizationDefinition]
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>protocolList [
	^ self visibleProtocols
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>protocolListMenu: aMenu  [
	protocolSelection
		ifNotNil: [aMenu
				add: ('Load protocol ''{1}''' format: {protocolSelection})
				selector: #loadProtocolSelection ].
	^ aMenu
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>protocolSelection [
	^ protocolSelection 
		ifNil: [0]
		ifNotNil: [self visibleProtocols indexOf: protocolSelection]
]

{
	#category : #selecting,
	#timestamp : 'EstebanLorenzano 9/4/2017 12:18'
}
MCSnapshotBrowser>>protocolSelection: anInteger [
	protocolSelection := (anInteger = 0 ifFalse: [self visibleProtocols at: anInteger]).
	self methodSelection: 0.
	self changed: #protocolSelection;
		changed: #methodDefList.
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>scriptDefinitionString [
	| defs |
	defs := items select: [:ea | ea isScriptDefinition].
	defs isEmpty ifTrue: [^'(package defines no scripts)'].
	
	^ String streamContents: [:stream | 
		defs asArray sort 
			do: [:ea | stream nextPutAll: '---------- package ';
					nextPutAll: ea scriptSelector;
					nextPutAll: ' ----------'; cr;
					nextPutAll: ea script; cr]
			separatedBy: [stream cr]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>selectedClass [
	classSelection ifNil: [ ^ nil ].
	^ Smalltalk globals at: classSelection ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>selectedClassOrMetaClass [
	| class |
	classSelection ifNil: [ ^ nil ].
	class := Smalltalk globals at: classSelection ifAbsent: [ ^ nil ].
	^ self switchIsClass
		ifTrue: [ class class ]
		ifFalse: [ class ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>selectedMessageCategoryName [
	^protocolSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>selectedMessageName [
	^methodSelection ifNotNil: [^ methodSelection selector ].

]

{
	#category : #switch,
	#timestamp : 'EstebanLorenzano 9/4/2017 12:18'
}
MCSnapshotBrowser>>signalSwitchChanged [
	self protocolSelection: 0.
	self 
		changed: #switchIsInstance;
		changed: #switchIsComment;
		changed: #switchIsClass;
		changed: #protocolList;
		changed: #methodDefList;
		changed: #text.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>snapshot: aSnapshot [
	items := aSnapshot definitions asSortedCollection.
	self categorySelection: 0.
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchBeClass [
	switch := #class.
	self signalSwitchChanged.
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchBeComment [
	switch := #comment.
	self signalSwitchChanged.
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchBeInstance [
	switch := #instance.
	self signalSwitchChanged.
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchIsClass [
	^ switch = #class
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchIsComment [
	^ switch = #comment.
]

{
	#category : #switch,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>switchIsInstance [
	switch ifNil: [switch := #instance].
	^ switch = #instance.
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>text [
	self switchIsComment ifTrue: [ ^ self classCommentString ].
	methodSelection ifNotNil: [ ^ methodSelection source ].
	protocolSelection ifNotNil: [ ^ '' ].
	classSelection ifNotNil: [
		^ self switchIsClass 
			ifTrue: [ self metaclassDefinitionString ]
			ifFalse: [ self classDefinitionString ] ].
	categorySelection ifNil: [ ^ self scriptDefinitionString ].
	^ ''
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>text: aTextOrString [
	self changed: #text
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>visibleCategories [
	^ ((self packageOrganizations flatCollect: [ :ea | ea categories ]),
		(self packageClasses collect: [ :ea | ea category ]),
			(self hasExtensions ifTrue: [{ self extensionsCategory }] ifFalse: [#()]))
				asSet asSortedCollection
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>visibleClasses [
	^ categorySelection = self extensionsCategory
		ifTrue: [self extensionClassNames]
		ifFalse: [self packageClasses
					select: [:ea | ea category = categorySelection]
					thenCollect: [:ea | ea className]].
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>visibleMethods [
	^ classSelection 
		ifNil: [#()]
		ifNotNil: [self methodsForSelectedProtocol]
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSnapshotBrowser>>visibleProtocols [
	| methods protocols |
	self switchIsComment ifTrue: [^ Array new].
	methods := self methodsForSelectedClass.
	protocols := (methods collect: [:ea | ea category]) asSet asSortedCollection.
	protocols add: AllProtocol defaultName.
	^ protocols 
]

{
	#category : #'morphic ui',
	#timestamp : 'EstebanLorenzano 9/4/2017 12:18'
}
MCSnapshotBrowser>>widgetSpecs [

	 ^#(
		((listMorph: category) (0 0 0.25 0.4))
		((listMorph: class) (0.25 0 0.50 0.4) (0 0 0 -30))
		((listMorph: protocol) (0.50 0 0.75 0.4))
		((listMorph:selection:menu:keystroke:  #methodDefList methodSelection methodListMenu: methodListKey:from:) (0.75 0 1 0.4))
		((buttonRow) (0.25 0.4 0.5 0.4) (0 -30 0 0))
		((textMorph: text) (0 0.4 1 1))
		) 
]
