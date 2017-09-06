"
I am an abstract class and my subclasses are responsible for storing information about a font object. 
"
Class {
	#name : #AbstractFontStoredSetting,
	#superclass : #AbstractStoredSetting,
	#instVars : [
		'fontClassName',
		'familyName',
		'pointSize',
		'emphasized'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>emphasized [
	^ emphasized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>emphasized: anObject [
	emphasized := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>familyName [
	^ familyName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>familyName: anObject [
	familyName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>fontClassName [
	^ fontClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>fontClassName: anObject [
	fontClassName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>pointSize [
	^ pointSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFontStoredSetting>>pointSize: anObject [
	pointSize := anObject
]
