"
Kernel trait for ComposingDescription
"
Trait {
	#name : #TComposingDescription,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Traits-Kernel-Traits,
	#timestamp : 'TorstenBergmann 2/4/2014 20:37'
}

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>+ aTraitOrTraitComposition [
	"Use double dispatch to avoid having nested composition in cases where
	parenthesis are used, such as T1 + (T2 + T3)"
	
	^aTraitOrTraitComposition addOnTheLeft: self
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>- anArrayOfSelectors [
	^TraitExclusion
		with: self
		exclusions: anArrayOfSelectors
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>@ anArrayOfAssociations  [
	^ TraitAlias with: self aliases: anArrayOfAssociations
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>addCompositionOnLeft: aTraitComposition [
	^ aTraitComposition add: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>addOnTheLeft: aTraitExpression [
	^TraitComposition with: aTraitExpression with: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:25'
}
TComposingDescription>>asTraitComposition [
	^TraitComposition with: self
]
