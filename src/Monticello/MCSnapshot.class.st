"
MCSnapshot represents a list of entities compared to a given base entities. 

It holds a list of definitions (instances of MCDefinition subclasses). It can install these entities or update a package.
"
Class {
	#name : #MCSnapshot,
	#superclass : #Object,
	#instVars : [
		'definitions'
	],
	#category : #Monticello-Base,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot class>>empty [
	^ self fromDefinitions: #()
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot class>>fromDefinitions: aCollection [
	^ self new initializeWithDefinitions: aCollection
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>= other [
	self == other
		ifTrue: [ ^ true ].
	self species = other species
		ifFalse: [ ^ false ].
	^ definitions asArray = other definitions asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>definitions [
	^ definitions
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>hash [
	^ definitions asArray hash
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>initializeWithDefinitions: aCollection [
	definitions := aCollection.
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>install [
	MCPackageLoader installSnapshot: self
]

{
	#category : #patching,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>patchRelativeToBase: aSnapshot [
	^ MCPatch fromBase: aSnapshot target: self
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCSnapshot>>updatePackage: aPackage [
	MCPackageLoader updatePackage: aPackage withSnapshot: self
]
