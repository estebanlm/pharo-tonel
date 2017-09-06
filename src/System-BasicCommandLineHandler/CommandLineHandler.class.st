"
A CommandLineHandler is activated by the CommandLine. 

The responsible handler with the highest priority is selected and its instance-side method #activate is invoked.

By default the handlers are selected by their class name. In the following shell invocation the FooHandler is chosen:

	pharo Pharo.image FooHandler

A handler may provide a short name with the class-side #commandName method. If the FooHandler defined #commandName returning 'foo' it would be activated with the following shell invocation:
	
	pharo Pharo.image foo
	
For more sophisticated handler selection the CommandLineHandler should implement the #isResponsibleFor: class-side method. An instance of the current command line options is passed to this method which should then return a boolean.

Between all the responsible handlers the one with the highes #priority is chosen. To change the priority overwrite the class-side accessor.

"
Class {
	#name : #CommandLineHandler,
	#superclass : #Object,
	#instVars : [
		'commandLine',
		'session',
		'stdout',
		'stderr'
	],
	#category : #System-BasicCommandLineHandler,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>activateWith: aCommandLine  [
	
	^ self new 
		commandLine: (self prepareSubcommand: aCommandLine);
		activate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>allHandlers [
	^ self allSubclasses reject: [ :handler| handler isAbstract ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>commandLine: aCommandLine  [
	
	^ self new 
		commandLine: aCommandLine;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>commandName [
	" Overwrite this method to provide a short name for this command handler.
	You may pass the commandName as first argument to the image to select this handler"
	^ self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>description [
	"This method should return a short one-line description of the command"
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>isAbstract [
	^ self = CommandLineHandler
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>isResponsibleFor: aCommandLineArguments [
	^ aCommandLineArguments includesSubCommand: self commandName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>prepareSubcommand: commandLineArguments [

	"strip the subcommand name from the arguments"
	commandLineArguments withFirstArgument: [ :arg|
		arg = self commandName 
			ifTrue: [ ^ commandLineArguments copySubcommand ]].
	
	"not a subcommand hence we keep the same args"
	^ commandLineArguments
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>priority [
	^ 0
]

{
	#category : #'handler selection',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler class>>selectHandlersFor: aCommandLine [

	^ self allHandlers select: [ :handlerClass|
		handlerClass isResponsibleFor: aCommandLine ]
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>><< aString [
	^ self stdout 
		nextPutAll: aString;
		yourself
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>activate [
	 self subclassResponsibility
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>activateHelp [
	"Default help implementation, running #help if the only argument is --help "
	((self hasOption: 'help') and: [ self arguments size = 1 ])
		ifTrue: [ 
			self help.
			^ true ].
	^ false
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>activateHelpWithoutArguments [
	"Default help implementation, running #help if the there is no argument or a single one which is --help "
	((self hasOption: 'help') or: [ self arguments isEmpty ])
		ifTrue: [ 
			self help.
			^ true ].
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>allHandlers  [
	^ CommandLineHandler allHandlers 
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>argumentAt: anInteger [
	^ self commandLine argumentAt: anInteger
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>arguments [
	^ self commandLine arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>commandLine [
	^ commandLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>commandLine: aCommandLine  [
	commandLine := aCommandLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>commandName [
	^ self class commandName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>description [
	^ self class description
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>exitFailure [
	 ^ self exitFailure: 'Command line handler failed'
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>exitFailure: aMessage  [
	self hasSessionChanged
		ifTrue: [ ^ self ].
	Exit signalFailure: aMessage 
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>exitSuccess [
	self hasSessionChanged
		ifTrue: [ ^ self ].
	Exit signalSuccess 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>hasArguments [
	^ self commandLine hasArguments
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>hasOption: aString [
	^ self commandLine hasOption: aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>hasSessionChanged [
	"check whether the session has changed since the commandline handler as been created"

	^ session ~~ Smalltalk session
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>help [
	"This is a crude default help implementation."
	self printHelp.
	Smalltalk isInteractive 
		ifFalse: [ self exitSuccess ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>initialize [
	super initialize.
	session := Smalltalk session.
	self 
		initializeStdout;
		initializeStderr.
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>initializeStderr [
	"install the line end conversion and initialize the converter"
	stderr := VTermOutputDriver stderr.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>initializeStdout [
	"install the line end conversion and initialize the converter"
	stdout := VTermOutputDriver stdout.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>name [
	^ self printString
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>optionAt: aString [
	^ self commandLine optionAt: aString
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>optionAt: aString ifAbsent: absentBlock [
	^ self commandLine 
		optionAt: aString ifAbsent: absentBlock
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>optionAt: aString ifPresent: absentBlock [
	^ self commandLine 
		optionAt: aString ifPresent: absentBlock
]

{
	#category : #'accessing arguments',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>optionAt: aString ifPresent: presentBlock ifAbsent: absentBlock [
	^ self commandLine 
		optionAt: aString ifPresent: presentBlock ifAbsent: absentBlock
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>printHelp [
	self stderr
		nextPutAll: self class comment; lf
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>quit [
	self exitSuccess
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>stderr [
	^ stderr
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineHandler>>stdout [
	^ stdout
]
