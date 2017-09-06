"
I declare an api to store and read extention properties. It should be inplemented in any Brick UI to make it work.
"
Trait {
	#name : #GLMBrickExtensionTrait,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Morphic-Brick-Traits,
	#timestamp : 'AliakseiSyrel 1/30/2015 10:47'
}

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>hasProperty: aSymbol [

	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>removeProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>setProperty: aSymbol toValue: anObject [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>valueOfProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>valueOfProperty: aSymbol ifAbsent: aBlock [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickExtensionTrait>>valueOfProperty: aSymbol ifAbsentPut: aBlock  [
	
	^ self explicitRequirement
]
