"
A critique which contains the AST that should replace the existing one of the criticized entity
"
Class {
	#name : #ReTransformationCritique,
	#superclass : #ReAbstractCritique,
	#instVars : [
		'newTree'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:40'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTransformationCritique class>>for: anEntity by: aRule tree: newAST [

	^ self basicNew
		initializeRule: aRule
		target: anEntity
		tree: newAST;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTransformationCritique>>change [
	"re-add the method compiled from the new AST"
	
	^ RBAddMethodChange compile: newTree newSource in: sourceAnchor entity methodClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTransformationCritique>>initializeRule: aRule target: anEntity tree: newAST [

	self initializeRule: aRule target: anEntity.
	newTree := newAST 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTransformationCritique>>providesChange [
	
	^ true
]
