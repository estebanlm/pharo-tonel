"
I collect refactorings during a refactory execute-step.

All changes are applied to the system and collected by a unique RBRefactoryChangeManager instance. 
You should use the uniqe instance of me.

"
Class {
	#name : #RBRefactoringManager,
	#superclass : #Object,
	#instVars : [
		'refactorings'
	],
	#classVars : [
		'Instance'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager class>>instance [
	^ Instance ifNil: [ Instance := self basicNew initialize ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager class>>new [
	^ self shouldNotImplement
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager class>>nuke [
	Instance notNil ifTrue: [ Instance release ].
	Instance := nil
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager class>>unload [
	self nuke
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager>>addRefactoring: aRefactoring  [
	RBRefactoryChangeManager instance performChange: aRefactoring changes.
	refactorings add: aRefactoring class name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager>>initialize [
	refactorings := Bag new
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoringManager>>printOn: aStream  [
	aStream nextPutAll: '#		Refactoring';
		cr;
		nextPutAll: '---		-----------------------------------------------';
		cr.
	refactorings asSet asSortedCollection do: 
			[:name | 
			aStream nextPutAll: (refactorings occurrencesOf: name) printString;
				nextPutAll: '		';
				nextPutAll: name;
				cr]
]
