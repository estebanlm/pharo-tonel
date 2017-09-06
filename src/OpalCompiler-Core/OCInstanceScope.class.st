"
I include all variable enries for slots, self, super.
"
Class {
	#name : #OCInstanceScope,
	#superclass : #OCAbstractScope,
	#instVars : [
		'vars',
		'selfVar',
		'superVar'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 8/11/2014 10:18'
}

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>allTemps [
	^#()
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>findVariable: lookupBlock ifNone: notFoundBlock  [

	(lookupBlock value: selfVar) ifTrue: [ ^ selfVar ].
	(lookupBlock value: superVar) ifTrue: [ ^ superVar ].
	
	vars valuesDo: [ :var | (lookupBlock value: var) ifTrue: [ ^ var ] ].

	^ outerScope findVariable: lookupBlock ifNone: notFoundBlock 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>initialize [
  
	vars := Dictionary new.
	selfVar := OCSelfVariable new
		scope: self;
		yourself.
	superVar := OCSuperVariable new
		scope: self;
		yourself.
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>instanceScope [
	^self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>isInstanceScope [

	^ true
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>lookupVar: name [
	"Return a ScopeVar for my inst var with this name.  Return nil if none found"

	name = 'self' ifTrue: [^ selfVar].
	name = 'super' ifTrue: [^ superVar].
	^ vars at: name ifAbsent: [self outerScope lookupVar: name]
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>lookupVar: name inContext: aContext [
	"Return a ScopeVar for my inst var with this name.  Return nil if none found"

	name = 'self' ifTrue: [^ selfVar].
	name = 'super' ifTrue: [^ superVar].
	^ vars at: name ifAbsent: [self outerScope lookupVar: name inContext: aContext ]
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>lookupVarForDeclaration: name [
	"Return a ScopeVar for my inst var with this name.  Return nil if none found"
	name = 'self' ifTrue: [^ selfVar].
	name = 'super' ifTrue: [^ superVar].
	^ vars at: name ifAbsent: [self outerScope lookupVarForDeclaration: name]
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>newMethodScope [

	^ OCMethodScope new outerScope: self
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>slots: slotCollection [

	slotCollection do: [ :slot |
		vars at: slot name put:
			(OCSlotVariable new
				slot: slot;
				scope: self;
				yourself)].

]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCInstanceScope>>variableNamed: name ifAbsent: aBlock [
	"Return a ScopeVar for my inst var with this name.  Return nil if none found"

	name = 'self' ifTrue: [^ selfVar].
	name = 'super' ifTrue: [^ superVar].
	^ vars at: name ifAbsent: aBlock
]
