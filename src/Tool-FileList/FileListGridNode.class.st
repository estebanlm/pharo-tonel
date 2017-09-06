"
A node in the file list grid
"
Class {
	#name : #FileListGridNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Tool-FileList,
	#timestamp : 'TorstenBergmann 2/4/2014 20:42'
}

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileListGridNode>>fileName [
	^ self theme newTextIn: self text: item basename
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileListGridNode>>filePermissions [
	^ self theme newTextIn: self text: item permissions asString
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileListGridNode>>fileSize [
	^ self theme newTextIn: self text: item humanReadableSize asString
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:25'
}
FileListGridNode>>modificationDate [
	^ self theme newTextIn: self text: item modificationTime asString
]
