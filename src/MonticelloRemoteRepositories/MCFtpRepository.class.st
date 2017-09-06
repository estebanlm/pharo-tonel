"
I am an monticello repository implementation for the FTP protocol.
"
Class {
	#name : #MCFtpRepository,
	#superclass : #MCFileBasedRepository,
	#instVars : [
		'host',
		'directory',
		'user',
		'password'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>basicFromUrl: aZnUrl [
	^ self
		host: (aZnUrl hasPort ifTrue: [ aZnUrl host, ':', aZnUrl port asString ] ifFalse: [ aZnUrl host ])
		directory: aZnUrl path "MCFtpRepository assumes NO prefixed / in the path"
		user: (aZnUrl username ifNil: [ '' ])
		password: (aZnUrl password ifNil: [ '' ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>creationTemplate [
	^
'MCFtpRepository
	host: ''modules.squeakfoundation.org''
	directory: ''mc''
	user: ''squeak''
	password: ''squeak'''
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>description [
	^ 'FTP'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>host: host directory: directory user: user password: password [
	^ self new
		host: host;
		directory: directory;
		user: user;
		password: password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>templateCreationSelector [
	^ #host:directory:user:password: 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository class>>urlSchemes [
	^ #(ftp)
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>clientDo: aBlock [
	| client |
	client := FTPClient openOnHostNamed: host.
	client loginUser: user password: password.
	directory isEmpty ifFalse: [client changeDirectoryTo: directory].
	^ [aBlock value: client] ensure: [client close]
]

{
	#category : #required,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>description [
	^ 'ftp://', host, '/', directory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>directory: dirPath [
	directory := dirPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>host: hostname [
	host := hostname
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>loadAllFileNames [
	^ self clientDo:
		[:client |
		self parseDirectoryListing: client getDirectory]
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>parseDirectoryListing: aString [
	| stream files line tokens |
	stream := aString readStream.
	files := OrderedCollection new.
	[stream atEnd] whileFalse:
		[line := stream nextLine.
		tokens := line findTokens: ' '.
		tokens size > 2 ifTrue: [files add: tokens last]].
	^ files
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>password: passwordString [
	password := passwordString
]

{
	#category : #required,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>readStreamForFileNamed: aString do: aBlock [
	
	^ self clientDo:
		[:client | | stream |
		client binary.
		stream := RWBinaryOrTextStream on: String new.
		stream nextPutAll: (client getFileNamed: aString).
		aBlock value: stream reset]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>user: userString [
	user := userString
]

{
	#category : #required,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCFtpRepository>>writeStreamForFileNamed: aString replace: ignoreBoolean do: aBlock [
	| stream |
	stream := RWBinaryOrTextStream on: String new.
	aBlock value: stream.
	self clientDo:
		[:client |
		client binary.
		client putFileStreamContents: stream reset as: aString]
]
