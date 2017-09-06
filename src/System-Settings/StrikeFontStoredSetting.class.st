"
I am responsible for storing information about StrikeFont objects.
"
Class {
	#name : #StrikeFontStoredSetting,
	#superclass : #AbstractFontStoredSetting,
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
StrikeFontStoredSetting>>realValue [
	^ (self class environment at: self fontClassName)
			familyName: self familyName
			pointSize: self pointSize
			emphasized: self emphasized
]
