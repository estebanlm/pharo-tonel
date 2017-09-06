"
I am responsible for keeping class name.
"
Class {
	#name : #ClassStoredSetting,
	#superclass : #StoredSetting,
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
ClassStoredSetting>>realValue [
	^ self class environment at: realValue
]
