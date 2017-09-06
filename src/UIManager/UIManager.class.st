"
UIManager is a dispatcher for various UI requests.
"
Class {
	#name : #UIManager,
	#superclass : #Object,
	#classVars : [
		'Default'
	],
	#category : #UIManager,
	#timestamp : 'ar 12/27/2004 08:39'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>default [
	^ Default
		ifNil: [ 
			"Note: The way the following is phrased ensures that you can always make 'more specific' managers merely by subclassing a tool builder and implementing a more specific way of reacting to #isActiveManager. For example, a BobsUIManager can subclass MorphicUIManager and will be considered before the parent (generic MorphicUIManager)."
			self allSubclasses
				detect: [ :any | any isActiveManager and: [ any subclasses noneSatisfy: [ :sub | sub isActiveManager ] ] ]
				ifFound: [ :mgrClass | Default := mgrClass new ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>default: aUIManager [

	Default deactivate.
	Default := aUIManager.
	Default activate.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>forCurrentSystemConfiguration [
	^ (self allSubclasses
			detect: [ :any | 
				any isValidForCurrentSystemConfiguration
					and: [ any subclasses noneSatisfy: #isValidForCurrentSystemConfiguration ] ]
			ifNone: [ NonInteractiveUIManager ]) new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>isActiveManager [
	"Answer whether I should act as the active ui manager"
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>isValidForCurrentSystemConfiguration [

	^ false
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager class>>nonInteractiveDuring: aBlock [
	| currentManager |
	currentManager := self default.
	currentManager nonInteractiveManager.
	
	aBlock ensure: [ currentManager beDefault ]
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>abort: aStringOrText [
	"Open an error dialog."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>abort: aStringOrText title: aString [
	"Open an error dialog."

	^self subclassResponsibility 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>activate [

]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>alert: aStringOrText [
	"Open an alert dialog."
	
	^ self subclassResponsibility
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>alert: aStringOrText title: aString [
	"Open an alert dialog."
	
	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>alert: aStringOrText title: aString configure: aBlock [
	"Open an alert dialog.
	Configure the dialog with the 1 argument block
	before opening modally."

	^self subclassResponsibility 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>beDefault [

	self class default: self.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>checkForNewDisplaySize	 [
	
	self subclassResponsibility 
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseDirectory [
	"Let the user choose a directory"
	^self chooseDirectoryFrom: FileSystem workingDirectory
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseDirectory: label [
	"Let the user choose a directory"
	^self chooseDirectory: label from: FileSystem workingDirectory
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseDirectory: label from: dir [
	"Let the user choose a directory"
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseDirectoryFrom: dir [
	"Let the user choose a directory"
	^self chooseDirectory: nil from: dir
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: #()
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList lines: linesArray [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList lines: linesArray message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: linesArray message: messageString title: ''
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList lines: linesArray message: messageString title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self
		chooseFrom: aList
		lines: linesArray
		title: (aString 
				ifEmpty: [messageString]
				ifNotEmpty: [aString, String cr, messageString])
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #() message: messageString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList message: messageString title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #() message: messageString title: aString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: #() title: aString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: labelList values: valueList [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: #()
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: labelList values: valueList lines: linesArray [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList values: valueList lines: linesArray message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: linesArray message: messageString title: ''
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: labelList values: valueList lines: linesArray message: messageString title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self
		chooseFrom: labelList
		values: valueList 
		lines: linesArray
		title: (aString 
				ifEmpty: [messageString]
				ifNotEmpty: [aString, String cr, messageString])
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: labelList values: valueList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the selected item."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList values: valueList message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: #() message: messageString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: aList values: valueList message: messageString title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: #() message: messageString title: aString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFrom: labelList values: valueList title: aString [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: #() title: aString
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFullFileNameMatching: patterns [
	"Let the user choose a file matching the given patterns"
	^self chooseFullFileNameMatching: patterns label: nil
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseFullFileNameMatching: patterns label: labelString [
	"Let the user choose a file matching the given patterns"
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>chooseOrRequestFrom: labelList values: valueList lines: linesArray title: aString [
	self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: queryString [
	"Put up a yes/no menu with caption queryString. Answer true if the 
	response is yes, false if no. This is a modal question--the user must 
	respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: queryString label: titleString [
	
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: queryString label: title trueChoice: trueChoice falseChoice: falseChoice cancelChoice: cancelChoice default: defaultOption [
	"Put up a yes/no/cancel menu with caption queryString. The actual wording for the choices will be as provided in the trueChoice, falseChoice and cancelChoice parameters.
	defaultOption should be one of true, false or nil to set the default button.
	Answer true if the response is the true-choice, false if it's the false-choice, nil if the cancelChoice.
	This is a modal question -- the user must respond."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: aString orCancel: cancelBlock [
	"Put up a yes/no/cancel menu with caption aString. Answer true if  
	the response is yes, false if no. If cancel is chosen, evaluate  
	cancelBlock. This is a modal question--the user must respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: queryString trueChoice: trueChoice falseChoice: falseChoice  [
	"Put up a yes/no menu with caption queryString. The actual wording for the two choices will be as provided in the trueChoice and falseChoice parameters. Answer true if the response is the true-choice, false if it's the false-choice.
	This is a modal question -- the user must respond one way or the other."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>confirm: queryString trueChoice: trueChoice falseChoice: falseChoice cancelChoice: cancelChoice default: aSymbol [
	"Put up a yes/no/cancel menu with caption queryString. The actual wording for the choices will be as provided in the trueChoice, falseChoice and cancelChoice parameters.
	Default should be one of #yes, #no or #cancel to set the default button.
	Answer true if the response is the true-choice, false if it's the false-choice, nil if the cancelChoice.
	This is a modal question -- the user must respond."
	
	^self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>deactivate [

]

{
	#category : #debug,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>debugProcess: process context: context label: title fullView: bool [

	self debugProcess: process context: context label: title fullView: bool notification: nil
]

{
	#category : #debug,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>debugProcess: process context: context label: title fullView: bool notification: notificationString [
	self subclassResponsibility
]

{
	#category : #'ui process',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>defer: aBlock [
	" Evaluate the given Block in the UI thread as soon as there is nothing scheduled. Evaluate immediately when there is no UI"
	aBlock value
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>deny: aStringOrText [
	"Open a denial dialog."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>deny: aStringOrText title: aString [
	"Open a denial dialog."

	^self subclassResponsibility 
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>displayProgress: titleString from: minVal to: maxVal during: workBlock [
	"SystemProgressMorph show: titleString from: minVal to:  during: "

	^ workBlock asJob
			title: titleString;
			min: minVal;
			max: maxVal;
			run.
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>edit: aText [
	"Open an editor on the given string/text"
	^self edit: aText label: nil
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>edit: aText label: labelString [
	"Open an editor on the given string/text"
	^self edit: aText label: labelString accept: nil
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>edit: aText label: labelString accept: aBlockOrNil [
	"Open an editor on the given string/text"
	^self subclassResponsibility
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>fileDoesNotExistsDefaultAction: anException [

	^ self subclassResponsibility 
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>fileExistsDefaultAction: anException [

	^ self subclassResponsibility 
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>fontFromUser: priorFont	 [
	
	self subclassResponsibility
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>handleError: anError [
	
	self handleError: anError log: true
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>handleError: anError log: shouldLog [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>headlessManager [
	" Answer an instance of headless manager, which will be used when image runs headless and non-interactive.
	  We put it here, so subclasses can override it. "
	^ CommandLineUIManager replacing: self
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>inform: aString [
	"Display a message for the user to read and then dismiss"
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>informUser: aString during: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	during execution of the given block.
		UIManager default informUser: 'Just a sec!' during: [(Delay forSeconds: 1) wait].
	"
	^self informUserDuring: [:bar | bar label: aString. aBlock value].
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>informUserDuring: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	during execution of the given block.
		UIManager default informUserDuring:[:bar|
			#(one two three) do:[:info|
				bar label: info.
				(Delay forSeconds: 1) wait]]"
	^self subclassResponsibility
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>interactiveParserFor: requestor	 [
	
	requestor ifNil: [^ false ].
	(requestor respondsTo: #interactive)
		ifTrue: [ ^requestor interactive ].
	^true
]

{
	#category : #'ui process',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>interruptName: labelString preemptedProcess: theInterruptedProcess [
	"Create a Notifier on the active scheduling process with the given label."

	^ self error: 'Cannot perform a given request'
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>logError: anError [

	Smalltalk
		logError: anError messageText
		inContext: anError signalerContext.
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>lowSpaceWatcherDefaultAction: preemptedProcess [

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>merge: merger informing: aString [

	self subclassResponsibility.
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>multiLineRequest: queryString initialAnswer: defaultAnswer answerHeight: answerHeight [
	"Create a multi-line instance of me whose question is queryString with
	the given initial answer. Invoke it centered at the given point, and
	answer the string the user accepts.  Answer nil if the user cancels.  An
	empty string returned means that the ussr cleared the editing area and
	then hit 'accept'.  Because multiple lines are invited, we ask that the user
	use the ENTER key, or (in morphic anyway) hit the 'accept' button, to 
	submit; that way, the return key can be typed to move to the next line."
	^self subclassResponsibility
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>newDisplayDepthNoRestore: pixelSize	 [
	
	self subclassResponsibility 
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>newMenuIn: aThemedMorph for: aModel [
	"Answer a new menu."
	
	^ self subclassResponsibility
]

{
	#category : #non-interactive,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>nonInteractiveManager [
	" Answer an instance of non-interactive manager, which will be used when image runs headless.
	  We put it here, so subclasses can override it. "
	^ NonInteractiveUIManager replacing: self
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>onEventSensorStartup: anEventSensor [


]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>onFontsChanged [

	
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>onPrimitiveError: aString	 [

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>openComparisionFrom: targetMethodSource
					to: originalMethodSource
					belongingTo: aClass
					from: aChange  [
	^ self subclassResponsibility				
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>proceed: aStringOrText [
	"Open a proceed dialog."
	
	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>proceed: aStringOrText title: aString [
	"Open a proceed dialog and answer true if not cancelled, false otherwise."
	
	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>question: aStringOrText [
	"Open a question dialog."
	
	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>question: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>questionWithoutCancel: aStringOrText [
	"Open a question dialog."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>questionWithoutCancel: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."

	^self subclassResponsibility 
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: queryString  [
	"Create an instance of me whose question is queryString. Invoke it 
	centered at the cursor, and answer the string the user accepts. Answer 
	the empty string if the user cancels."
	^self request: queryString initialAnswer: ''
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: queryString entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString. Invoke it 
	centered at the cursor, and answer the string the user accepts. Answer 
	the empty string if the user cancels."
	^self request: queryString initialAnswer: '' entryCompletion: anEntryCompletion
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: queryString initialAnswer: defaultAnswer [
	"Create an instance of me whose question is queryString with the given initial answer. Answer the string the user accepts. Answer the empty string if the user cancels."

	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: queryString initialAnswer: defaultAnswer entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString with the given 
	initial answer. Invoke it centered at the given point, and answer the 
	string the user accepts. Answer the empty string if the user cancels."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: aStringOrText initialAnswer: defaultAnswer title: aTitle [
	"Create an instance of me whose question is queryString with the given 
	initial answer. Invoke it centered at the given point, and answer the 
	string the user accepts. Answer the empty string if the user cancels."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>request: aStringOrText initialAnswer: defaultAnswer title: aTitle entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString with the given 
	initial answer. Invoke it centered at the given point, and answer the 
	string the user accepts. Answer the empty string if the user cancels."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>requestPassword: queryString [
	"Create an instance of me whose question is queryString. Invoke it centered
	at the cursor, and answer the string the user accepts. Answer the empty 
	string if the user cancels."
	^self subclassResponsibility
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>restoreDisplay	 [
	
	self subclassResponsibility 
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>restoreDisplayAfter: aBlock	 [
	
	self subclassResponsibility 
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>showWaitCursorWhile: aBlock [
	| process |
	process := [ [ true ] "loop until the end of aBlock processing"
		whileTrue: [ 
			Smalltalk logStdErrorDuring: [ :stream |
				"Wait wheel in ASCII art"
				'\|/-'
					do: [ :char |
						stream << char.
						0.1 second wait.
						stream << Character backspace ] ] ] ] fork.
	[ aBlock value ]
		ensure: [ process terminate ]
]

{
	#category : #'ui process',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>spawnNewProcess [

	"do nothing by default"
]

{
	#category : #'ui process',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>spawnNewProcessIfThisIsUI: suspendedProcess [

	self uiProcess == suspendedProcess ifTrue: [
		self spawnNewProcess.
		^true
	].
	^false		"no new process was created"

]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>syntaxErrorNotificationDefaultAction: anException [

	^ self subclassResponsibility 
]

{
	#category : #'ui process',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>terminateUIProcess [
	"do nothing by default "
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>textEntry: aStringOrText [
	"Open a text entry dialog."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>textEntry: aStringOrText title: aString [
	"Open a text entry dialog."

	^self subclassResponsibility 
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>textEntry: aStringOrText title: aString entryText: defaultEntryText [
	"Open a text entry dialog."

	^self subclassResponsibility 
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>unhandledErrorDefaultAction: anException [

	"Provide a default handling for unhandled error. 
	We should never reach this code, because it should be overridden by subclasses. 
	(but we can't put 'self subclassResponsibility' , because it will cause infinite loop,
	in case if current ui manager having no override of this method).
	This method is only for documentation purposes."
		
	Smalltalk snapshot: false andQuit: true.
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
UIManager>>warningDefaultAction: aWarning [

	"Handle warning notification. Should be overidden by subclass"
	
	self subclassResponsibility  
]
