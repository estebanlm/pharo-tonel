"
I resolve origins that are related to the currently running Smalltalk system, using primitives provided by the VM. 
"
Class {
	#name : #SystemResolver,
	#superclass : #FileSystemResolver,
	#classVars : [
		'UserLocalDirectory'
	],
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 11:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver class>>defaultLocalDirectoryName [
	^ 'pharo-local'
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver class>>settingsOn: aBuilder [
	<systemsettings>  

	(aBuilder setting: #userLocalDirectory)
		parent: #pharoSystem;
		type: #Directory;
		target: self;
		description: 'The path of a directory where Pharo will store local files' ;
		label: 'Local directory'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver class>>userLocalDirectory [
	^ UserLocalDirectory ifNil: [ 
		FileLocator workingDirectory / self defaultLocalDirectoryName  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver class>>userLocalDirectory: aFileReference [
	UserLocalDirectory := aFileReference
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>changes [
	^ self image withExtension: Smalltalk changesSuffix
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>image [
	^ self resolveString: self primImagePath
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>imageDirectory [
	^ self image parent
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>localDirectory  [
	^ self class userLocalDirectory 
		ifNil: [ (self imageDirectory / self class defaultLocalDirectoryName) ensureCreateDirectory ]
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>primImagePath [
	"Answer the full path name for the current image."

	<primitive: 121>
	self primitiveFailed
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>primVmDirectoryPath [
	"Answer the full path name for the current virtual machine."

	<primitive: 142>
	self primitiveFailed
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>supportedOrigins [
	^ #(image imageDirectory changes vmBinary vmDirectory workingDirectory localDirectory)
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>vmBinary [
	^ self resolveString: (Smalltalk vm fullPath)
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
SystemResolver>>vmDirectory [
	^ self resolveString: self primVmDirectoryPath
]
