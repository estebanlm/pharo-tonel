"
A trait transformation is an instance of one of my concrete subclasses, TraitAlias or TraitExclusion. These represent a transformation of a trait, specified by the alias and exclusion operators. 

I define an instance variable named subject which holds the object that is transformed.  Thus, an alias transformation has as its subject a trait, and a trait exclusion has as its subject either a trait alias or a trait. Each of the concrete transformation classes implement the method allSelectors according to the transformation it represents. 

(There was formerly a subclass called TraitHolder, which was the identity transformation and which did not modify the trait.  This was clearly redundant, and was removed.)
"
Class {
	#name : #TraitTransformation,
	#superclass : #Object,
	#instVars : [
		'subject'
	],
	#category : #Traits-Composition,
	#timestamp : 'apb 8/25/2005 11:54'
}

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>+ aTraitOrTraitComposition [
	"Use double dispatch to avoid having nested composition in cases where
	parenthesis are used, such as T1 + (T2 + T3)"
	
	^aTraitOrTraitComposition addOnTheLeft: self
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>- anArray [
	TraitCompositionException signal: 'Invalid trait exclusion. Exclusions have to be specified after aliases.'
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>@ anArrayOfAssociations [
	TraitCompositionException signal: 'Invalid trait exclusion. Aliases have to be specified before exclusions.'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>addCompositionOnLeft: aTraitComposition [
	^ aTraitComposition add: self
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>addExclusionOf: aSymbol [
	^self - {aSymbol}
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>addOnTheLeft: aTraitExpression [
	^TraitComposition with: aTraitExpression with: self
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>aliasesForSelector: aSymbol [
	"Return a collection of alias selectors that are defined in this transformation."
	
	^self subject aliasesForSelector: aSymbol
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>allAliasesDict [
	"Return a dictionary with all alias associations that are defined in this transformation."
	
	^self subject allAliasesDict
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>allSelectors [
	^self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>asTraitComposition [
	^TraitComposition with: self
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>changedSelectorsComparedTo: aTraitTransformation [
	| selectors otherSelectors changedSelectors aliases otherAliases |
	selectors := self allSelectors asIdentitySet.
	otherSelectors := aTraitTransformation allSelectors asIdentitySet.
	changedSelectors := IdentitySet withAll: (
		(selectors difference: otherSelectors) union: (otherSelectors difference: selectors)).
	aliases := self allAliasesDict.
	otherAliases := aTraitTransformation allAliasesDict.
	aliases keysAndValuesDo: [:key :value |
		(value ~~ (otherAliases at: key ifAbsent: [nil])) ifTrue: [changedSelectors add: key]].
	otherAliases keysAndValuesDo: [:key :value |
		(value ~~ (aliases at: key ifAbsent: [nil])) ifTrue: [changedSelectors add: key]].
	^ changedSelectors.
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>collectMethodsFor: aSelector into: methodDescription [
	"Collect instances of LocatedMethod into methodDescription
	for each method that has the selector aSelector and is not excluded
	or for which aSelector is an alias."

	self subclassResponsibility
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>copy [
	self error: 'should not be called'.
	^super copy
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>copyTraitExpression [
	^self shallowCopy 
		subject: self subject copyTraitExpression;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>isEmpty [
	self subclassResponsibility
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>isMeta [
	^self subject isMeta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>normalized [
	^self isEmpty
		ifFalse: [
			self subject: self subject normalized.
			self]
		ifTrue: [self subject normalized]
		
		
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>postCopy [
	super postCopy.
	subject := subject copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>printOn: aStream [
	aStream print: self subject
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>removeAlias: aSymbol [
	self subject removeAlias: aSymbol
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>selectors [
	^self allSelectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>subject [
	^subject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>subject: aTraitTransformation [
	subject := aTraitTransformation
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>syntacticallyEquals: aTraitTransformation [
	"Test syntactic equivalence of this trait transformation with another."
	
	^ self subclassResponsibility 
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>theNonMetaClass  [
	^ self subject theNonMetaClass  
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>trait [
	^self subject trait
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitTransformation>>traitTransformations  [
	^ { subject }
]
