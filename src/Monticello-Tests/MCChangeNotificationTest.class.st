"

"
Class {
	#name : #MCChangeNotificationTest,
	#superclass : #MCTestCase,
	#instVars : [
		'workingCopy'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>foreignMethod [
	"see testForeignMethodModified"
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>modifiedEventFor: aSelector ofClass: aClass [
	| method |
	method := aClass compiledMethodAt: aSelector.
	^ MethodModified 
		methodChangedFrom: method
		to: method
		oldProtocol: nil

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>setUp [

       "FIXME: Unregister Monticellomocks if it got created in another test
       (for example MCMethodDefinitionTest may create it implicitly).
       This avoids a nasty failure of MCChangeNotificationTest due to
       some inconsistency about the package info registered with it.
       If Monticellomocks was created earlier it will contain a 'regular'
       PackageInfo instance but the test requires it to be an MCMockPackageInfo"
"       MCWorkingCopy registry
               removeKey: (MCPackage new name: 'MonticelloMocks')
               ifAbsent:[].
       PackageOrganizer default unregisterPackageNamed: 'MonticelloMocks'."

       workingCopy := MCWorkingCopy forPackage: self mockPackage.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>testCoreMethodModified [
	| event |
	workingCopy modified: false.
	event := self modifiedEventFor: #one ofClass: self mockClassA.
	MCWorkingCopy methodModified: event.
	self assert: workingCopy modified
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>testExtMethodModified [
	| event mref |
	workingCopy modified: false.
	mref := workingCopy packageSet extensionMethods first.
	event := self modifiedEventFor: mref selector ofClass: mref actualClass.
	MCWorkingCopy methodModified: event.
	self assert: workingCopy modified
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCChangeNotificationTest>>testForeignMethodModified [
	| event |
	workingCopy modified: false.
	event := self modifiedEventFor: #foreignMethod ofClass: self class.
	MCWorkingCopy methodModified: event.
	self deny: workingCopy modified
]
