"
RGMetatraitDefinition is a concrete representation of metaclasses of traits
"
Class {
	#name : #RGMetatraitDefinition,
	#superclass : #RGTraitDescriptionDefinition,
	#instVars : [
		'baseClass'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:04'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition class>>class: anORTraitDefinition [

	^self new
		baseClass: anORTraitDefinition;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>baseClass: anRGTraitDefinition [

	baseClass:= anRGTraitDefinition.
	self name: (baseClass name, ' classTrait') asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>category [
	^ self theNonMetaClass category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>environment [

	^baseClass environment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>isMeta [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>isSameRevisionAs: aRGMetatraitDefinition [
	"This method look for equality of the properties of the receiver"

	^(super isSameRevisionAs: aRGMetatraitDefinition)
		and: [ self traitCompositionSource = aRGMetatraitDefinition traitCompositionSource ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>package [

	^baseClass package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>realClass [

	^baseClass realClass theMetaClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>theMetaClass [

	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMetatraitDefinition>>theNonMetaClass [

	^baseClass
]
