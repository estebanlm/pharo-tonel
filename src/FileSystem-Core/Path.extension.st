Extension {
	#name : #Path
}

{
	#category : #'*FileSystem-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
Path>>asFileReference [
	^ FileSystem disk referenceTo: self
]

{
	#category : #'*FileSystem-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
Path>>relativeToReference: aReference  [
	^ self relativeToPath: aReference path
]
