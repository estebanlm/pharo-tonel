"
This class should trigger the RBAddRemoveDependentsRule critic.
"
Class {
	#name : #RBSmalllintTestAddRemoveDependentsObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/10/2016 17:33'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestAddRemoveDependentsObject>>addDependentSends [
	self
		addDependent: #one;
		addDependent: #two
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestAddRemoveDependentsObject>>removeDependentSends [
	self removeDependent: #one
]
