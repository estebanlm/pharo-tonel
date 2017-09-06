"
Checks for sends of deprecated messages that might be removed in upcoming releases of Pharo.
"
Class {
	#name : #SendsDeprecatedMethodToGlobalRule,
	#superclass : #ReNodeBasedRule,
	#category : #Kernel-Rules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:03'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>check: aNode forCritiquesDo: aCriticBlock [

	| receiver |

	aNode isMessage ifFalse: [ ^ self ].
	receiver := aNode receiver.

	receiver isVariable ifFalse: [ ^ self ].
	receiver binding ifNil: [ receiver doSemanticAnalysis ].
	receiver isGlobal ifFalse: [ ^ self ]. 
		
	(self
		check: aNode selector
		forDeprecationIn: receiver name ) ifFalse: [ ^ self ]. 
				
	aCriticBlock cull: (self critiqueFor: aNode) 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>check: aSelector forDeprecationIn: aGlobalName [

	^ (Smalltalk globals at: aGlobalName ifAbsent: [ ^ false ]) class
		classAndMethodFor: aSelector
		do: [ :class :method | method isDeprecated ]
		ifAbsent: [ false ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>critiqueFor: aMessageNode [
	^ (super critiqueFor: aMessageNode)
		tinyHint: aMessageNode selector;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>name [
	^ 'Sends a deprecated message to a known global'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SendsDeprecatedMethodToGlobalRule>>severity [
	^ #error
]
