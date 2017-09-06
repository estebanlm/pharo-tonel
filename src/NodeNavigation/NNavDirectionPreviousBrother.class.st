"
Go back to the brother before
"
Class {
	#name : #NNavDirectionPreviousBrother,
	#superclass : #NNavDirectionSibling,
	#category : #NodeNavigation-Core,
	#timestamp : '<historical>'
}

{
	#category : #'step over',
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavDirectionPreviousBrother class>>brotherPositionFor: nodePosition brothers: brothers [
	^ nodePosition = 1 ifTrue:  [ brothers size ] ifFalse: [ nodePosition - 1 ].
]

{
	#category : #builder,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavDirectionPreviousBrother class>>buildShortcut: aBuilder [
	<keymap>

	(aBuilder shortcut: #previousSibling) 
		category: #SmalltalkEditor 
		default: self defaultKeyCombination 
		do: [ :morph | morph standOutPreviousChild]
		description: 'Select the node scope reducing to the previous sibling'



]

{
	#category : #builder,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavDirectionPreviousBrother class>>defaultKeyCombination [
	^NNavNavigation useArrowsShortcuts 
		ifTrue: [Character arrowLeft meta  ]
		ifFalse: [ $u meta  ]

]
