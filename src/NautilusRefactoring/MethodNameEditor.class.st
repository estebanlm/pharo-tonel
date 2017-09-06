"
A MethodNameEditor is an editor to set the name of a method.
This class is imported from OB.

Maybe it should be redone with Spec, but since it works well, I will not put more energy here.
"
Class {
	#name : #MethodNameEditor,
	#superclass : #DialogWindow,
	#instVars : [
		'argumentIndex',
		'labelMorph',
		'methodName',
		'selectorField'
	],
	#category : #NautilusRefactoring-Utilities,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor class>>on: aMethodName [
	^ self basicNew initializeOn: aMethodName
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor class>>openOn: aMethodName [
	^ UITheme builder openModal: (self on: aMethodName)
]

{
	#category : #grips,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>addEdgeGrips [
	"Should add these to the front!"
	
	| l r lh |
	lh := self labelHeight.
	l  := WindowEdgeGripMorph new target: self; position: self position; edgeName: #left.
	l layoutFrame topOffset: lh negated + 22.
	r  := WindowEdgeGripMorph new target: self; position: self position; edgeName: #right.
	r layoutFrame topOffset: lh negated + 22.
	self
		addMorph: l;
		addMorph: r

]

{
	#category : #grips,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>addGrips [

	self addEdgeGrips
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>argumentIndex [
	^ argumentIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>argumentIndex: anInteger [
	argumentIndex := anInteger.
	self update
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>argumentList [
	^ self methodName arguments
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>cancel [
	methodName := nil.
	^ super cancel
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>defaultFocusMorph [
	"Answer the morph that should have the keyboard
	focus by default when the dialog is opened."
	
	^ selectorField
		ifNil: [ super defaultFocusMorph ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>down [
	self isDownEnabled ifFalse: [ ^ self ].
	self argumentList swap: self argumentIndex with: self argumentIndex + 1.
	self argumentIndex: self argumentIndex + 1
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>initialize [

	super initialize.

	self beResizeable
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>initializeOn: aMethodName [
	methodName := aMethodName.
	argumentIndex := 0.
	self initialize.
	self title: 'Method Name'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>isDownEnabled [
	^ self argumentIndex ~= 0 and: [ self argumentIndex + 1 between: 1 and: self argumentList size ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>isOkEnabled [
	^ self methodName isValid
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>isUpEnabled [
	^ self argumentIndex ~= 0 and: [ self argumentIndex - 1 between: 1 and: self argumentList size ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>methodName [
	^ methodName
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>newContentMorph [
	^ (self newRow: {
		self newLabelGroup: {
			'Selector:' -> (selectorField:=(self newTextEntryFor: self getText: #selector setText: #selector: help: nil)
				autoAccept: true;
				on: #keyStroke send: #value:value: to: [:key :morph | key keyCharacter = Character cr ifTrue: [ self ok. true]. false];
				yourself).
			'Arguments:' -> (self newRow: {
				(self newListFor: self list: #argumentList selected: #argumentIndex changeSelected: #argumentIndex: help: nil)
					hResizing: #spaceFill;
					yourself.
				(self newColumn: {
					(self newButtonFor: self action: #up label: 'up'  help: nil)
						getEnabledSelector: #isUpEnabled.
					(self newButtonFor: self action: #down label: 'dn'  help: nil)
						getEnabledSelector: #isDownEnabled })
					hResizing: #shrinkWrap }).
			'Preview:' -> (labelMorph := self newLabel: self methodName printString) } })
 		minWidth: 400;
		yourself
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>newOKButton [
	^ self newOKButtonFor: self getEnabled: #isOkEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>selector [
	^ self methodName selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>selector: aString [
	self methodName selector: aString.
	self update
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>up [
	self isUpEnabled ifFalse: [ ^ self ].
	self argumentList swap: self argumentIndex with: self argumentIndex - 1.
	self argumentIndex: self argumentIndex - 1
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:27'
}
MethodNameEditor>>update [
	self changed: #argumentList; changed: #argumentIndex.
	self changed: #isUpEnabled; changed: #isDownEnabled; changed: #isOkEnabled.
	labelMorph contents: self methodName printString
]
