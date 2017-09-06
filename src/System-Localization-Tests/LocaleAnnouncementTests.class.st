"

"
Class {
	#name : #LocaleAnnouncementTests,
	#superclass : #TestCase,
	#instVars : [
		'saveCurrent',
		'catchedAnnouncement'
	],
	#category : #System-Localization-Tests,
	#timestamp : ''
}

{
	#category : #'private accessing',
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleAnnouncementTests>>frenchLocale [
	^ Locale isoLanguage: 'fr'
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleAnnouncementTests>>localeWasChanged: anAnnouncement [

	catchedAnnouncement := anAnnouncement 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleAnnouncementTests>>setUp [

	super setUp.
	saveCurrent := Locale current.
	Locale localeAnnouncer when: LocaleChanged send: #localeWasChanged: to: self
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
LocaleAnnouncementTests>>tearDown [

	Locale localeAnnouncer unsubscribe: self.
	Locale classVarNamed: 'Current' put: saveCurrent.
	super tearDown
]
