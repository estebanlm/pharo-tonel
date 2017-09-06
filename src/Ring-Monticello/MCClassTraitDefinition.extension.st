Extension {
	#name : #MCClassTraitDefinition
}

{
	#category : #'*Ring-Monticello',
	#timestamp : ' 8/31/2017 07:17:02'
}
MCClassTraitDefinition>>asRingDefinition [

	^(RGMetatraitDefinition named:  baseTrait)
		traitCompositionSource: self classTraitCompositionString;
		definitionSource: self definitionString;
		yourself
]

{
	#category : #'*Ring-Monticello',
	#timestamp : ' 8/31/2017 07:17:02'
}
MCClassTraitDefinition>>classDefinitionString [

	^self definitionString
]
