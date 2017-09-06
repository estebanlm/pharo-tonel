"
I'm a specific store for Unix file systems
"
Class {
	#name : #UnixStore,
	#superclass : #DiskStore,
	#category : #FileSystem-Disk,
	#timestamp : '<historical>'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore class>>delimiter [
	^ $/
]

{
	#category : #current,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore class>>isActiveClass [
	^ Smalltalk os isUnix and: [ super isActiveClass ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore class>>isCaseSensitive [
	"except for OSX the default is case sensitive"
	^ Smalltalk os isMacOSX not
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore class>>maxFileNameLength [

	^ 255
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore class>>separator  [
	^ $:
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
UnixStore>>checkName: aFileName fixErrors: fixing [
	"Check if the file name contains any invalid characters"
	| fName |
	fName := super checkName: aFileName fixErrors: fixing.
	
	(fName includes: self delimiter) ifFalse:
		[^fName].
	
	fixing ifFalse: [self error:'Invalid file name'].
	
	^ fName copyReplaceAll: self delimiter asString with: '#'
]
