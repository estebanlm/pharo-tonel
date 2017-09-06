"
Monticello's dialog that allows the user to change the version name and to enter a message for the commit log.
"
Class {
	#name : #MCSaveVersionDialog,
	#superclass : #MCTool,
	#instVars : [
		'name',
		'message'
	],
	#classVars : [
		'PreviousMessages'
	],
	#category : #MonticelloGUI,
	#timestamp : 'ab 9/8/2009 08:24'
}

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog class>>addAsLastLogMessage: aString [

	((self previousMessages size > 0) and: [self previousMessages first = aString])
		ifTrue: [ ^ self ].
		
	self previousMessages addFirst: aString.
	(self previousMessages size > self maxLogMessageHistory)
		ifTrue: [self previousMessages removeLast]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog class>>maxLogMessageHistory [

	^ 15
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog class>>previousMessages [

	^ PreviousMessages ifNil: [ PreviousMessages := OrderedCollection new]
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallSaveAsIcon
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>accept [
	| version aMessage |
	version := (self findTextMorph: #versionName) text asString.
	aMessage := (self findTextMorph: #logMessage) text asString.
	self addAsLastLogMessage: aMessage.
	self answer: {version. aMessage}
]

{
	#category : #'log message history',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>addAsLastLogMessage: aString [

	self class addAsLastLogMessage: aString
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>buttonSpecs [
	^ #((Accept accept 'accept version name and log message')
		(Cancel cancel 'cancel saving version')
		('Old log messages...' oldLogMessages 're-use a previous log message')
		) 
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>cancel [
	self answer: nil
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>defaultLabel [
	^ 'Edit Version Name and Log Message:'
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>initialExtent  [
	^ 400@300
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>logMessage [
	^ message ifNil: ['empty log message']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>logMessage: aString [
	message := aString.
	self changed: #logMessage
]

{
	#category : #'log message history',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>maxLogMessageHistory [

	^ self maxLogMessageHistory
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>oldLogMessages [
	| list index |
	list := self previousMessages collect: [:s | s truncateWithElipsisTo: 30].
	list ifEmpty: [UIManager default inform: 'No previous log message was entered'. ^ self].
	index := UIManager default chooseFrom: list.
	
	"no comment was selected"
	index isZero ifTrue: [ ^ self ].
	
	self logMessage: (self previousMessages at: index)
]

{
	#category : #'log message history',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>previousMessages [

	^ self class previousMessages
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>setDefaultFocus [
	(self findTextMorph: #logMessage)
		textArea selectAll;
		takeKeyboardFocus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>versionName [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>versionName: aString [
	name := aString.
	self changed: #versionName
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSaveVersionDialog>>widgetSpecs [
	^ #(	
		((textMorph: versionName) (0 0 1 0) (0 0 0 30))
		((textMorph: logMessage) (0 0 1 1) (0 30 0 -30))
		((buttonRow) (0 1 1 1) (0 -40 0 0))
		)
]
