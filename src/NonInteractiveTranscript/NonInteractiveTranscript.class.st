"
I am NonInteractiveTranscript, a replacement for Transcript, writing everything to a file or stdout. I implement TTranscript.

This is useful when running headless.

	NonInteractiveTranscript file install.
	
To connect to the output stream of the virtual machine process choose stdout.

	NonInteractiveTranscript stdout install.

or 

	NonInteractiveTranscript stderr install

"
Class {
	#name : #NonInteractiveTranscript,
	#superclass : #Object,
	#instVars : [
		'stream',
		'fileName',
		'accessSemaphore'
	],
	#category : #NonInteractiveTranscript,
	#timestamp : 'SvenVanCaekenberghe 5/12/2015 14:19'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>defaultLogFileName [
	"The default file name that will be used to write to.
	This should probably become a system setting."
	
	^ 'PharoTranscript.log'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>file [
	"Create a new NonInteractiveTranscript that will output 
	to the default file named by #defaultLogFileName."
	
	^ self onFileNamed: self defaultLogFileName 
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>initialize [
	"Make sure to cleanup on shutdown"
	SessionManager default registerSystemClassNamed: self name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>isInstalled [
	^ Transcript class = self
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>onFileNamed: fileName [
	"Create a NonInteractiveTranscript that will write to fileName."
	
	^ self new
		fileName: fileName;
		yourself
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>shutDown [
	"Send close to all our instances.
	Their streams will be reopened on first use later on."
	
	self allInstances do: #close
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>stderr [
	"Create a new NonInteractiveTranscript that will output 
	to the special standard error output stream of the virtual machine process."
	
	^ self onFileNamed: #stderr
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript class>>stdout [
	"Create a new NonInteractiveTranscript that will output 
	to the special standard output stream of the virtual machine process."
	
	^ self onFileNamed: #stdout
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>><< anObject [
	"Output anObject asString on the receiver and show the output"
	
	self show: anObject
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>clear [
	"Clear the receiver, removing all existing output"
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>close [
	"Close the receiver, indicating it is not longer needed"
	
	self critical: [ 
		stream ifNotNil: [ 
			(self isStdout or: [ self isStderr ])
				ifTrue: [ stream flush ]
				ifFalse: [ stream close ].
			stream := nil ] ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>cr [
	"Output a cr on the receiver, buffered and not yet shown"
	
	self newLine
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>crShow: anObject [
	"Output anObject asString on the receiver preceded by a cr and show the output"
	
	self critical: [ self cr; show: anObject ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>critical: block [
	"Execute block making sure only one thread accesses the receiver"

	^ accessSemaphore critical: block 
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>endEntry [
	"Show the currently buffered output"

	self flush
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>fileName [
	"The file name that I will write to.
	Lazy initialized to a default.
	When I connect to the standard output stream of the 
	virtual machine process I return #stdout."
	
	^ fileName ifNil: [ fileName := self class defaultLogFileName ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>fileName: anObject [
	"Initialize me to write to a file stream described by anObject.
	anObject is either a String naming a file or the special #stdout value
	for using the standard output stream of the virtual machine process."
	
	self close.
	fileName := anObject
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>flush [
	"Show the currently buffered output"

	self critical: [ self stream flush ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>initialize [
	super initialize.
	accessSemaphore := Mutex new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>initializeStream [
	"Open the file stream that I write to or connect to #stdout.
	I use the proper line end convention.
	I will append to regular files."
	
	stream := self isStdout 
		ifTrue: [ Stdio stdout ]
		ifFalse: [ 
			self isStderr
				ifTrue: [ Stdio stderr ]
				ifFalse: [ File named: self fileName ]].
	(self isStdout or: [ self isStderr ])
		ifFalse: [ stream setToEnd ].
	^ stream
]

{
	#category : #installation,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>install [
	"Install me as a replacement for Transcript"
	
	Smalltalk globals 
		at: #Transcript 
		put: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>isSelfEvaluating [
	self == Transcript ifTrue: [ ^ true ].
	^ super isSelfEvaluating
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>isStderr [
	
	^ fileName = #stderr
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>isStdout [
	"Answer true when I am setup to be connected to the special
	standard output stream of the virtual machine process."
	
	^ fileName = #stdout
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>newLine [
	"Output a cr on the receiver, buffered and not yet shown"
	
	self nextPutAll: OSPlatform current lineEnding
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>nextPut: aCharacter [
	"Output character on the receiver, buffered, not yet shown"

	self critical: [  self stream nextPut: aCharacter ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>nextPutAll: aCollection [
	"Output string on the receiver, buffered, not yet shown"

	self critical: [ self stream nextPutAll: aCollection ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>print: anObject [
	"Output anObject asString on the receiver, buffered, not yet shown"
	
	self nextPutAll: anObject asString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>printOn: aStream [
	self == Transcript ifFalse: [ ^ super printOn: aStream ].
	aStream nextPutAll: 'Transcript'
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>show: anObject [
	"Output anObject asString on the receiver and show the output"
	
	self critical: [ self print: anObject; endEntry ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>space [
	"Output a space on the receiver, buffered and not yet shown"

	self nextPut: Character space
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>stepGlobal [
	"ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>stream [
	"The file stream I am writing to.
	Lazy initialized so as not to create the file when it is not used."
	
	^ stream ifNil: [ self initializeStream ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:57'
}
NonInteractiveTranscript>>tab [
	"Output a tab on the receiver, buffered and not yet shown"

	self nextPut: Character tab
]
