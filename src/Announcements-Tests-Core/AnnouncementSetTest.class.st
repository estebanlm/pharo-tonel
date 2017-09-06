"
SUnit tests for announcement sets
"
Class {
	#name : #AnnouncementSetTest,
	#superclass : #TestCase,
	#category : #Announcements-Tests-Core-Tests,
	#timestamp : 'TorstenBergmann 2/20/2014 15:16'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementSetTest>>testIncludeOnlyOnce [
	| set |
	set := AnnouncementMockA , AnnouncementMockB , AnnouncementMockA.
	self assert: set size equals: 2
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementSetTest>>testInstanceCreation [
	| set |
	set := AnnouncementMockA , AnnouncementMockB.
	self assert: set size equals: 2
]
