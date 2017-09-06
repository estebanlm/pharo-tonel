"
I'm a command line handler who is not aware of any UI or Tools present in the system.
I'm used as base handler for loading executing stripped images (kernel images, for example). 

My usage is the same as PharoCommandLineHandler, see his comment as better explanation.
"
Class {
	#name : #BasicCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #System-BasicCommandLineHandler,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>commandName [
	^ ''
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>description [
	^ 'basic responsible for the default options and activating other commands'
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>initialize  [
	SessionManager default 
		registerSystemClassNamed: self name
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>isResponsibleFor: aCommandLine [
	"I do not match ever, because my activation is manual"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>priority  [
	"Lowest priority"
	^ Float infinity negated
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler class>>startUp: isImageStarting [
	"only handle when lauching a new image"
	isImageStarting ifFalse: [ ^ self ].

	Smalltalk session 
		addDeferredStartupAction: [ self new activate ]
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>activate [
	
	[ self handleArgument: (self arguments 
			ifEmpty: [ '' ] 
			ifNotEmpty: [ :arguments| arguments first ])] 
		on: Exit 
		do: [ :exit | ^ self handleExit: exit ]
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>activateSubCommand: aCommandLinehandler [
	[ aCommandLinehandler activateWith: commandLine ] on: Exit do: [ :exit |
		^ self handleExit: exit for: aCommandLinehandler ].
	"the return value of this method is used to check if the subcommand was successfull"
	^ aCommandLinehandler
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>copyright [
	self stdout 
		nextPutAll: Smalltalk licenseString; cr.
	self quit.
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>default [
	^ self 
		help;
		exitSuccess
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>error [
	self arguments size = 1
		ifTrue:  [
			(self arguments first beginsWith: '-')
				ifTrue:  [ self << 'Invalid option: ']
				ifFalse: [ self << 'Invalid sub command: ']]
		ifFalse: [ self << 'Invalid arguments: "'].
		
	(self << (' ' join: self arguments)) 
		nextPutAll: '"'; cr.
		
	self printHelp.
	
	self exitFailure.
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>handleArgument: aString [

	"give priority to subcommands"
	self handleSubcommand == self
		ifFalse: [ ^ self ].

	"check for default options"
	aString ifEmpty: [ ^ self default ].
	
	aString = '--version'
		ifTrue: [ ^ self version ].
		
	aString = '--help'
		ifTrue: [ ^ self help ].
		
	aString = '--list'
		ifTrue: [ ^ self list ].
		
	aString = '--copyright'
		ifTrue: [ ^ self copyright ].
		
	aString = '--no-quit'
		ifTrue: [ ^ self noQuit ].
	
	"none of the previous options matched hence we output an error message"
	self error.
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>handleEmptyArguments [
	Smalltalk isHeadless
		ifFalse: [ ^ self ].
	
	self help.
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>handleExit: exit  [
	^ self handleExit: exit  for: self
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>handleExit: exit for: aCommandLinehandler [

	Smalltalk isInteractive 
		ifFalse: [ ^ exit pass ].
		
	exit isSuccess 
		ifFalse: [ ^ Error signal: exit messageText ].
	
	self inform: aCommandLinehandler name, ' successfully finished'.
		
	"for failing subcommands return self which is used to check if the subcommand failed"
	exit isSuccess 
		ifTrue: [ ^ aCommandLinehandler ].
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>handleSubcommand [
	"check if there is an active subcommand"
	
	| handlers |
	
	handlers := self selectHandlers.
	
	"If there is no handler, use myself"
	handlers ifEmpty: [ ^ self ].
		
	^self activateSubCommand: handlers first .
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>initialize [
	super initialize.
	commandLine := CommandLineArguments new
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>list [
	| handlers shortNames maxShortNameSize |
	self stdout 
		nextPutAll: 'Currently installed Command Line Handlers:'; lf.

	handlers := self allHandlers reject: [ :cls | 
			cls includesBehavior: BasicCommandLineHandler ].
	shortNames := handlers collect: #commandName.
	maxShortNameSize := (shortNames detectMax: [ :name|  name size ]) size.
	
	handlers do: [ :handler|
		self stdout 
			nextPutAll: '    ';
			nextPutAll: (handler commandName padRightTo: maxShortNameSize); 
			nextPutAll: '    ';
			nextPutAll: (handler description ifNil: [ '--']); lf].
	self quit.
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>noQuit [
	"Nothing to be done, unlike the other commands the image continues running"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>selectHandlers [
	| handlers |
	handlers := (self subCommandsRoot selectHandlersFor: commandLine) copyWithout: self class.
	handlers := handlers sort: [ :a :b | a priority >= b priority ].
	^ handlers
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>selectedHandler [
	^ self selectHandlers 
		ifEmpty: [ nil ] 
		ifNotEmpty: [ :handlers | handlers first ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>subCommandsRoot [
	^ CommandLineHandler
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 07:16:46'
}
BasicCommandLineHandler>>version [
	self stdout 
		nextPutAll: 'Image: '; print: SystemVersion current; cr;
		nextPutAll: 'VM:    '; nextPutAll: Smalltalk vm version; cr.
	self quit.
]
