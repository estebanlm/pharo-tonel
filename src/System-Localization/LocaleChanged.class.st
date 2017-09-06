"
Announce that a locale was changed
"
Class {
	#name : #LocaleChanged,
	#superclass : #Announcement,
	#instVars : [
		'newLocale',
		'oldLocale'
	],
	#category : #System-Localization-Locales,
	#timestamp : 'TorstenBergmann 9/16/2014 14:24'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleChanged class>>from: oldLocale to: newLocale [

	^(self new)
		oldLocale: oldLocale;
		newLocale: newLocale;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleChanged>>newLocale [
	^ newLocale
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleChanged>>newLocale: anObject [
	newLocale := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleChanged>>oldLocale [
	^ oldLocale
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
LocaleChanged>>oldLocale: anObject [
	oldLocale := anObject
]
