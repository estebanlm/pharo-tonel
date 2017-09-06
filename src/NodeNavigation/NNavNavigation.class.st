"
I'm the one who manage the navigation and I have memory from what I've been navigating
"
Class {
	#name : #NNavNavigation,
	#superclass : #Object,
	#instVars : [
		'currentEditor',
		'lastSelection',
		'currentSelection'
	],
	#classVars : [
		'Instance',
		'UseArrowsShortcuts'
	],
	#category : #NodeNavigation-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation class>>new [
	"yes I'm a singleton"
	Instance ifNil: [Instance := super new].
	^Instance. 
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation class>>useArrowsShortcuts [
	^UseArrowsShortcuts ifNil: [ false ]

]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation class>>useArrowsShortcuts: enable [
	UseArrowsShortcuts := enable.
	KMRepository reset.

]

{
	#category : #current-context,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>bestNodeForSelection [
	| root |
	
	currentEditor isWorkspace 
		ifTrue: [root := RBParser parseFaultyExpression: self currentText]
		ifFalse:  [root := RBParser parseFaultyMethod: self currentText]. 
	^ root bestNodeFor: self textSelection .	
]

{
	#category : #current-context,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>currentText [
	^ self textArea text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>lastSelection [
	^ lastSelection
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>navigate: editor direction: direction [
	| newSelection |

	currentEditor  := editor.
	newSelection := direction findSelectionFor: self.
	newSelection ifNil: [ ^self ].
	self textArea selectFrom: newSelection first to: newSelection last.
	self updateState: newSelection .


]

{
	#category : #current-context,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>textArea [
	^ currentEditor sourceTextArea 
]

{
	#category : #current-context,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>textSelection  [
	^ self textArea selectionInterval
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavNavigation>>updateState: newSelection [

	newSelection = currentSelection ifFalse: [ lastSelection := currentSelection].
	currentSelection := newSelection.
	currentEditor := nil.
	
]
