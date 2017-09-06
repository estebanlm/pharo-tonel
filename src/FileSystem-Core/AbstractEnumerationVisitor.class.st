"
I'm an abstract superclass for enumeration operations on directory entries. 
"
Class {
	#name : #AbstractEnumerationVisitor,
	#superclass : #FileSystemVisitor,
	#instVars : [
		'out',
		'block'
	],
	#category : #FileSystem-Core-Implementation,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>breadthFirst: aReference [
	^ self visit: aReference with: (BreadthFirstGuide for: self)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>initializeWithBlock: aBlock [
	self initialize.
	block := aBlock
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>postorder: aReference [
	^ self visit: aReference with: (PostorderGuide for: self)
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>preorder: aReference [
	^ self visit: aReference with: (PreorderGuide for: self)
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>visit: aReference with: aGuide [
	out := (Array new: 10) writeStream.
	aGuide show: aReference.
	^ out contents
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractEnumerationVisitor>>visitReference: anEntry [
	self subclassResponsibility
]
