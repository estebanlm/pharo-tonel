"
I am responsible for storing information about ThemeIcons objects.
"
Class {
	#name : #ThemeIconsStoredSetting,
	#superclass : #AbstractStoredSetting,
	#instVars : [
		'name',
		'url'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/8/2015 10:35'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIconsStoredSetting>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIconsStoredSetting>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIconsStoredSetting>>realValue [
	^ ThemeIcons new 
		name: self name;
		url: self url;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIconsStoredSetting>>url [
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIconsStoredSetting>>url: anObject [
	url := anObject
]
