"
Notify about testing a test
"
Class {
	#name : #TestAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'test'
	],
	#category : #SUnit-Core-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAnnouncement class>>with: aTestCase [
	^self new
		test: aTestCase;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAnnouncement>>test [
	^test
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAnnouncement>>test: aTest [
	test := aTest
]
