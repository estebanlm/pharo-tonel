Extension {
	#name : #FileSystem
}

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>* aFileOrDirectoryName [
	^ self disk * aFileOrDirectoryName
]

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>/ aFileOrDirectoryName [
	^ self disk / aFileOrDirectoryName
]

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>disk [
	"Answer a filesystem that represents the 'on-disk' filesystem used by the host operating system."

	^ DiskStore currentFileSystem
]

{
	#category : #'*FileSystem-Disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem>>isDiskFileSystem [
	^ store isDiskFileSystem
]

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>lookInUsualPlaces: fileName [
	"Check the default directory, the imagePath, and the vmPath (and the vmPath's owner) for this file."

	| file |
	 (file := fileName asFileReference) exists
		ifTrue: [ ^ file ].

	(file := Smalltalk imageFile resolve: fileName) exists
		ifTrue: [ ^ file ].

	(file :=  Smalltalk vmDirectory resolve: fileName) exists
		ifTrue: [ ^ file ].

	(file := Smalltalk vmDirectory parent resolve: fileName) exists
		ifTrue: [ ^ file ].

	^ nil
]

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>root [
	^ self disk root
]

{
	#category : #'*filesystem-disk',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>workingDirectory [
	^ self disk workingDirectory
]
