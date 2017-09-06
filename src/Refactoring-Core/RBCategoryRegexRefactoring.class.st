"
I am a regex refactoring renaming class categories (package names).


"
Class {
	#name : #RBCategoryRegexRefactoring,
	#superclass : #RBRegexRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:41'
}

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCategoryRegexRefactoring>>transform [
	| replacement |
	self model allClassesDo: [ :class |
		(class isNil or: [ class isMeta ]) ifFalse: [
			replacement := self execute: class category.
			replacement = class category asString ifFalse: [
				class category: replacement.
				self model defineClass: class definitionString ] ] ]
]
