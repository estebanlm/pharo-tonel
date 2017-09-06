"
The rule detects if any Float system classes are refferenced by an AST
"
Class {
	#name : #FloatReferencesRule,
	#superclass : #ReBasicTreeRule,
	#category : #Kernel-Rules,
	#timestamp : 'YuriyTymchuk 2/24/2016 11:47'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>basicCheck: anEntity [
	
	 self
		check: anEntity
		forCritiquesDo: [ ^ true ]
		ifNone: [ ^ false ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>check: anAST forCritiquesDo: aCriticBlock ifNone: alternativeBlock [

	| encounteredCritique |
	encounteredCritique := false.

	anAST nodesDo: [ :node |
		(node isVariable and: [
		node binding ifNil: [ node doSemanticAnalysis ].
		node isGlobal and: [ 
		self systemClassNames includes: node name ] ])
			ifTrue: [
				encounteredCritique := true.
				aCriticBlock cull: (ReTrivialCritique
					withAnchor: (ReIntervalSourceAnchor
						entity: anAST
						interval: node sourceInterval)
					by: self) ] ].

	encounteredCritique ifFalse: alternativeBlock	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>name [

	^ 'Access to a system class'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>rationale [

	^ 'You should not refference ',
		(self systemClassNames joinUsing: Character space),
		' as they are there for system purpouses and should not be refferenced directly.'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
FloatReferencesRule>>systemClassNames [

	^ #(BoxedFloat64 SmallFloat64)
]
