"
A file tree repository
"
Class {
	#name : #MCFileTreeRepository,
	#superclass : #MCDirectoryRepository,
	#instVars : [
		'readonly',
		'repositoryProperties'
	],
	#classInstVars : [
		'defaultPackageExtension',
		'defaultPropertyFileExtension'
	],
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 16:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>basicFromUrl: aZnUrl [
	^ self new directory: (self urlAsFileReference: aZnUrl)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>defaultPackageExtension [
    ".tree, .pkg, .package are the only formats supported at the moment:
	.tree         - original structure
	.pkg          - snapshot structure
	.package - cypress structure"

    defaultPackageExtension
        ifNil: [ 
            defaultPackageExtension := MCFileTreePackageStructureStWriter useCypressWriter
                ifTrue: [ '.package' ]
                ifFalse: [ '.pkg' ] ].
    ^ defaultPackageExtension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>defaultPackageExtension: aString [
    ".tree and .pkg are the only two formats supported at the moment"

    "self defaultPackageExtension:'.package'"

    (#('.tree' '.pkg' '.package') includes: aString)
        ifFalse: [ self error: 'Unsupported package extension: ' , aString printString ].
    defaultPackageExtension := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>defaultPropertyFileExtension [
  defaultPropertyFileExtension
    ifNil: [ defaultPropertyFileExtension := '.json' ].
  ^ defaultPropertyFileExtension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>defaultPropertyFileExtension: aString [
  "self defaultPropertyFileExtension:'.ston'"

  self validatePropertyFileExtension: aString.
  defaultPropertyFileExtension := aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>description [
    ^ 'filetree://'
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>parseName: aString [
    ^ self parseName: aString extension: self defaultPackageExtension
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>parseName: aString extension: extension [
    "picked up from GoferVersionReference>>parseName:"

    | info basicName package branch author versionNumber packageName |
    basicName := aString last isDigit
        ifTrue: [ aString ]
        ifFalse: [ (aString copyUpToLast: $.) copyUpTo: $( ].
    package := basicName copyUpToLast: $-.
    (package includes: $.)
        ifFalse: [ branch := '' ]
        ifTrue: [ 
            branch := '.' , (package copyAfter: $.).
            package := package copyUpTo: $. ].
    author := (basicName copyAfterLast: $-) copyUpToLast: $..
    versionNumber := (basicName copyAfterLast: $-) copyAfterLast: $..
    (versionNumber notEmpty and: [ versionNumber allSatisfy: [ :each | each isDigit ] ])
        ifTrue: [ versionNumber := versionNumber asNumber ]
        ifFalse: [ versionNumber := 0 ].
    packageName := package , branch.
    ^ {packageName.
    author.
    versionNumber.
    (packageName , extension)}
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>urlAsFileReference: aZnUrl [
	"Extracted from ZnUrl since the scheme is restricted.
	We need to keep host as a segment part."

	| path |
	path := aZnUrl host
		ifNotNil: [ 
			((aZnUrl host = #/) and: [ aZnUrl pathSegments isEmpty ])
				ifTrue: [ ^ FileSystem root ].
			aZnUrl pathSegments copyWithFirst: aZnUrl host ]
		ifNil: [ aZnUrl pathSegments copyWithFirst: FileSystem disk delimiter asString ].
	^ (String streamContents: 
			[ :stream | 
			path 
				asStringOn: stream 
				delimiter: FileSystem disk delimiter asString ])
		asFileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>urlSchemes [
	^ #(#filetree)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository class>>validatePropertyFileExtension: aString [
  "see Issue #90: https://github.com/dalehenrich/filetree/issues/90"

  (#('.json' '.ston') includes: aString)
    ifFalse: [ self error: 'Unsupported property file extension: ' , aString printString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>allFileNames [
    ^ (self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ])
        collect: [ :entry | entry name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>allFileNamesForVersionNamed: aString [
	^ self filterFileNames: self readableFileNames forVersionNamed: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>asRepositorySpecFor: aMetacelloMCProject [
    ^ aMetacelloMCProject repositorySpec
        description: self description;
        type: 'filetree';
        yourself
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>basicStoreVersion: aVersion [
  self readonly
    ifTrue: [ 
      ^ self error: 'The filetree repository: ' , self description printString
            , ' was created read only.' ].
  MCFileTreeWriter fileOut: aVersion on: self
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>cachedFileNames [
	^ #()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>canReadFileNamed: aString [
    ^ (aString endsWith: self packageExtension)
        or: [ 
            (aString endsWith: '.tree')
                or: [ 
                    "Cypress format"
                    aString endsWith: '.package' ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>defaultRepositoryProperties [
  ^ Dictionary new
    at: 'packageExtension' put: self class defaultPackageExtension;
    at: 'propertyFileExtension' put: self propertyFileExtension;
    yourself
]

{
	#category : #descriptions,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>description [
    ^ self class description , super description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>directory: aDirectory [
  super directory: aDirectory.
  repositoryProperties := nil.	"force properties to be reloaded from new location"
  self repositoryProperties	"NOW"
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>fileDirectoryOn: directoryPath [
    ^ self fileUtils directoryFromPath: directoryPath relativeTo: self directory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>fileUtils [
    ^ MCFileTreeFileUtils current
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>filterFileNames: aCollection forVersionNamed: aString [
	^ aCollection select: [:ea | (self versionNameFromFileName: ea) = aString]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>flushCache [
  "force properties to be reread ... if the directory exists, otherwise let nature
   take it's course"

  super flushCache.
  directory
    ifNotNil: [ 
      (MCFileTreeFileUtils current directoryExists: directory)
        ifTrue: [ 
          repositoryProperties := nil.
          self repositoryProperties ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>goferVersionFrom: aVersionReference [
    "until we no longer find .tree directories in the wild"

    ((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
        select: [ :packageDirectory | self fileUtils directoryExists: packageDirectory ])
        collect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
                ifTrue: [ ^ self loadVersionFromFileNamed: (self fileUtils directoryName: packageDirectory) ] ].
    ^ nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>packageDescriptionFromPackageDirectory: packageDirectory [
    | filename info extension |
    filename := self fileUtils current directoryName: packageDirectory.
    extension := filename copyFrom: (filename lastIndexOf: $.) to: filename size.
    ^ ((self packageExtension ~= '.package'
        and: [ 
            (self fileUtils filePathExists: 'version' relativeTo: packageDirectory)
                and: [ self fileUtils filePathExists: 'package' relativeTo: packageDirectory ] ])
        or: [ 
            | dir |
            dir := self fileUtils
                directoryFromPath: MCFileTreeStCypressWriter monticelloMetaDirName
                relativeTo: packageDirectory.
            self fileUtils directoryExists: dir ])
        ifTrue: [ 
            info := self versionInfoForPackageDirectory: packageDirectory.
            self parseName: info name extension: extension ]
        ifFalse: [ 
            {(filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1).
            'cypress'.
            1.
            filename} ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>packageDescriptionsFromReadableFileNames [
    ^ ((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
        select: [ :packageDirectory | self fileUtils directoryExists: packageDirectory ])
        collect: [ :packageDirectory | self packageDescriptionFromPackageDirectory: packageDirectory ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>packageExtension [
  ^ self repositoryProperties
    at: 'packageExtension'
    ifAbsent: [ self class defaultPackageExtension ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>parseName: aString extension: extension [
    ^ self class parseName: aString extension: extension
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>propertyFileExtension [
  ^ self repositoryProperties
    at: 'propertyFileExtension'
    ifAbsent: [ self class defaultPropertyFileExtension ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>propertyFileExtension: propertyFileExtension [
  self class validatePropertyFileExtension: propertyFileExtension.
  self repositoryProperties
    at: 'propertyFileExtension'
    put: propertyFileExtension.
  self writeRepositoryProperties
]

{
	#category : #i/o,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>readStreamForFileNamed: aString do: aBlock [
    ^ aBlock value: self directory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>readonly [
    readonly ifNil: [ readonly := false ].
    ^ readonly
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>readonly: anObject [
	readonly := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>repositoryProperties [
  repositoryProperties
    ifNil: [ 
      repositoryProperties := Dictionary new.
      (self fileUtils directoryExists: directory)
        ifFalse: [ 
          self
            error:
              'filetree:// repository '
                ,
                  (self fileUtils directoryPathString: self directory) printString
                , ' does not exist.' ].
      (self directory entries
        detect: [ :entry | entry name = '.filetree' ]
        ifNone: [  ])
        ifNil: [ 
          repositoryProperties := self defaultRepositoryProperties.
          self writeRepositoryProperties ]
        ifNotNil: [ :configEntry | 
          configEntry
            readStreamDo: [ :fileStream | repositoryProperties := STON fromStream: fileStream ] ] ].
  ^ repositoryProperties
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionFrom: aVersionReferenceString [
    "until we no longer find .tree directories in the wild"

    (self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
        select: [ :packageDirectory | self fileUtils directoryExists: packageDirectory ]
        thenCollect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReferenceString
                ifTrue: [ ^ self loadVersionFromFileNamed: (self fileUtils directoryName: packageDirectory) ] ].
    ^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionFromFileNamed: aString [
	^ self loadVersionFromFileNamed: aString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionInfoForPackageDirectory: packageDirectory [
    ^ ((MCReader readerClassForFileNamed: (self fileUtils directoryName: packageDirectory))
        on: (self fileUtils parentDirectoryOf: packageDirectory)
        fileName: (self fileUtils directoryName: packageDirectory))
        loadVersionInfo;
        info
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionInfoFromFileNamed: aString [
	^ self loadVersionInfoFromFileNamed: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionNameFromFileName: aString [
	| description |
	description := self packageDescriptionFromPackageDirectory: (self fileDirectoryOn: aString).
	^ description first , '-' , description second , '.' , description third printString
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>versionWithInfo: aVersionInfo ifAbsent: errorBlock [
	(self allFileNamesForVersionNamed: aVersionInfo name)
		ifNotEmpty: [ :aCollection | ^ self versionFromFileNamed: aCollection first ].
	^ errorBlock value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>writeRepositoryProperties [
  self fileUtils
    writeStreamFor: '.filetree'
    in: self directory
    do: [ :fileStream | 
      | keyCount propertyCount |
      repositoryProperties
        ifNil: [ repositoryProperties := self defaultRepositoryProperties ].
      keyCount := repositoryProperties size.
      propertyCount := 0.
      fileStream lineEndConvention: #'lf'.
      fileStream nextPutAll: '{'.
      repositoryProperties
        keysAndValuesDo: [ :propertyName :propertyValue | 
          propertyCount := propertyCount + 1.
          fileStream
            nextPut: $";
            nextPutAll: propertyName asString;
            nextPutAll: '" : "';
            nextPutAll: propertyValue asString;
            nextPut: $";
            yourself.
          propertyCount < keyCount
            ifTrue: [ 
              fileStream
                nextPutAll: ',';
                cr ] ].
      fileStream nextPutAll: ' }' ]

]

{
	#category : #i/o,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeRepository>>writeStreamForFileNamed: aString replace: aBoolean do: aBlock [
	self error: 'we do not open a single stream, but write multiple files'
]
