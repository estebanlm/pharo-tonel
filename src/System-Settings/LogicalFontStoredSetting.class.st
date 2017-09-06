"
I am responsible for storing information about LogicalFont objects.
"
Class {
	#name : #LogicalFontStoredSetting,
	#superclass : #AbstractFontStoredSetting,
	#instVars : [
		'fallbackFamilyNames',
		'stretchValue',
		'weightValue',
		'slantValue'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>fallbackFamilyNames [
	^ fallbackFamilyNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>fallbackFamilyNames: aCollectionOrNil  [
	fallbackFamilyNames := aCollectionOrNil 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>realValue [
	^ (self class environment at: self fontClassName)
				familyName: self familyName 
				fallbackFamilyNames: self fallbackFamilyNames 
				pointSize: self pointSize 
				stretchValue: self stretchValue
				weightValue: self weightValue 
				slantValue: self slantValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>slantValue [
	^ slantValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>slantValue: anInteger  [
	slantValue := anInteger 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>stretchValue [
	^ stretchValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>stretchValue: anInteger  [
	stretchValue := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>weightValue [
	^ weightValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
LogicalFontStoredSetting>>weightValue: anInteger  [
	weightValue := anInteger 
]
