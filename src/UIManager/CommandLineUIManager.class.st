"
I am UI manager for a headless setup.
I block all UI manager API that uses Morphs and will trow an error instead.
"
Class {
	#name : #CommandLineUIManager,
	#superclass : #UIManager,
	#instVars : [
		'doNotQuitOnRestart',
		'uiManager'
	],
	#classVars : [
		'SnapshotErrorImage'
	],
	#category : #UIManager,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager class>>isValidForCurrentSystemConfiguration [

	^ Smalltalk isHeadless and: [ Smalltalk isInteractive ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager class>>replacing: aUIManager [

	"Replace the current UI manager with instance of myself. 
	Keep a backup reference to old manager, and then restore it, when image will be interactive again. "
	
	^ self new replacing: aUIManager
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager class>>snapshotErrorImage [
	^ SnapshotErrorImage == true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager class>>snapshotErrorImage: aBoolean [
	SnapshotErrorImage := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager class>>uiSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #nonInteractive)
		label: 'Headless mode';
		parent: #pharoSystem;
		description: 'Settings related to mode without UI';
		with: [
			(aBuilder setting: #snapshotErrorImage)
				label: 'Snapshot before quitting' ;
				target: CommandLineUIManager;
				description: 'On unhandled exception, save a new version of the image before quitting']
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>abort: aStringOrText [
	
	self abort: aStringOrText title: 'Error'.
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>abort: aStringOrText title: aString [
	
	self logTitle: aString andDescription: aStringOrText to: self stderr.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>activate [
	NonInteractiveTranscript stderr install
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>alert: aStringOrText [

	self abort: aStringOrText title: 'Alert'.
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>alert: aStringOrText title: aString [

	self logTitle: aString andDescription: aStringOrText to: self stdout.
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>alert: aStringOrText title: aString configure: aBlock [
	"Ignore the block, because we don't create a dialog, so there is nothing to configure."

	self alert: aStringOrText title: aString.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>checkForNewDisplaySize [
	"do nothing"
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>choose: questionsAnswerDict title: queryString [

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>chooseFrom: aList lines: linesArray title: aString [
	| maxPad |
	maxPad := aList size asString size.
	self stdout 
		nextPutAll: aString; nextPut: $:; cr.
	aList withIndexDo: [ :item :index |
		self stdout 
			nextPutAll: '    ['; nextPutAll: (index asString padLeftTo: maxPad); nextPutAll: '] ';
			print: item; cr].
	self stdout nextPutAll: '> '.	
	^ aList at: (self stdin upToAnyOf: String crlf do: [ :chr| ]) asInteger.
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>confirm: queryString label: title trueChoice: trueLabel falseChoice: falseLabel cancelChoice: cancelLabel default: trueFalseNil [
	| questions |
	questions := Dictionary new.
	trueLabel ifNotNil: [ questions at: 'y' put: trueLabel ].
	falseLabel ifNotNil: [ questions at: 'n' put: falseLabel ].
	cancelLabel ifNotNil: [ questions at: 'c' put: cancelLabel ].
	^ self choose: questions title: title, ' ', queryString

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>confirm: queryString trueChoice: trueLabel falseChoice: falseLabel [
	^self
		confirm: queryString
		trueChoice: trueLabel
		falseChoice: falseLabel
		cancelChoice: nil
		default: nil
		
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>confirm: queryString trueChoice: trueLabel falseChoice: falseLabel cancelChoice: cancelLabel default: trueFalseNil [
	| questions |
	questions := Dictionary new.
	trueLabel ifNotNil: [ questions at: 'y' put: trueLabel ].
	falseLabel ifNotNil: [ questions at: 'n' put: falseLabel ].
	cancelLabel ifNotNil: [ questions at: 'c' put: cancelLabel ].
	^ self choose: questions title: queryString

]

{
	#category : #debug,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>debugProcess: process context: context label: title fullView: bool notification: notificationString [
	| description |
	description := String streamContents: [ :stream |
		stream
			nextPutAll: 'debugging process: ';
			nextPutAll: process name;
			cr;
			nextPutAll: 'context:';
			cr;
			print: context.
		notificationString ifNotNil: [ stream nextPutAll: notificationString ] ].
	self 
		logTitle: title
		andDescription: description 
		to: self stderr
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>deny: aStringOrText [
	"Open a denial dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>deny: aStringOrText title: aString [
	"Open a denial dialog."
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>exitFailure [
	[
		self class snapshotErrorImage ifTrue: [
			doNotQuitOnRestart := true.
			"make a new image version snapshot before leaving"
			Smalltalk saveAsNewVersion  ].
	] ensure: [ 
		doNotQuitOnRestart ifFalse: [ Smalltalk exitFailure ].
		doNotQuitOnRestart := false.	
	].
	
	
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>handleError: anError log: shouldLog [

	shouldLog ifTrue: [ self logError: anError ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>headlessManager [
	self class == CommandLineUIManager 
		ifFalse: [ ^ self ].
		
	^ CommandLineUIManager replacing: uiManager
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>inform: aString [

	| logBlock |

	"Just log notifications"
	(ProvideAnswerNotification signal: aString) ifNotNil: [:answer | ^true].
	
	logBlock := [:logger |
		logger cr;
			nextPutAll: (String new: 79 withAll: $= ); cr;
			nextPutAll: 'Notice: ';
			nextPutAll: aString; cr;
			nextPutAll: (String new: 79 withAll: $= ); cr].

	Smalltalk logDuring: logBlock.		
	aString logCr.
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>informUserDuring: aBlock [
	self
		displayProgress: ''
		from: 1 to: 100
		during: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>initialize [
	doNotQuitOnRestart := false.
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logColored: anAnsiiColorCode during: aBlock [
	
	Smalltalk logStdErrorDuring: [:stderr |
		stderr
			nextPut: Character escape; 
			nextPut: $[; nextPutAll: anAnsiiColorCode; nextPut: $m.
		
		aBlock value: stderr.
		
		stderr nextPut: Character escape; nextPutAll: '[0m'
	]
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logDuring: aBlock [
	
	Smalltalk logStdErrorDuring: [ :stderr | aBlock value: stderr ]


]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logGreenDuring: aBlock [
	
	^ self logColored: '32' during: aBlock
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logRedDuring: aBlock [
	
	^ self logColored: '31' during: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logTitle: aString andDescription: aStringOrText to: aStream [
	
	aStream
		nextPutAll: aString;
		nextPutAll: ': ';
		nextPutAll: aStringOrText asString;
		cr.
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>logYellowDuring: aBlock [
	
	^ self logColored: '33' during: aBlock
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>merge: merger informing: aString [
	"Check for conflicts, if there are none, just continue. 
	 Merger will accept all conflicts"
	merger hasConflicts ifFalse: [ ^ self ].
	self abort: aString title: 'Conflict detected'
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>newDisplayDepthNoRestore: pixelSize	 [
	"do nothing"
	

]

{
	#category : #non-interactive,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>nonInteractiveManager [
	" Answer an instance of non-interactive manager, which will be used when image runs headless.
	  We put it here, so subclasses can override it. "
	^ NonInteractiveUIManager replacing: uiManager
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>onPrimitiveError: aString	 [

	" log error and quit "
	^ self quitFrom: thisContext sender withMessage: aString
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>proceed: aStringOrText [
	"Open a proceed dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>proceed: aStringOrText title: aString [
	"Open a proceed dialog and answer true if not cancelled, false otherwise."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>question: aStringOrText [
	"Open a question dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>question: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>questionWithoutCancel: aStringOrText [
	"Open a question dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>questionWithoutCancel: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	false if no and nil if cancelled."
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>quitFrom: aContext withMessage: aString [

	" log error and quit "
	[ Smalltalk 
		logError: aString
		inContext: aContext.
		
	" Print stacks of all current processes "

	Smalltalk logDuring: [:logger | 
		logger nextPutAll: 'Processes and their stacks: ';cr.
		
		Process allInstances do: [:each | | ctx |
			logger nextPutAll: 'Process: '; print: each; cr; nextPutAll: '  stack:'; cr; cr.
		
			ctx := each isActiveProcess ifTrue: [ thisContext sender ] ifFalse: [ each suspendedContext ].
			ctx ifNotNil: [
				(ctx stackOfSize: 20) do: [:s | logger print: s; cr ]].
			logger nextPutAll: '------------------------------'; cr; cr.	
		]].
	] ensure: [ self exitFailure ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>replacing: aUIManager [

	" save the aUIManager to restore it later, when we become interactive again "
	
	uiManager := aUIManager.
	
	self beDefault.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>restoreDisplay	 [
	"do nothing"
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>restoreDisplayAfter: aBlock	 [
	"do nothing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>stderr [
		
	^ Stdio stderr
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>stdin [

	^ Stdio stdin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>stdout [
	
	^ Stdio stdout
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>syntaxErrorNotificationDefaultAction: aSyntaxErrorNotification [
	"log the syntax notificaiton and print a nicely formatted and colored syntax error on stderr"
	Smalltalk logDuring: [ :logger |
		logger print: aSyntaxErrorNotification; cr.
		aSyntaxErrorNotification signalerContext errorReportOn: logger ].
	
	STCommandLineHandler printCompilerWarning: aSyntaxErrorNotification.
			
	"in noninteractive mode simply quit"
	^ self exitFailure
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>textEntry: aStringOrText [
	"Open a text entry dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>textEntry: aStringOrText title: aString [
	"Open a text entry dialog."
]

{
	#category : #'ui TEasilyThemed',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>textEntry: aStringOrText title: aString entryText: defaultEntryText [
	"Open a text entry dialog."

]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>uiProcess [
	" receiver don't have a ui process, associated with it,
	client should check explicitly if #uiProcess answers nil or not"
	^ nil
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>unhandledErrorDefaultAction: anException [

	self quitFrom: anException signalerContext  withMessage: anException description.
	
	UIManager default == self ifFalse: [
		^ UIManager default unhandledErrorDefaultAction: anException
		]
]

{
	#category : #'ui requests',
	#timestamp : ' 8/31/2017 07:16:16'
}
CommandLineUIManager>>warningDefaultAction: aWarning [
	| logBlock |
	"Pass all warnings, but log them"
	
	logBlock := [:logger |
		logger 
			cr;
			nextPutAll: '*** Warning: ';
			nextPutAll: aWarning description;
			cr ].
	
	Smalltalk logDuring: logBlock.
	self logYellowDuring: logBlock.
	
	aWarning resume.

	
]
