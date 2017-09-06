"
This class should trigger the RBDefinesEqualNotHashRule critic.
"
Class {
	#name : #RBSmalllintTestDefinesEqualNotHashObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/10/2016 18:03'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestDefinesEqualNotHashObject>>= anObject [
	^ self == anObject
		or: [self species == anObject species]
]
