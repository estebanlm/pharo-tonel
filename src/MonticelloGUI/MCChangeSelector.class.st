"
Monticello selector for changes
"
Class {
	#name : #MCChangeSelector,
	#superclass : #MCPatchBrowser,
	#instVars : [
		'kept'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:52'
}

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>buttonSpecs [
	^ #((Select select 'Select these changes')
		 (Cancel cancel 'Cancel the operation')
		)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>cancel [
	self answer: nil
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>defaultLabel [
	^ 'Change Selector'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>kept [
	^ kept ifNil: [kept := Set new]
]

{
	#category : #multi-selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>listSelectionAt: aNumber [
	^ self kept includes: (self items at: aNumber)
]

{
	#category : #multi-selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>listSelectionAt: aNumber put: aBoolean [
	| item |
	item := self items at: aNumber.
	aBoolean
		ifTrue: [self kept add: item ]
		ifFalse: [self kept remove: item ifAbsent: []]
]

{
	#category : #emulating,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>select [
	self answer: (MCPatch operations: kept)
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>selectAll [
	kept addAll: self items.
	self changed: #list
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>selectNone [
	kept := Set new.
	self changed: #list
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCChangeSelector>>widgetSpecs [
	 ^#(
		((buttonRow) (0 0 1 0) (0 0 0 30))
		((multiListMorph:selection:listSelection:menu: list selection listSelectionAt: methodListMenu:) (0 0 1 0.4) (0 30 0 0))
		((buttonRow: #(('Select All' selectAll 'select all changes') ('Select None' selectNone 'select no changes'))) (0 0.4 1 0.4) (0 0 0 30))
		((textMorph: text) (0 0.4 1 1) (0 30 0 0))
		)

	
]
