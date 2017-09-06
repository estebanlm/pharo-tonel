"
This class shouldn't trigger the RBDefinesEqualNotHashRule critic.
"
Class {
	#name : #RBSmalllintTestDefinesEqualNotHashGoodObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/10/2016 18:04'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestDefinesEqualNotHashGoodObject>>= anObject [
	^ self == anObject
		or: [self species == anObject species]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestDefinesEqualNotHashGoodObject>>hash [
	^ self species identityHash
]
