"
methods that make the user of this trait protocol-compatible with TraitTransformation.
When used in Trait and ClassTrait, this eliminates the need for TraitHolders.

"
Trait {
	#name : #TTransformationCompatibility,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Traits-Kernel-Traits,
	#timestamp : 'apb 8/22/2005 15:24'
}

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTransformationCompatibility>>aliasesForSelector: aSelector  [
	^ OrderedCollection new

]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTransformationCompatibility>>allAliasesDict [
	^IdentityDictionary new

]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTransformationCompatibility>>changedSelectorsComparedTo: aTraitTransformation [
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
TTransformationCompatibility>>collectMethodsFor: aSelector into: methodDescription [
	(self includesSelector: aSelector) ifTrue: [ 
		methodDescription addLocatedMethod: 
			(self compiledMethodAt: aSelector)
		]
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTransformationCompatibility>>subject [
	"for compatibility with TraitTransformations"
	^ self

]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTransformationCompatibility>>trait [
	"for compatibility with TraitTransformations"
	^ self

]
