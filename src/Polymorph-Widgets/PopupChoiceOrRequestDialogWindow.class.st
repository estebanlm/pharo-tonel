"

"
Class {
	#name : #PopupChoiceOrRequestDialogWindow,
	#superclass : #PopupChoiceDialogWindow,
	#instVars : [
		'okButton'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow class>>minWidth [
	^250
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>extent: aPoint [
	"Make the choices area at least fill the scroll area."
	^super extent: (aPoint x max: self class minWidth)@(aPoint y).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>filter: aString [
	"Set the value of filter used to match the choices.
	Clear any selected items here so that potential requests for
	non-listed items can be handled."
	
	super filter: aString.
	(self choiceMenus ifNil: [^self]) do: [:embeddedMenu |
		embeddedMenu selectItem: nil event: nil]. "clear selection in other menus"

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>filterValue [

	^filter isEmpty
		ifTrue: [ nil ]
		ifFalse: [ filter ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>newButtons [
	"Answer new buttons as appropriate."
	self filterMorph: self newFilterEntry.
	self okButton: self newOKButton.
	^Array 
		with: self filterMorph
		with: self okButton
		with: self newCancelButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>okButton [
	^okButton
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>okButton: aMorph [
	okButton := aMorph
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceOrRequestDialogWindow>>processEnter: anEvent [
	(super processEnter: anEvent)
		ifFalse: [ self okButton performAction ].
		
	^true
]
