"
This class should trigger the RBClassNotReferencedRule critic. All other classes in this hierarchy must be referenced somewhere. After adding a class to the hierarchy, evaluate the following to ensure it has at least one explicit reference:
	RBSmalllintTestSuperclassObject updateDefaultExplicitClassReferences.
"
Class {
	#name : #RBSmalllintTestClassNotReferencedObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/11/2016 00:25'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestClassNotReferencedObject class>>mustNotBeReferenced [
	^ true
]
