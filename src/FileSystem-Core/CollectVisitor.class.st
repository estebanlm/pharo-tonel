"
I am a visitor that collects objects from the nodes I visit. I take a block similar to those passed to Collection>>collect:. I evaluate the block with DirectoryEntries for the nodes I visit, and collect the objects answered into an array.

I can use any guide, and the objects in the array I produce will reflect the order imposed by the guide.
"
Class {
	#name : #CollectVisitor,
	#superclass : #AbstractEnumerationVisitor,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 12:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>breadthFirst: aReference [
	^ self breadthFirst: aReference collect: [:entry | entry]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>breadthFirst: aReference collect: aBlock [
	^ (self collect: aBlock) breadthFirst: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>collect: aBlock [
	^ self basicNew initializeWithBlock: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>postorder: aReference [
	^ self postorder: aReference collect: [:entry | entry]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>postorder: aReference collect: aBlock [
	^ (self collect: aBlock) postorder: aReference
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>preorder: aReference [
	^ self preorder: aReference collect: [:entry | entry]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor class>>preorder: aReference collect: aBlock [
	^ (self collect: aBlock) preorder: aReference
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:22'
}
CollectVisitor>>visitReference: anEntry [
	out nextPut: (block value: anEntry)
]
