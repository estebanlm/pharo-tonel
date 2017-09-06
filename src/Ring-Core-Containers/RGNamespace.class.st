"
A namespace is a container that in addition to managing classes and methods, it also knows how to treat pools and global variables
"
Class {
	#name : #RGNamespace,
	#superclass : #RGContainer,
	#category : #Ring-Core-Containers,
	#timestamp : 'VeronicaUquillas 4/20/2011 16:34'
}

{
	#category : #'adding elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>addElement: anObject in: aCollection [

	anObject environment: self.
	super addElement: anObject in: aCollection
]

{
	#category : #'adding elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>addGlobalVariable: anORGlobalVariableDefinition [
	"adds anORGlobalVariableDefinition to the globals dictionary if satisfies it #isGlobalVariable"

	anORGlobalVariableDefinition isGlobalVariable ifFalse:[ ^self ].
	self addElement: anORGlobalVariableDefinition in: self globalVariables
]

{
	#category : #'adding elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>addGlobalVariableNamed: globalVariableName [
	"creates a RGGlobalVariableDefinition with the given name.
	It's verified that a pool with that name does not exist"

	(self includesGlobalVariableNamed: globalVariableName) ifTrue: [ ^self ].
	self addGlobalVariable: (RGGlobalVariableDefinition named: globalVariableName).
]

{
	#category : #'adding elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>addPool: anORPoolDefinition [
	"adds anORPoolDefinition to the pools dictionary if satisfies it #isPool"

	anORPoolDefinition isPool ifFalse:[ ^self ].
	self addElement: anORPoolDefinition in: self pools
]

{
	#category : #'adding elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>addPoolNamed: poolName [
	"creates a RGPoolDefinition with the given name.
	It's verified that a pool with that name does not exist"
	| pool |

	(self includesPoolNamed: poolName) ifTrue: [ ^self ].
	"A shared pool is a class inheriting from #SharedPool"
	pool := (RGClassDefinition named: poolName)
			superclassName: #SharedPool;
			isPool: true;
			yourself.
	self addPool: pool.
]

{
	#category : #'accessing global variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>globalVariableNamed: globalVariableName [

	^self elementNamed: globalVariableName in: self globalVariables
]

{
	#category : #'accessing global variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>globalVariables [
	"retrieves global variables"

	^self elementsCategorized: #globalVariables
]

{
	#category : #'accessing global variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>globalVariables: aCollection [

	self elementsCategorized: #globalVariables with: aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>includesGlobalVariable: anORGlobalVariableDefinition [

	^self globalVariables includes: anORGlobalVariableDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>includesGlobalVariableNamed: globalVariableName [
	
	^self includesElementNamed: globalVariableName in: self globalVariables
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>includesPool: anORPoolDefinition [

	^self pools includes: anORPoolDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>includesPoolNamed: poolName [
	
	^self includesElementNamed: poolName in: self pools
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>initialize [

	super initialize.
	self globalVariables: IdentityDictionary new.
	self pools: IdentityDictionary new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>isNamespace [

	^true
]

{
	#category : #'accessing pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>poolNamed: poolName [

	^self elementNamed: poolName in: self pools
]

{
	#category : #'accessing pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>pools [
	"retrieves the shares pools"

	^self elementsCategorized: #pools
]

{
	#category : #'accessing pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>pools: aCollection [

	self elementsCategorized: #pools with: aCollection
]

{
	#category : #'removing elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>removeGlobalVariable: anORGlobalVariableDefinition [
	"removes anORGlobalVariableDefinition from the globals dictionary if satisfies it #isGlobalVariable"

	anORGlobalVariableDefinition isGlobalVariable ifFalse:[ ^self ].
	self removeElement: anORGlobalVariableDefinition from: self globalVariables
]

{
	#category : #'removing elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>removePool: anORPoolDefinition [
	"removes anORPoolDefinition from the pools dictionary if satisfies it #isPool"

	anORPoolDefinition isPool ifFalse:[ ^self ].
	self removeElement: anORPoolDefinition from: self pools
]

{
	#category : #'removing elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>withoutGlobalVariables [

	self removeElementsCategorized: #globalVariables
]

{
	#category : #'removing elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGNamespace>>withoutPools [

	self removeElementsCategorized: #pools
]
