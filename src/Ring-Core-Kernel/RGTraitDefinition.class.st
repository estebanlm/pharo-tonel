"
RGTraitDefinition is the concrete representation of a trait (no class)
"
Class {
	#name : #RGTraitDefinition,
	#superclass : #RGTraitDescriptionDefinition,
	#instVars : [
		'metaClass',
		'comment',
		'category',
		'package'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>category [
	"Retrieves the tag-package associated to the receiver"

	^category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>category: aSymbol [

	category:= aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>classVariables [

	^#()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>comment [
	"Retrieves the comment definition object associated to the receiver"
	
	^comment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>comment: anObject [
	"Sets a RGCommentDefinition object based on the argument"
	
	comment := anObject isRingObject 
		ifFalse: [ 
			RGCommentDefinition new
				parent: self;
				content: anObject; 
				yourself ]
		ifTrue: [anObject ]
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>hasComment [

	^comment isEmptyOrNil not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>hasMetaclass [

	^metaClass notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>hasStamp [

	^self stamp isEmptyOrNil not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>instanceVariables [

	^#()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>isSameRevisionAs: aRGTraitDefinition [
	"This method look for equality of the properties of the receiver"

	^(super isSameRevisionAs: aRGTraitDefinition)
		and: [ self category = aRGTraitDefinition category 
		and: [ self traitCompositionSource = aRGTraitDefinition traitCompositionSource 
		and: [ ((self hasComment and: [ self comment isSameRevisionAs: aRGTraitDefinition comment ]) or:[ self hasComment not ])
		and: [ (self theMetaClass isSameRevisionAs: aRGTraitDefinition theMetaClass) ] ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>package [
	"Retrieves the package in which this trait is contained"
	
	^package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>package: aRGPackage [
	"Sets the package in which this trait is contained"
	
	package:= aRGPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>sharedPools [

	^#()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>stamp [

	^self hasComment ifTrue:[ self comment stamp ] ifFalse:[ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>stamp: aString [

	self hasComment
	ifTrue: [ self comment stamp: aString ]
	ifFalse:[ RGCommentDefinition new
						 parent: self; 
						 stamp: aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>theMetaClass [

	^metaClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>theNonMetaClass [

	^self
]

{
	#category : #behavior,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>withMetaclass [
	"Registers explicitly the metaclass of a trait"

	metaClass:= RGMetatraitDefinition class: self.

]

{
	#category : #behavior,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGTraitDefinition>>withMetaclass: aRGMetatraitDefinition [
	"Registers explicitly the metaclass of a class"

	metaClass:= aRGMetatraitDefinition.
	metaClass baseClass: self.  

]
