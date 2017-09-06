"
Abstract font family
"
Class {
	#name : #FontFamilyAbstract,
	#superclass : #Object,
	#instVars : [
		'familyName',
		'members'
	],
	#category : #FontInfrastructure,
	#timestamp : 'TorstenBergmann 2/4/2014 22:07'
}

{
	#category : #'member lookup',
	#timestamp : ' 8/31/2017 05:26:12'
}
FontFamilyAbstract>>closestMemberWithStretchValue: stretchValue weightValue: weightValue slantValue: slantValue [
	"answer the member that has weight, slant and stretch values that most closely 
	match those given by stretchValue, weightValue, and slantValue"
	
	^(self members asSortedCollection:[:a :b | 
		a isCloserMatchThan: b 
			toStretch: stretchValue 
			weight: weightValue 
			slant: slantValue]) first. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FontFamilyAbstract>>familyName [
	"Answer the value of familyName"

	^ familyName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FontFamilyAbstract>>familyName: anObject [
	"Set the value of familyName"

	familyName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FontFamilyAbstract>>members [
	"Answer the value of members"

	^ members
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FontFamilyAbstract>>printOn: aStream [
	aStream 
		nextPutAll: self class name asString;
		nextPut: $ ;
		nextPutAll: self familyName printString
]
