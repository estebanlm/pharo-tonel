"
SUnit tests for RPackage
"
Class {
	#name : #RPackageObsoleteTest,
	#superclass : #RPackageIncrementalTest,
	#instVars : [
		'notRun'
	],
	#category : #RPackage-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 22:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageObsoleteTest>>setNotRun  [
	notRun := true
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageObsoleteTest>>testAnnouncementClassRemovedIsRaisedOnRemoveFromSystem [
	"self debug: #testAnnouncementClassRemovedIsRaisedOnRemoveFromSystem"
	| foo | 
	
	[ notRun := false.
	  SystemAnnouncer uniqueInstance 
		when: ClassRemoved send: #setNotRun to: self.
	foo := self createNewClassNamed: #FooForTest2.
	self deny: notRun.
	foo removeFromSystem.
	self assert: notRun ]
ensure: [ SystemAnnouncer uniqueInstance unsubscribe: self ]. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageObsoleteTest>>testMethodPackageFromObsoleteClass [
	"self debug: #testMethodPackageFromObsoleteClass"
	
	| pack method foo | 
	[
	pack := self createNewPackageNamed: 'P1'.
	foo := self createNewClassNamed: #FooForTest inPackage: pack.
	foo compile: 'bar ^42'.
	method := foo>>#bar.

	foo obsolete.
	self assert: (method packageFromOrganizer: pack organizer) equals: foo package.
	] ensure: [ 
		foo ifNotNil: [ 
			foo setName: foo originalName.
			foo removeFromSystem.
			].
		Smalltalk globals removeKey: #FooForTest  ifAbsent:  [].
	]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageObsoleteTest>>testMethodPackageOfRemovedClass [
	"self debug: #testMethodPackageOfRemovedClass"
	
	| pack method foo | 
	pack := self createNewPackageNamed: 'P1'.
	foo := self createNewClassNamed: #FooForTest2 inPackage: pack.
	foo compileSilently: 'bar ^42'.
	method := foo>>#bar.
	foo removeFromSystem.
	self deny: (pack includesClassNamed: #FooForTest2 )
	
	
]
