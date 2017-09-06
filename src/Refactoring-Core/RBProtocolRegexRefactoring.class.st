"
I am a regex refactoring renaming protocol names.
"
Class {
	#name : #RBProtocolRegexRefactoring,
	#superclass : #RBRegexRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:41'
}

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBProtocolRegexRefactoring>>transform [
	| original replacement |
	self model allClassesDo: [ :class |
		class selectors do: [ :selector |
			original := (class realClass whichCategoryIncludesSelector: selector)
				asString.
			original isNil ifFalse: [
				replacement := self execute: original.
				replacement = original ifFalse: [
					class
						compile: (class sourceCodeFor: selector)
						classified: replacement ] ] ] ]
]
