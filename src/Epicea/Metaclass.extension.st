Extension {
	#name : #Metaclass
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
Metaclass>>asEpiceaRingDefinition [

	| baseClassDefinition |
	baseClassDefinition  := self theNonMetaClass asEpiceaRingDefinition.

	^ baseClassDefinition withMetaclass theMetaClass 
		traitCompositionSource: self classSide traitCompositionString;
		definitionSource: self classSide definition;
		addInstanceVariables: self classSide instVarNames;
		yourself
]
