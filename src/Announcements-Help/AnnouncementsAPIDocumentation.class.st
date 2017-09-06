"
This is a custom help book providing the API documentation for the announcements framework.

"
Class {
	#name : #AnnouncementsAPIDocumentation,
	#superclass : #AnnouncementsHelp,
	#category : #Announcements-Help,
	#timestamp : 'Tbn 11/12/2010 11:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsAPIDocumentation class>>bookName [
	^'API Documentation'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsAPIDocumentation class>>builder [
	^PackageAPIHelpBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsAPIDocumentation class>>helpPackages [
	^#('Announcements-Core' 'Announcements-View' 'Announcements-Tests-Core')
]
