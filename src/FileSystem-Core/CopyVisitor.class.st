"
I create a copy of the directory tree that I visit. I use the PreorderGuide so that I can create directories before creating their contents. 
"
Class {
	#name : #CopyVisitor,
	#superclass : #FileSystemVisitor,
	#instVars : [
		'source',
		'dest'
	],
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 12:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor class>>copy: source to: dest [
	(self from: source to: dest) visit
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor class>>from: srcReference to: dstReference [
	^ self basicNew
		initializeWithSource: srcReference 
		dest: dstReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>copyDirectory: aReference [
	| directory |
	directory := dest resolve: (aReference relativeTo: source).
	directory createDirectory
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>copyFile: aReference [
	| copy |
	copy := dest resolve: (aReference relativeTo: source).
	aReference copyTo: copy
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>initializeWithSource: srcReference dest: dstReference [
	self initialize.
	source := srcReference.
	dest := dstReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>visit [
	(PreorderGuide for: self) 
		show: source
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>visitDirectory: anEntry [
	| reference |
	reference := anEntry reference.
	reference = source
		ifTrue: [dest ensureCreateDirectory]
		ifFalse: [self copyDirectory: reference]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CopyVisitor>>visitFile: anEntry [
	| reference |
	reference := anEntry reference.
	reference = source
		ifTrue: [source copyTo: dest]
		ifFalse: [self copyFile: reference]
]
