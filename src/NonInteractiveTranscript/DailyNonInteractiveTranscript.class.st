"
I am DailyNonInteractiveTranscript, a NonInteractiveTranscript that writes to a dated file, switching to a new file each day.

	(DailyNonInteractiveTranscript onFileNamed: 'server-{1}.log') install.

"
Class {
	#name : #DailyNonInteractiveTranscript,
	#superclass : #NonInteractiveTranscript,
	#instVars : [
		'date'
	],
	#category : #NonInteractiveTranscript,
	#timestamp : 'SvenVanCaekenberghe 5/12/2015 14:21'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:57'
}
DailyNonInteractiveTranscript class>>defaultLogFileName [
	"The default file name that will be used to write to.
	This needs to have a slot where the date will come."
	
	^ 'PharoTranscript-{1}.log'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
DailyNonInteractiveTranscript>>fileNameWithDate [
	| newName |
	newName := self fileName format: { date yyyymmdd }.
	self 
		assert: self fileName ~= newName 
		description: 'The filename should include a {1} slot for the date'.
	^ newName
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:57'
}
DailyNonInteractiveTranscript>>initialize [
	super initialize.
	date := Date today
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
DailyNonInteractiveTranscript>>initializeStream [
	"Open the file stream that I write to or connect to #stdout.
	I use the proper line end convention.
	I will append to regular files.
	Overwrtitten to use #fileNameWithDate"
	
	stream := self isStdout 
		ifTrue: [ Stdio stdout ]
		ifFalse: [ File named: self fileNameWithDate ].
	self isStdout
		ifFalse: [ stream setToEnd ].
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
DailyNonInteractiveTranscript>>stream  [
	"Overwritten to check if the date changed on each access"
	
	Date today > date
		ifTrue: [ 
			"The date changed: close the old file and advance the date"
			self close.
			date := Date today ].
	"Since stream is now nil, #initializeStream will be called"
	^ super stream
]
