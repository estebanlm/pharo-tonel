"
I am a late-bound reference. I refer to a file or directory in relation to a well-known location on the filesystem, called an origin. When asked to perform concrete operation, I look up the current location of my origin, and resolve my path against it. 

Usage
----------
FileLocator vmDirectory parent pathString
	> '/Applications'


FileLocator desktop.
FileLocator desktop basename.

FileLocator home basename.
FileLocator image.
FileLocator vmBinary asAbsolute pathString 
	>  '/Applications/CogVM.app/Contents/MacOS/CogVM'
FileLocator vmBinary pathString 
	> '/Applications/CogVM.app/Contents/MacOS/CogVM'
		




Implementation
------------------------
origin 
	A symbolic name for base reference I use to resolve myself.

path
	A relative path that is resolved against my origin""
	
	
"
Class {
	#name : #FileLocator,
	#superclass : #AbstractFileReference,
	#instVars : [
		'origin',
		'path'
	],
	#classVars : [
		'Resolver'
	],
	#category : #FileSystem-Core-Public,
	#timestamp : '<historical>'
}

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>A [
	^ self driveNamed: #A 

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>B [
	^ self driveNamed: #B

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>C [
	^ self driveNamed: #C

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>D [
	^ self driveNamed: #D

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>E [
	^ self driveNamed: #E

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>F [
	^ self driveNamed: #F

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>G [
	^ self driveNamed: #G

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>H [
	^ self driveNamed: #H

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>I [
	^ self driveNamed: #I

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>J [
	^ self driveNamed: #J

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>K [
	^ self driveNamed: #K

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>L [
	^ self driveNamed: #L

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>M [
	^ self driveNamed: #M

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>N [
	^ self driveNamed: #N

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>O [
	^ self driveNamed: #O

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>P [
	^ self driveNamed: #P

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>Q [
	^ self driveNamed: #Q

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>R [
	^ self driveNamed: #R

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>S [
	^ self driveNamed: #S

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>T [
	^ self driveNamed: #T

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>U [
	^ self driveNamed: #U

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>V [
	^ self driveNamed: #V

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>W [
	^ self driveNamed: #W
]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>X [
	^ self driveNamed: #X

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>Y [
	^ self driveNamed: #Y

]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>Z [
	^ self driveNamed: #Z

]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>addResolver: aResolver [
	Resolver addResolver: aResolver
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>cache [
	^ self origin: #cache
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>changes [
	^ self origin: #changes 
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>cwd [
	^ self workingDirectory
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>desktop [
	^ self origin: #desktop
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>documents [
	^ self origin: #documents
]

{
	#category : #windows-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>driveNamed: driveName [
	^ FileReference fileSystem: (FileSystem disk) path: Path / (driveName, ':')
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>flushCaches [
	Resolver flushCaches
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>home [
	^ self origin: #home
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>image [
	^ self origin: #image 
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>imageDirectory [
	^ self origin: #imageDirectory 
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>initialize [
	"FileLocator is needed to initialize SystemSettingsPersistence (call to FileLocator>>#preferences),
	and could be useful for other classes.
	Let initialize FileLocator before other standard system classes."
	SessionManager default 
		registerSystemClassNamed: self name atPriority: 90.
	self startUp: true
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>localDirectory [
	^ self origin: #localDirectory 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>origin: aSymbol  [
	^ self origin: aSymbol path: Path workingDirectory
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>origin: aSymbol path: aPath [
	^ self basicNew 
			initializeWithOrigin: aSymbol path: aPath
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>preferences [
	^ self origin: #preferences
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>root [
	^ FileSystem disk root
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>startUp: resuming [
	resuming
		ifFalse: [ ^ self ].
	Resolver := InteractiveResolver new.
	Resolver addResolver: SystemResolver new.
	Resolver addResolver: PlatformResolver forCurrentPlatform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>supportedOrigins [
	| origins current |
	origins := IdentitySet new.
	current := Resolver.
	[current notNil] whileTrue:
		[origins addAll: current supportedOrigins.
		current := current next].
	^ origins
]

{
	#category : #mac-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>systemApplicationSupport [
	^ self origin: #systemApplicationSupport
]

{
	#category : #mac-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>systemLibrary [
	^ self origin: #systemLibrary
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>temp [
	^ self origin: #temp
]

{
	#category : #mac-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>userApplicationSupport [
	^ self origin: #userApplicationSupport
]

{
	#category : #unix-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>userData [
	^ self origin: #userData
]

{
	#category : #mac-origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>userLibrary [
	^ self origin: #userLibrary
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>vmBinary [
	^ self origin: #vmBinary
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>vmDirectory [
	^ self origin: #vmDirectory
]

{
	#category : #origins,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator class>>workingDirectory [
	^ FileSystem disk referenceTo: RelativePath new
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>= other [
	^ self species = other species
		and: [origin = other origin
			and: [path = other path]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>absolutePath [
	"Return the absolute path"
	^ self resolve path
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>asAbsolute [
	^ self 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>asFileReference [
	^ self resolve
]

{
	#category : #streams-compatibility,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>binaryReadStream [
	^ self resolve binaryReadStream
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>copyWithPath: newPath [
	^ self class origin: origin path: newPath
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>doesNotUnderstand: aMessage [
	"Redirect message to the resolved version of this FileLocator.
	If FileReference won't understand the message send a normal DNU."

	| resolved |
	
	resolved := self resolve.
	(resolved respondsTo: aMessage selector)
		ifTrue: [ ^ resolved perform: aMessage selector withArguments: aMessage arguments ].
	
	^ super doesNotUnderstand: aMessage.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>fullPath [
	^ self resolve path
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>hash [
	^ origin hash bitXor: path hash
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>initializeWithOrigin: aSymbol path: aPath [
	self initialize.
	origin := aSymbol.
	path := aPath.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>isAbsolute [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>isRelative [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>origin [
	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>path [
	^ path
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>printOn: aStream [
	| fs |
	aStream
		nextPut: ${;
		nextPutAll: origin;
		nextPut: $}.
	path isWorkingDirectory
		ifTrue: [ ^ self ].
	fs := self fileSystem.
	aStream nextPut: fs delimiter.
	fs printPath: path on: aStream
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>readStream [
	^ self resolve readStream 
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>renameTo: newBasename [
	
	| result |
	result := self resolve renameTo: newBasename.
	path size > 0
		ifTrue: [ path basename: newBasename ]
		ifFalse: [ path := result path ]
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>resolve [
	^ (Resolver resolve: origin) resolve: path
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>resolveString: aString [
	| filesystem thePath |
	filesystem := (Resolver resolve: origin) fileSystem.
	thePath := filesystem pathFromString: aString.
	^ self withPath: (path resolvePath: thePath)
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileLocator>>writeStream [
	^ self resolve writeStream 
]
