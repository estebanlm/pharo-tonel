"
I am a refactoring for reformat the source code of all methods in this environment.

I have no precondition.
"
Class {
	#name : #RBPrettyPrintCodeRefactoring,
	#superclass : #RBRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:26'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPrettyPrintCodeRefactoring>>preconditions [
	^ RBCondition empty
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPrettyPrintCodeRefactoring>>transform [
	| source tree formatted |
	self model allClassesDo: [ :class |
		class selectors do: [ :selector |
			(self model environment includesSelector: selector in: class realClass) ifTrue: [
				source := class sourceCodeFor: selector.
				source isNil ifFalse: [ 
					tree := class parseTreeFor: selector.
					tree isNil ifFalse: [
						formatted := tree formattedCode.
						(source ~= formatted and: [ (RBParser parseMethod: formatted) = tree ]) 
							ifTrue: [ class compile: formatted classified: (class protocolsFor: selector) ] ] ] ] ] ] 
]
