"
I represent a refactoring performed in the system. 
"
Class {
	#name : #EpRefactoring,
	#superclass : #EpEvent,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:16'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRefactoring>>accept: aChangeVisitor  [
	^ aChangeVisitor visitRefactoring: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRefactoring>>asRBRefactoring [
	"Answer the RBRefactoring corresponding to myself."
	
	^ self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRefactoring>>canBuildRBRefactoring [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRefactoring>>isEpRefactoring [

	^ true
]
