"
This class shouldn't trigger the RBAddRemoveDependentsRule critic.
"
Class {
	#name : #RBSmalllintTestAddRemoveDependentsGoodObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/10/2016 17:41'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestAddRemoveDependentsGoodObject>>addDependentSends [
	self
		addDependent: #one;
		addDependent: #two
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestAddRemoveDependentsGoodObject>>removeDependentSends [
	self
		removeDependent: #one;
		removeDependent: #two
]
