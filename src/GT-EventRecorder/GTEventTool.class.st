"
I simplify the process of downloading and extracting of recorded data.

You likely want to use #ensureLocalDirectory that downloads and extracts server data or #unpackAll if you want to load all data into memory.
"
Class {
	#name : #GTEventTool,
	#superclass : #Object,
	#category : #GT-EventRecorder-Core,
	#timestamp : 'JurajKubelka 11/15/2015 23:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool class>>default [
	^ self new
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>defaultDownloadDirectory [
	^ FileSystem disk workingDirectory
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>defaultDownloadFilename [
	^ self defaultDownloadDirectory / 'gt-events.zip'
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>defaultEventsDirectory [
	^ self defaultDownloadDirectory / 'gt' / 'events'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>defaultUrl [
	^ 'http://gc.dcc.uchile.cl/gt-events.zip'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>download [
	"self default download"
 	UIManager default informUserDuring: [ :bar |
		bar label: 'Downloading Spotter Event Data...'.
		[ ZnClient new
			url: self defaultUrl;
			signalProgress: true;
			downloadTo: self defaultDownloadFilename ]
		on: HTTPProgress 
		do: [ :progress |
			progress isEmpty ifFalse: [ 
				bar current: progress percentage.
				progress total ifNotNil: [ :aTotalNumber | | humanReadable |
					humanReadable := self printHumanReadableSize: aTotalNumber.
					bar label: 'Downloading ', humanReadable, ' of Spotter Event Data... ' ] ].
			progress resume ] 
	]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>ensureDownloadedData [
	self defaultDownloadFilename exists ifFalse: [ self download ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>ensureExtractedData [
	self defaultEventsDirectory exists ifFalse: [ self extract ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>ensureLocalDirectory [
	"self default ensureLocalDirectory"
	self 
		ensureDownloadedData;
		ensureExtractedData
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>extract [
	(ZipArchive new readFrom: self defaultDownloadFilename) extractAllTo: FileLocator workingDirectory.
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>gtInspectorActionHelp [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [:b | 
		HelpBrowser open selectTopicSatisfying: [:each |
			each owner notNil and:  [
			(each owner key = GTEventRecorderHelp key) and: [
				each title = 'Data Analysis' ] ] ] ];
		icon: GLMUIThemeExtraIcons glamorousHelp;
		title: 'Help'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>printHumanReadableSize: aTotalNumber [
	| humanReadable length unit |
	length := ((aTotalNumber decimalDigitLength / 3) truncated) - 1 max: 0.
	humanReadable := (aTotalNumber / (1024 raisedTo: (length min: 3))) rounded.
	length = 0 ifTrue: [ unit := 'bytes' ].
	length = 1 ifTrue: [ unit := 'KB' ].
	length = 2 ifTrue: [ unit := 'MB' ].
	length = 3 ifTrue: [ unit := 'GB' ].
	^ humanReadable printString, ' ', unit
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>unpackAll [
	"self default unpackAll inspect"
	self ensureLocalDirectory.
	^ GTEventUnpacking default safeUnpackDirectory: self defaultEventsDirectory.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventTool>>unpackAll: aFileReference [
	"self default unpackAll: './gt/events' asFileReference.
	self default unpackAll: './gt/events/roassal2Examples' asFileReference.
	" 
	self ensureLocalDirectory.
	^ GTEventUnpacking default safeUnpackDirectory: aFileReference.
]
