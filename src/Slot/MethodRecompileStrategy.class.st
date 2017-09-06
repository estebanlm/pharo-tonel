"
I am simple update strategy that recompiles all methods.
"
Class {
	#name : #MethodRecompileStrategy,
	#superclass : #AbstractMethodUpdateStrategy,
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodRecompileStrategy>>transform: oldClass to: newClass using: aMethodModification [
	newClass compileAllFrom: oldClass.
	
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodRecompileStrategy>>updateClassLiteralKeysIn: aClass  [
	aClass isMeta ifTrue: [ ^ self ].
	
	aClass methodsDo: [ :method | 
		method classBinding: (aClass environment bindingOf: aClass name) ]
]
