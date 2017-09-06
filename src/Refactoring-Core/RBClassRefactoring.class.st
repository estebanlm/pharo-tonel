"
I am an abstract base class for class refactorings.

All that I provide is the class name, my subclass refactorings are operating on, and a instance creation method
for setting the class name and an initial namespace model.

RBClassRefactoring model:className: 


"
Class {
	#name : #RBClassRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'className'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:33'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRefactoring class>>className: aName [
	^self new className: aName
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRefactoring class>>model: aRBSmalltalk className: aName  [
	^(self new)
		model: aRBSmalltalk;
		className: aName;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRefactoring>>className: aName [
	className := aName
]
