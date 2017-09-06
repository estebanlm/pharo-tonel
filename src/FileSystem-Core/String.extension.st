Extension {
	#name : #String
}

{
	#category : #'*filesystem-core-converting',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asFileReference [

	^ FileSystem disk referenceTo: self
]

{
	#category : #'*filesystem-core-converting',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asPath [
	"convert myself to a path"
	"Examples:
		'.' asPath
		'~/Desktop' asPath
		'/home/foo' asPath
		'../../foo.bar' asPath"
	^ FileSystem disk resolve: self
]

{
	#category : #'*filesystem-core-converting',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asPathWith: anObject  [
	^ anObject pathFromString: self
]

{
	#category : #'*filesystem-core-converting',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asResolvedBy: aFileSystem [
	^ aFileSystem resolveString: self
]
