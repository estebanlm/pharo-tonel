"
I delete the directory tree that I visit. I use the PostorderGuide so that I can delete files before deleting their containing directories.
"
Class {
	#name : #DeleteVisitor,
	#superclass : #FileSystemVisitor,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 12:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
DeleteVisitor class>>delete: aReference [
	^ self new visit: aReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
DeleteVisitor>>visit: aReference [
	PostorderGuide 
		show: aReference 
		to: self 
		selecting: [ :entry | entry isSymlink not ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
DeleteVisitor>>visitReference: anEntry [
	anEntry reference delete
]
