"
I am a visitor that selects objects from the nodes I visit. I take a block similar to those passed to Collection>>select:. I evaluate the block with DirectoryEntries for the nodes I visit.

I can use any guide, and the objects in the array I produce will reflect the order imposed by the guide.
"
Class {
	#name : #SelectVisitor,
	#superclass : #AbstractEnumerationVisitor,
	#category : #FileSystem-Core-Implementation,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>breadthFirst: aReference [
	^ self breadthFirst: aReference select: [:entry | true]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>breadthFirst: aReference select: aBlock [
	^ (self select: aBlock) breadthFirst: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>postorder: aReference [
	^ self postorder: aReference select: [:entry | true]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>postorder: aReference select: aBlock [
	^ (self select: aBlock) postorder: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>preorder: aReference [
	^ self preorder: aReference select: [:entry | true]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>preorder: aReference select: aBlock [
	^ (self select: aBlock) preorder: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor class>>select: aBlock [
	^ self basicNew initializeWithBlock: aBlock
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
SelectVisitor>>visitReference: anEntry [
	(block value: anEntry) 
		ifTrue: [ out nextPut: anEntry ]
]
