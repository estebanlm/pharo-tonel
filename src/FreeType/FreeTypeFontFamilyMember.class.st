"
FreeType FontFamily member  
"
Class {
	#name : #FreeTypeFontFamilyMember,
	#superclass : #FontFamilyMemberAbstract,
	#instVars : [
		'fileInfo',
		'stretchName',
		'stretchValue',
		'weightName',
		'weightValue',
		'slantName',
		'slantValue',
		'simulated'
	],
	#category : #FreeType-FontManager,
	#timestamp : 'TorstenBergmann 2/4/2014 22:08'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember class>>fromFileInfo: aFreeTypeFileInfo [
	
	^self new
		fileInfo: aFreeTypeFileInfo;
		simulated: false;
		styleName: aFreeTypeFileInfo styleNameExtracted;
		stretchName: aFreeTypeFileInfo stretch;
		stretchValue: aFreeTypeFileInfo stretchValue;
		weightName: aFreeTypeFileInfo weight;
		weightValue: aFreeTypeFileInfo weightValue;
		slantName: aFreeTypeFileInfo slant;
		slantValue: aFreeTypeFileInfo slantValue;
		yourself
		
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>><= aFreeTypeFontFamilyMember [
	^self sortValue <= aFreeTypeFontFamilyMember sortValue
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>asSimulatedBold [
	^self copy 
		weightValue: LogicalFont weightBold;
		styleName: (fileInfo styleNameWithWeightForcedToBe: 'Bold');
		simulated: true;
		yourself
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>asSimulatedBoldOblique [
	^self copy 
		slantValue: LogicalFont slantItalic; "treat italic and oblique the same"
		weightValue:LogicalFont weightBold;
		styleName: (fileInfo styleNameWithWeightForcedToBe: 'Bold' italicForcedToBe: 'Oblique');
		simulated: true;
		yourself
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>asSimulatedOblique [
	^self copy 
		slantValue: LogicalFont slantItalic;  "treat italic and oblique the same"
		styleName: (fileInfo styleNameWithItalicForcedToBe: 'Oblique');
		simulated: true;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>fileInfo [
	"Answer the value of fileInfo"

	^ fileInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>fileInfo: anObject [
	"Set the value of fileInfo"

	fileInfo := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>simulated [
	"Answer the value of simulated"

	^ simulated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>simulated: anObject [
	"Set the value of simulated"

	simulated := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>slantName [
	"Answer the value of slantName"

	^ slantName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>slantName: anObject [
	"Set the value of slantName"

	slantName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>slantValue [
	"Answer the value of slantValue"

	^ slantValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>slantValue: anObject [
	"Set the value of slantValue"

	slantValue := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>sortValue [
	| v normalizedWeight | 
	normalizedWeight := weightValue.
	normalizedWeight = LogicalFont weightMedium 
		ifTrue:["sort medium and regular weights as though they were the same"
			normalizedWeight := LogicalFont weightRegular]. 
	v :=self simulated ifTrue:[10000] ifFalse:[0].
	v := v + (stretchValue * 1000).
	v := v + (normalizedWeight).
	v := v + (slantValue).
	^v

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>stretchName [
	"Answer the value of stretchName"

	^ stretchName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>stretchName: anObject [
	"Set the value of stretchName"

	stretchName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>stretchValue [
	"Answer the value of stretchValue"

	^ stretchValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>stretchValue: anObject [
	"Set the value of stretchValue"

	stretchValue := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>weightName [
	"Answer the value of weightName"

	^ weightName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>weightName: anObject [
	"Set the value of weightName"

	weightName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>weightValue [
	"Answer the value of weightValue"

	^ weightValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFontFamilyMember>>weightValue: anObject [
	"Set the value of weightValue"

	weightValue := anObject
]
