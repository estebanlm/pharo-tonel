"
I am responsible for storing information about RelativePath objects.
"
Class {
	#name : #RelativePathStoredSetting,
	#superclass : #StoredSetting,
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
RelativePathStoredSetting>>realValue [
	^ (RelativePath withAll: realValue) asFileReference
]
