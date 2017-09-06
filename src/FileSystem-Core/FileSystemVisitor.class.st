"
I am an abstract superclass for objects that can perform operations on directory trees. My subclasses implement the visitor protocol, and process filesystem nodes shown to them by guides.
"
Class {
	#name : #FileSystemVisitor,
	#superclass : #Object,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 12:25'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemVisitor>>visitDirectory: aReference [
	^ self visitReference: aReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemVisitor>>visitFile: aReference [
	^ self visitReference: aReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemVisitor>>visitReference: aReference [

]
