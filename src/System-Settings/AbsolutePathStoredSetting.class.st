"
I am responsible for storing information about AbsolutePath objects.
"
Class {
	#name : #AbsolutePathStoredSetting,
	#superclass : #StoredSetting,
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
AbsolutePathStoredSetting>>realValue [
	^ (AbsolutePath withAll: realValue) asFileReference
]
