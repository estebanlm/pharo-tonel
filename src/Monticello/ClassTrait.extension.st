Extension {
	#name : #ClassTrait
}

{
	#category : #'*Monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
ClassTrait>>asMCDefinition [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^MCClassTraitDefinition
		baseTraitName: self baseTrait name
		classTraitComposition: self traitCompositionString
		category: self category
			
]
