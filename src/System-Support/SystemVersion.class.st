"
I am responsible for maintaining what version of Pharo and the VM is running.  I also track all of the update items that have been included in the image.

I'm invoked at auto start to get the latest plugins, etc.

Some queries are
	SystemVersion current major
	SystemVersion current minor
	SystemVersion current suffix
	SystemVersion current	highestUpdate
"
Class {
	#name : #SystemVersion,
	#superclass : #Object,
	#instVars : [
		'version',
		'date',
		'highestUpdate',
		'type',
		'major',
		'minor',
		'suffix',
		'commitHash'
	],
	#classVars : [
		'Current'
	],
	#category : #System-Support
}

{ #category : #accessing }
SystemVersion class >> current [
	Current ifNil: [Current := SystemVersion new].
	^Current
]

{ #category : #'instance creation' }
SystemVersion class >> fromShortVersionString: aString [
	"Create a new SystemVersion from the given short version string. Useful for testing."

	| parts |
	parts := self parseShortVersionString: aString.
	^self new
		type: parts first;
		major: parts second;
		minor: parts third;
		suffix: parts fourth;
		yourself
]

{ #category : #'instance creation' }
SystemVersion class >> newVersion: versionName [
	"Install a new SystemVersion as the current version. Only preserve the higest update recorded.
	This method is a candidate for being removed, I am not sure it ever makes sense to do this."
	
	| newVersion |
	newVersion := self fromShortVersionString: versionName.
	newVersion
		highestUpdate: self current highestUpdate.
	Current := newVersion

]

{ #category : #accessing }
SystemVersion class >> parseShortVersionString: aString [ 
	"Answer the parts of aString, expected in short format <type><major>.<minor><suffix>."

	| stream length type major minor suffix |

	stream := aString readStream.
	[stream peek isDigit] whileFalse: [stream next].
	length := stream position.
	stream reset.
	type := (stream next: length).
	major := (stream upTo: $.) asInteger.
	stream := stream upToEnd readStream.
	[stream peek notNil and: [stream peek isDigit]] whileTrue: [stream next].
	length := stream position.
	stream reset.
	minor := (stream next: length) asInteger.
	suffix := stream upToEnd.
	^{type. major. minor. suffix}
]

{ #category : #accessing }
SystemVersion class >> parseVersionString: versionString [ 
	"Answer the version of this release as version, date, update."
	"SystemVersion parseVersionString: 'Squeak3.1alpha of 28 February 2001 [latest update: #3966]' "
	| version date update |
	
	[ | stream | stream := versionString readStream.
	version := stream upToAll: ' of '.
	date := Date readFrom: stream.
	stream upToAll: ' #'.
	update := Number readFrom: stream ] 
		on: Error
		do: [ ^ nil ].
	^ {  version. date. update  }
]

{ #category : #accessing }
SystemVersion >> commitHash [

	"Answer the hash of a Git commit from which the image was bootstrapped, e.g. '9ce829e86f978a84fa68df20008a3c1ee52e1fae'"

	^ commitHash
]

{ #category : #accessing }
SystemVersion >> commitHash: aString [

	"Set the hash of a Git commit from which the image was bootstrapped"

	commitHash := aString
]

{ #category : #accessing }
SystemVersion >> commitHashShort [

	"Answer the shorten hash of a Git commit from which the image was bootstrapped, e.g. '9ce829e"

	^ commitHash ifNotNil: [ commitHash first: (7 min: commitHash size) ]
]

{ #category : #accessing }
SystemVersion >> date [
	^date
]

{ #category : #accessing }
SystemVersion >> date: newDate [
	date := newDate
]

{ #category : #'accessing-version strings' }
SystemVersion >> datedVersion [
	" E.g. 'Pharo2.0a of ''18 April 2012''' "

	^ self version asString , ' of ' , self date printString.
]

{ #category : #accessing }
SystemVersion >> dottedMajorMinor [
	
	^ self majorMinor: '.'.
]

{ #category : #accessing }
SystemVersion >> highestUpdate [
	"Returns the highest number of available updates"
	^highestUpdate
]

{ #category : #accessing }
SystemVersion >> highestUpdate: anInteger [
	highestUpdate := anInteger
]

{ #category : #printing }
SystemVersion >> imageVersionString [
	"Print the version compatibile with naming the image."
	
	^String streamContents: [:str |
		str nextPutAll: self type;
			nextPut: $-;
			nextPutAll: self major printString;
			nextPut: $.;
			nextPutAll: self minor printString;
			nextPut: $-;
			nextPutAll: self suffix]
]

{ #category : #initialization }
SystemVersion >> initialize [
	super initialize.
	date := Date today.
]

{ #category : #accessing }
SystemVersion >> major [
	"Answer the major number of a version. 1 in '1.2'"

	^ major
]

{ #category : #accessing }
SystemVersion >> major: anObject [
	"Set the value of major"

	major := anObject
]

{ #category : #accessing }
SystemVersion >> majorMinor: aSeparatingString [
	"Return the major/minor version number of the form XaSeparatingStringY, without any 'alpha' or 'beta' or other suffix. If the receiver needs upgrading, do it. Remove the guard in 1.3."
	"SystemVersion current majorMinor: '-'"
	"SystemVersion current majorMinor: ''"

	^String streamContents: [:str |
		str 
			nextPutAll: self major printString; 
			nextPutAll: aSeparatingString;
			nextPutAll: self minor printString]
]

{ #category : #accessing }
SystemVersion >> majorMinorVersion [
	
	^ self type, self dottedMajorMinor.
]

{ #category : #accessing }
SystemVersion >> minor [
	"Answer the minor number of a version. 2 in '1.2'"

	^ minor
]

{ #category : #accessing }
SystemVersion >> minor: anObject [
	"Set the value of minor"

	minor := anObject
]

{ #category : #printing }
SystemVersion >> printOn: stream [
	stream nextPutAll: self imageVersionString
]

{ #category : #printing }
SystemVersion >> shortVersionString [
	"Print a short version string.  Compatibile with senders that concatenate this with 
	#lastUpdateString or #highestUpdate. Essentially the old version format. Guard 
	against no state being set."
	
	self type ifNil: [^'No version set'].
	^String streamContents: [:str |
		str 
			nextPutAll: self type;
			nextPutAll: self major printString;
			nextPut: $.;
			nextPutAll: self minor printString;
			nextPutAll: self suffix]
]

{ #category : #accessing }
SystemVersion >> suffix [
	"Answer the suffix (alpha, beta, rc  of a version. beta in '1.2beta'"

	^ suffix
]

{ #category : #accessing }
SystemVersion >> suffix: anObject [
	"Set the value of suffix"

	suffix := anObject
]

{ #category : #accessing }
SystemVersion >> type [
	"Answer the value of type"

	^ type
]

{ #category : #accessing }
SystemVersion >> type: anObject [
	"Set the value of type"

	type := anObject
]

{ #category : #accessing }
SystemVersion >> version [
	"Answer the short version string. If the receiver needs upgrading, do it."
	
	^self shortVersionString
]
