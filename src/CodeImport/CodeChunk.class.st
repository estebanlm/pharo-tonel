"
I'm the abstract superclass of all the code declarations that should exist in an exported file.
"
Class {
	#name : #CodeChunk,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk class>>contents: someContents [
	^self new
			contents: someContents;
			yourself
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>accept: aVisitor [

	^ aVisitor visitCodeChunk: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>contents [
	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>contents: anObject [
	contents := anObject
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>import [
	self importFor: nil logSource: true
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>importFor: aRequestor logSource: logSource [
	self import
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>isClassCommentDeclaration [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>isClassOrganizationDeclaration [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>isDoItDeclaration [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>isMethodDeclaration [

	^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
CodeChunk>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: contents.
	aStream nextPut: $).
]
