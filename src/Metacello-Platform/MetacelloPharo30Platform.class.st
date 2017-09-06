"
Class used to abstract specific code for the Pharo 3.0 platform.

"
Class {
	#name : #MetacelloPharo30Platform,
	#superclass : #MetacelloPharoCommonPlatform,
	#category : #Metacello-Platform,
	#timestamp : '<historical>'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform class>>initialize [
  self select


]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>compiler [
	^ self class compiler
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>defaultDirectory [
	"Get the image default directory"
	
	^ FileLocator imageDirectory asFileReference
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>defaultRepositoryDescription [
  ^ 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main'

]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>directoryFromPath: adirectoryPath relativeTo: anotherDirectoryPath [
	"Get a handle on the following path: anotherDirectoryPath/adirectoryPath"
	^ anotherDirectoryPath resolveString: adirectoryPath
]

{
	#category : #'github/bitbucket support',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>downloadJSON: url username: username pass: pass [
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  | client json |
  client := ZnClient new
    url: url;
    yourself.
  username ifNotNil: [ client username: username password: pass ].
  client get.
  json := client contents.
  ^ STON fromString: json

]

{
	#category : #'github support',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>downloadZipArchive: url to: outputFileName [
  "download zip archive from <url> into <outputFileName>"

	outputFileName asFileReference ensureDelete.
	ZnClient new
		url: url;
		downloadTo: outputFileName.
    ^ ZipArchive new 
		readFrom: outputFileName asFileReference

]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>ensureDirectoryExists: aDirectoryHandle [
	"Ensure the directory exists."

	^ aDirectoryHandle ensureCreateDirectory ; yourself
]

{
	#category : #'github support',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>extractRepositoryFrom: zipFile to: directory [
    "unzip <zipFile> into <directory>"
	ZipArchive new 
		readFrom:  zipFile;
		extractAllTo: directory asFileReference.
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>fileDirectoryClass [
	^FileSystem
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>fileFromPath: aFileName relativeTo: aDirectoryPath [
	"Get a handle on the following path: anotherDirectoryPath/aFileName"
	^ aDirectoryPath / aFileName
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>fileHandleOn: aPath [
	"Get an handle on a file."

	^ aPath asFileReference
]

{
	#category : #monticello,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>newVersionForWorkingCopy: aWorkingCopy [
	^aWorkingCopy newVersionIn: aWorkingCopy repositoryGroup
]

{
	#category : #'pharo 2.0 compat',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>packageInfoFor: aMCWorkingCopy [
  "MCPackageManager>>packageInfo is deprecated in Pharo2.0"

  ^ aMCWorkingCopy packageSet
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>parentDirectoryOf: aFileHandler [
	"Get the parent directory of this file."
	
	^ aFileHandler parent
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>readStreamOn: aFileHandle do: aBlock [
	"Get a read stream on the file handle and execute some actions on it."
	^ aFileHandle readStreamDo: aBlock
]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>recursiveDelete: aDirectory [
	"delete this directory and all children of it"

	^  aDirectory deleteAll
]

{
	#category : #'pharo 2.0 compat',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>registerPackageNamed: packageName [
  "PackageInfo deprecated in Pharo3.0"

  ^RPackageSet named: packageName

]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>string: aString includesSubstring: aSubstring [
	"abstract String>>includesSubstring: to have the same message on all supported platforms."

	^aString includesSubstring: aSubstring
]

{
	#category : #system,
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>suspendSystemUpdateEventsDuring: aBlock [
	"Wraps call to the system evetn manager to tell it that we want to suspend events during execution of aBlock"
	"From Pharo2, we cannot suspend system events since missing events brak the image (rpackage at least should be notified."
	"SystemAnnouncer uniqueInstance suspendAllWhile: aBlock"
	^ aBlock value

]

{
	#category : #'file system',
	#timestamp : ' 8/31/2017 07:16:15'
}
MetacelloPharo30Platform>>tempFileFor: aName suffix: aSuffixString [
	^ FileReference newTempFilePrefix: aName suffix: aSuffixString
]
