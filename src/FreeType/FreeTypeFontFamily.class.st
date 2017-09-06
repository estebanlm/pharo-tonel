"
FreeType font family
"
Class {
	#name : #FreeTypeFontFamily,
	#superclass : #FontFamilyAbstract,
	#category : #FreeType-FontManager,
	#timestamp : 'TorstenBergmann 2/4/2014 22:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>addMember: aFreeTypeFontFamilyMember [
	aFreeTypeFontFamilyMember family: self.
	members add: aFreeTypeFontFamilyMember
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>addMembersFromFileInfos: aCollectionOfFreeTypeFileInfo [
	
	
	aCollectionOfFreeTypeFileInfo do:[:aFileInfo | | member |
		member := FreeTypeFontFamilyMember fromFileInfo: aFileInfo.
		(self memberWithStyleName: member styleName)
			ifNil:[self addMember: member]].
	
]

{
	#category : #'simulated members',
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>addSimulatedMembers [
	| membersBySlantAndStretch membersByWeightAndStretch |
	membersBySlantAndStretch := Dictionary new.
	members do:[:each| 
		(membersBySlantAndStretch 
			at: {each slantValue. each stretchValue} 
			ifAbsentPut:[OrderedCollection new]) 
				add: each].
	membersBySlantAndStretch keysAndValuesDo:[:key :col | | heaviest |
		heaviest := col ifNotEmpty:[col first].
		col do:[:each |
			heaviest weightValue < each weightValue
				ifTrue:[heaviest := each]].
		(heaviest weightValue between: (LogicalFont weightRegular - 50) and: (LogicalFont weightMedium + 50))
			ifTrue:[	members add: heaviest asSimulatedBold]].			
	membersByWeightAndStretch := Dictionary new.
	members do:[:each| | normalizedWeight |
		normalizedWeight := each weightValue.
		each weightValue = LogicalFont weightMedium ifTrue:[normalizedWeight := LogicalFont weightRegular].	
		"regular and medium weights are used interchangeably.
		For example, FreeSans has Regular-weightMedium(500), and Oblique-weightRegular(400).
		We don't want to simulate oblique-weightMedium(500) when a real 
		Oblique-weightMedium(500) exists, so we normalize any weightMedium(500)
		values to weightRegular(400) to prevent this happening" 	
		(membersByWeightAndStretch 
			at: {normalizedWeight. each stretchValue} 
			ifAbsentPut:[OrderedCollection new]) 
				add: each].	
	membersByWeightAndStretch keysAndValuesDo:[:key :col | | oblique regular |
		regular := col detect: [:each | each slantValue = 0] ifNone:[].
		oblique := col detect:[:each | each slantValue > 0] ifNone:[]. "oblique or italic"
		(oblique isNil and:[regular notNil]) 
			ifTrue:[
				regular simulated
					ifTrue:[members add: regular asSimulatedBoldOblique]
					ifFalse:[	members add: regular asSimulatedOblique]]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>initialize [
	super initialize.
	members := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>memberWithStyleName: aString [
	^members detect:[:each | each styleName = aString] ifNone:[]

]

{
	#category : #'simulated members',
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamily>>rebuildSimulatedMembers [
	"FOR TESTING ONLY"
	
	members := members reject:[:each| each simulated].
	self addSimulatedMembers.
]
