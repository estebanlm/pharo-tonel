"
I am an abstract class. My subclasses are some functions for a FastTable that need a field when they are use explicitely.

Description
-------------------------------------------------
I act as my superclass but I manage a field. When the user type in the field an Announcement will call #update:

Public API and Key Messages
-------------------------------------------------

- #update: anAnnoucement
	is call when the user type something into the field
	
Example (Should only be create by a FTTableMorph)
-------------------------------------------------

FTFunctionWithField table: (FTTableMorph with: (1 to: 200))

Internal Representation and Key Implementation Points.
-------------------------------------------------

    Instance Variables
	field:		I am the field to display at the bottom of the FTTableMorph
"
Class {
	#name : #FTFunctionWithField,
	#superclass : #FTFunction,
	#instVars : [
		'field'
	],
	#category : #Morphic-Widgets-FastTable-Functions,
	#timestamp : 'CyrilFerlicot 10/27/2015 14:01'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField class>>isAbstract [
	^ self = FTFunctionWithField
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>beExplicite [
	self initializeMorph.
	table
		addMorph: field;
		resizeAllSubviews
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>disable [
	field
		ifNotNil: [ field delete.
			field := nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>fieldHeigh [
	^ StandardFonts defaultFont pixelSize + 10
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>ghostText [
	self subclassResponsibility 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>initializeMorph [
	field := RubScrolledTextModel new newTextField
		hResizing: #spaceFill;
		autoAccept: true;
		withGhostText: self ghostText;
		yourself.
	field model announcer subscribe: RubTextUpdatedInModel send: #textUpdated: to: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>isExplicite [
	^ field isNotNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>resizeContainerFrom: topLeftPoint to: bottomLeftPoint [
	^ topLeftPoint corner: bottomLeftPoint x @ (bottomLeftPoint y - self fieldHeigh)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>resizeWidget [
	| topLeft bottomRight |
	self flag: #TODO.	"Maybe it could be cool to let the user choose if the field need to be at the top or the bottom."
	topLeft := table bounds left @ (table bounds bottom - self fieldHeigh).
	bottomRight := (table bounds right - table verticalScrollBarWidth) @ table bottom.
	field bounds: (topLeft corner: bottomRight)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>showWidget [
	self initializeMorph.
	table
		addMorph: field;
		resizeAllSubviews
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTFunctionWithField>>textUpdated: anAnnouncement [
	
	"do nothing by default"
]
