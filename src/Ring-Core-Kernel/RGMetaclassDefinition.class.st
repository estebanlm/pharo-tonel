"
RGMetaclassDefinition is a concrete representation of metaclasses of classes (traits are excluded)
"
Class {
	#name : #RGMetaclassDefinition,
	#superclass : #RGClassDescriptionDefinition,
	#instVars : [
		'baseClass'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:05'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition class>>class: anORClassDefinition [

	^self new
		baseClass: anORClassDefinition;
		yourself
]

{
	#category : #variables,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>allClassVarNames [

	^self theNonMetaClass allClassVarNames
]

{
	#category : #variables,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>allSharedPoolNames [

	^self theNonMetaClass allSharedPoolNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>baseClass: aRGClassDefinition [

	baseClass:= aRGClassDefinition.
	self name: (baseClass name, ' class') asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>category [
	^ self theNonMetaClass category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>environment [

	^baseClass environment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>isMeta [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>isSameRevisionAs: aRGMetaclassDefinition [
	"This method look for equality of the properties of the receiver"

	^(super isSameRevisionAs: aRGMetaclassDefinition)
		and:[ self traitCompositionSource = aRGMetaclassDefinition traitCompositionSource ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>package [

	^baseClass package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>realClass [

	^baseClass realClass theMetaClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>storeOn: aStream [
	
	aStream nextPut: $(. 
	super storeOn: aStream.
	aStream nextPutAll: ' baseClass:'.
	self theNonMetaClass storeOn: aStream.
	aStream nextPut: $).
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>theMetaClass [

	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetaclassDefinition>>theNonMetaClass [

	^baseClass
]
