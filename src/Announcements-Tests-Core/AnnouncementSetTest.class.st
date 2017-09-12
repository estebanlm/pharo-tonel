"
SUnit tests for announcement sets
"
Class {
	#name : #AnnouncementSetTest,
	#superclass : #TestCase,
	#category : #Announcements-Tests-Core-Tests
}

{ #category : #testing }
AnnouncementSetTest >> testIncludeOnlyOnce [
	| set |
	set := AnnouncementMockA , AnnouncementMockB , AnnouncementMockA.
	self assert: set size equals: 2
]

{ #category : #testing }
AnnouncementSetTest >> testInstanceCreation [
	| set |
	set := AnnouncementMockA , AnnouncementMockB.
	self assert: set size equals: 2
]
