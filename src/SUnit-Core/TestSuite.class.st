"
This is a Composite of Tests, either TestCases or other TestSuites. The top-level protocol is #run.  This creates aTestResult and sends
	self run: aTestResult.
then ensures that any TestResources made available during the run are reset.  These, and the dependencies protocol, are common between this and TestCase.
"
Class {
	#name : #TestSuite,
	#superclass : #Model,
	#instVars : [
		'tests',
		'resources',
		'name',
		'announcer'
	],
	#category : #SUnit-Core-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite class>>named: aString [

	^self new
		name: aString;
		yourself
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>addDependentToHierachy: anObject [
	self addDependent: anObject.
	self tests do: [ :each | each addDependentToHierachy: anObject]
			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>addTest: aTest [
	self tests add: aTest 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>addTests: aCollection  [
	aCollection do: [:eachTest | self addTest: eachTest]
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>announceTest: aTest [
	^ self testSuiteAnnouncer announce: (TestAnnouncement with: aTest).
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>debug [
	self setUp.
	[
		self tests do: [:each | 
					each debug.
					self announceTest: each.
					self changed: each.
		]
	] ensure:[ 
		self tearDown. 
	].


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>defaultResources [
	^self tests
		inject: OrderedCollection new
		into:
			[:coll :testCase |
			testCase resources do:
				[:each |
				(coll includes: each) ifFalse: [coll add: each]].
			coll]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>name [

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>name: aString [

	name := aString
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>removeDependentFromHierachy: anObject [
	self removeDependent: anObject.
	self tests do: [ :each | each removeDependentFromHierachy: anObject]
			
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>resourceClass [

	^ TestResource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>resources [
	resources isNil ifTrue: [resources := self defaultResources].
	^resources
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>resources: someOrderedTestResourceClasses [
	"The parameter should understand reverseDo: and should not contain duplicates."

	resources := someOrderedTestResourceClasses
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>resultClass [

	^ TestAsserter classForTestResult
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>run [
	| result |
	result := self resultClass new.
	self run: result.
	^result
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>run: aResult [
	CurrentExecutionEnvironment runTestsBy: [
		self runUnmanaged: aResult ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>runUnmanaged: aResult [
	self setUp.
	[ self tests
		do: [ :each | 
			each run: aResult.
			self announceTest: each.
			self changed: each ] ]
		ensure: [ self tearDown ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>setUp [
	self resources  do: [ :each |
			each isAvailable ifFalse: [ each signalInitializationError ]
		].
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>subscribe: aAnnouncement do: aBlock [
	self testSuiteAnnouncer subscribe: aAnnouncement do: aBlock
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>tearDown [
	self resourceClass resetResources: self resources.
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>testSuiteAnnouncer [
	announcer ifNil:[ announcer := Announcer new.].
	^ announcer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>tests [
	tests isNil ifTrue: [tests := OrderedCollection new].
	^tests
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuite>>unsubscribe: anAnnouncementClass  [
	self testSuiteAnnouncer unsubscribe: anAnnouncementClass.
]
