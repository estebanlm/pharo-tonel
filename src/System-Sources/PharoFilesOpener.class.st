"
My role is to open the .sources and .changes files. My only public methods are in the 'public' protocol. The most important method is #checkAndOpenSourcesAndChanges.
"
Class {
	#name : #PharoFilesOpener,
	#superclass : #Object,
	#instVars : [
		'shouldInformAboutReadOnlyChanges'
	],
	#classVars : [
		'Default'
	],
	#category : #System-Sources,
	#timestamp : '<historical>'
}

{
	#category : #singleton,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener class>>default [
	^ Default ifNil: [ Default := self new ]
]

{
	#category : #singleton,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener class>>reset [
	Default := nil
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>badContentMsg [
	^ '&fileRef
has been injured by an unpacking utility.  Crs were changed to CrLfs.
Please set the preferences in your decompressing program to 
"do not convert text files" and unpack the system again.'
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>cannotLocateMsg [
	^ 'Pharo cannot locate &fileRef.

Please check that the file is named properly and is in the
same directory as this image.'
]

{
	#category : #messages,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>cannotWriteMsg [
	^ 'Pharo cannot write to &fileRef.

Please check that you have write permission for this file.

You won''t be able to save this image correctly until you fix this.'
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>changesFileOrNil [
	| changes |
	changes := self openChanges: self changesName.
	changes
		ifNil: [ 
			self informProblemInChanges: self cannotLocateMsg.
			^ nil ].
	(changes isReadOnly and: [ self shouldInformAboutReadOnlyChanges ])
		ifTrue: [ self informProblemInChanges: self cannotWriteMsg ].
	((changes next: 200) includesSubstring: String crlf)
		ifTrue: [ self informProblemInChanges: self badContentMsg ].
	^ changes
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>changesName [
	^ Smalltalk changesName
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>ignoreIfFail: aBlock [
	^ [ aBlock value ] ifError: [  ]
]

{
	#category : #'user interaction',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>inform: msg withChangesRef: fileRef [
	self inform: msg withRef: 'the changes file named ' , fileRef
]

{
	#category : #'user interaction',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>inform: msg withRef: fileRef [
	self inform: (msg copyReplaceAll: '&fileRef' with: fileRef)
]

{
	#category : #'user interaction',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>inform: msg withSourceRef: fileRef [
	self inform: msg withRef: 'the sources file named ' , fileRef
]

{
	#category : #'open sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>informCannotLocateSources [
	| msg |
	msg := self cannotLocateMsg.
	Smalltalk os isMacOS
		ifTrue: [ 
			msg := msg
				,
					'
Make sure the sources file is not an Alias.' ].
	self inform: msg withSourceRef: self sourcesName
]

{
	#category : #'user interaction',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>informProblemInChanges: msg [
	self inform: msg withChangesRef: self changesName
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>lastImagePath [
	^ Smalltalk lastImagePath
]

{
	#category : #'open changes',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>openChanges: changesPath [
	| fileColocatedWithImage fileInWorkingDirectory locations |
	fileColocatedWithImage := changesPath asFileReference.
	fileInWorkingDirectory := FileSystem workingDirectory / fileColocatedWithImage basename.	"locations references all possible path where to search for the .changes file."
	locations := Array with: fileColocatedWithImage with: fileInWorkingDirectory.	
		
	"We first try to open a writeStream and, if we can't, we open a readStream. We have to use #ignoreIfFail: here because Pharo has no way to really tell us beforehand if opening a writeStream will work. Sending #isWritable is not enough because #isWritable does not check if the current user is the owner of the file or not."
	locations do: [ :file | self ignoreIfFail: [ ^ file writeStream ] ].
	locations do: [ :file | self ignoreIfFail: [ ^ file readStream ] ].
	^ nil
]

{
	#category : #'open sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>openSources [
	^ self openSources: self sourcesName forImage: self lastImagePath
]

{
	#category : #'open sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>openSources: fullSourcesName forImage: imagePath [
	"Look in various places for a sources file, return an open stream to it."

	| sourcesFile sourcesName |
	sourcesFile := fullSourcesName asFileReference.
	sourcesName := sourcesFile basename.
	
	"look for the sources file or an alias to it in the VM's directory"
	OSPlatform current potentialLocationsOfSourcesFile do: [ :dir |
		self ignoreIfFail: [ 
			(sourcesFile := dir / sourcesName) exists
				ifTrue: [ sourcesFile readStream ifNotNil: [ :stream | ^ stream ] ] ] ].
			
	"look for the sources file or an alias to it in the image directory"
	(sourcesFile := imagePath asFileReference parent / sourcesName) exists
		ifTrue: [ ^ sourcesFile readStream ifNotNil: [ :stream | ^ stream ] ].
		
	"look for the sources in the current directory"
	(sourcesFile := sourcesName asFileReference) exists
		ifTrue: [ ^ sourcesFile readStream ifNotNil: [ :stream | ^ stream ] ].
		
	^ nil
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>setInformAboutReadOnlyChanges [
	"Make sure the user is informed when the .changes file can not be written to."
	shouldInformAboutReadOnlyChanges := true
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>shouldInformAboutReadOnlyChanges [
	"Answer true if and only if the user must be informed when the .changes file can not be written to."
	^ shouldInformAboutReadOnlyChanges ifNil: [ shouldInformAboutReadOnlyChanges := true ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>sourcesFileOrNil [
	| sources |
	sources := self openSources.
	^ (sources isNil or: [ sources atEnd ])
		ifTrue: [ 
			self informCannotLocateSources.
			nil ]
		ifFalse: [ sources ]
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>sourcesName [
	^ Smalltalk sourcesName
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoFilesOpener>>unsetInformAboutReadOnlyChanges [
	"Make sure the user is *not* informed when the .changes file can not be written to."
	shouldInformAboutReadOnlyChanges := false
]
