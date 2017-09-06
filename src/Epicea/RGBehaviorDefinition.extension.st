Extension {
	#name : #RGBehaviorDefinition
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RGBehaviorDefinition>>traitComposition [
	
	^ (self class compiler evaluate: self traitCompositionSource) asTraitComposition
]
