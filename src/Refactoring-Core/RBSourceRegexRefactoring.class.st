"
I am a regex refactoring replacing method sources.
"
Class {
	#name : #RBSourceRegexRefactoring,
	#superclass : #RBRegexRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:41'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSourceRegexRefactoring>>parseMethod: aString [
	^ [ RBParser parseMethod: aString ]
		on: Error do: [ :err | nil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSourceRegexRefactoring>>parseSelector: aSelector [
	^ [ RBParser parseMethodPattern: aSelector ]
		on: Error
		do: [ nil ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSourceRegexRefactoring>>transform [
	| original replacement protocols |
	self model allClassesDo: [ :class |
		class selectors do: [ :selector |
			original := class sourceCodeFor: selector.
			replacement := self execute: original.
			replacement = original ifFalse: [
				(self parseMethod: replacement) isNil ifFalse: [
					protocols := class protocolsFor: selector.
					(self parseSelector: replacement) = selector
						ifFalse: [ class removeMethod: selector ].
					class compile: replacement classified: protocols ] ] ] ]
]
