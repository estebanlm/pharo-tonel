"
I traverse the filesystem in depth-first post order. Given this hierarchy:

alpha
	beta
	gamma
delta
	epsilon

I would visit the nodes in the following order:  beta, gamma, alpha, epsilon, delta.

I use my work instance variable as a stack. I push messages that cause nodes to be traversed or visited, and execute them in reverse order.
"
Class {
	#name : #PostorderGuide,
	#superclass : #FileSystemGuide,
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 12:16'
}

{
	#category : #showing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PostorderGuide>>pushTraverse: aReference  [
	self push: (Message 
				selector: #traverse:
				argument: aReference)
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PostorderGuide>>pushVisit: aReference  [
	self push: (Message 
				selector: #visit:
				argument: aReference)
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PostorderGuide>>show: aReference  [
	self pushTraverse: aReference entry.
	self whileNotDoneDo: [ self pop sendTo: self ]
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PostorderGuide>>traverse: anEntry  [
		
	self pushVisit: anEntry.
	
	anEntry isDirectory ifTrue: [ 
		(self shouldVisitChildrenOf: anEntry)
			ifFalse: [ ^ self ].
		anEntry reference entries reverseDo: [ :each | 
			self pushTraverse: each ]]
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 07:16:22'
}
PostorderGuide>>visit: anEntry [
	anEntry isDirectory
		ifTrue: [ visitor visitDirectory: anEntry ]
		ifFalse: [ visitor visitFile: anEntry ]
]
