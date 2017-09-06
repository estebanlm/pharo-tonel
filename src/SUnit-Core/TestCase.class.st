"
A TestCase is an implementation of the Command pattern to run a test.  TestCase instances are created with the class method #selector:, passing the symbol that names the method to be executed when the test case runs.  Various UIs exist to run these instances and they can also be created and run programmatically.

When you discover a new fixture, subclass TestCase and create a #test... method for the first test.  As that method develops and more #test... methods are added, you will find yourself refactoring temps into instance variables for the objects in the fixture and overriding #setUp to initialize these variables.  As required, override #tearDown to nil references, release objects and deallocate.

See my superclass' comment for assertion and logging information.
"
Class {
	#name : #TestCase,
	#superclass : #TestAsserter,
	#instVars : [
		'testSelector',
		'expectedFails'
	],
	#classVars : [
		'Announcers',
		'DefaultTimeLimit',
		'HistoryAnnouncer'
	],
	#classInstVars : [
		'history'
	],
	#category : #SUnit-Core-Kernel,
	#timestamp : 'nfr 1/3/2010 17:56'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>addTestsFor: classNameString toSuite: suite [
	| cls |
	cls := Smalltalk globals at: classNameString ifAbsent: [ ^ suite ].
	^ cls isAbstract
		ifTrue: [ 
			cls allSubclasses
				do: [ :each | 
					each isAbstract
						ifFalse: [ each addToSuiteFromSelectors: suite ] ].
			suite ]
		ifFalse: [ cls addToSuiteFromSelectors: suite ]
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>addToSuite: suite fromMethods: testMethods  [
	testMethods do:  [ :selector | 
			suite addTest: (self selector: selector) ].
	^suite
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>addToSuiteFromSelectors: suite [
	^self addToSuite: suite fromMethods: (self shouldInheritSelectors
		ifTrue: [ self allTestSelectors ]
		ifFalse: [self testSelectors ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>allTestSelectors [
	| answer pivotClass lookupRoot |
	answer := Set withAll: self testSelectors.
	self shouldInheritSelectors
		ifTrue:
			[pivotClass := self.
			lookupRoot := self lookupHierarchyRoot.
			[pivotClass == lookupRoot]
				whileFalse:
					[pivotClass := pivotClass superclass.
					answer addAll: pivotClass testSelectors]].
	^answer asSortedCollection asOrderedCollection
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>announcer  [
	^ self announcers at: self ifAbsentPut: [ Announcer new ]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>announcers [
	^ Announcers ifNil: [ Announcers := Dictionary new ] 
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>buildSuite [
	| suite |
	^self isAbstract
		ifTrue: 
			[suite := self suiteClass named: self name asString.
			self allSubclasses 
				do: [:each | each isAbstract ifFalse: [suite addTest: each buildSuiteFromSelectors]].
			suite]
		ifFalse: [self buildSuiteFromSelectors]
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>buildSuiteFromAllSelectors [

	^self buildSuiteFromMethods: self allTestSelectors
			
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>buildSuiteFromLocalSelectors [

	^self buildSuiteFromMethods: self testSelectors
			
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>buildSuiteFromMethods: testMethods [

	^testMethods
		inject: (self suiteClass named: self name asString)
		into: [:suite :selector |
			suite
				addTest: (self selector: selector);
				yourself]
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>buildSuiteFromSelectors [
	^self buildSuiteFromMethods: self allTestSelectors
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>coverage [
	"returns the coverage determined by a simple static analysis of test coverage 
	made by the receiver on a class that is identified by the name of the receiver.
	We assume that SetTest test Set."

	| cls className |
	(self name endsWith: 'Test')
		ifFalse: [ self error: 'Please, use #coverageForClass: instead' ].
	className := self name copyFrom: 1 to: self name size - 'Test' size.
	cls := Smalltalk globals at: className asSymbol ifAbsent: [ self error: 'Please, use #coverageForClass: instead' ].	"May happen with Transcript"
	cls isBehavior
		ifFalse: [ cls := cls class ].
	^ self coverageForClass: cls
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>coverageAsString [
	| cov className |
	cov := self coverage first asInteger. 
	"coverage already checks that the name is ends with 'Test' and if the class tested exists"
	
	className := self name copyFrom: 1 to: (self name size - 'Test' size).
	^ self name asString, ' covers ', cov asString, '% of ', className.
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>coverageForClass: cls [
	"returns the test coverage of all the methods included inherited ones"
	^ self coverageForClass: cls until: ProtoObject
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>coverageForClass: cls until: aRootClass [
	"returns the test coverage of all the methods included inherited ones but stopping at aRootClass included"
	
	| definedMethods testedMethods untestedMethods |
	definedMethods := cls allSelectorsAboveUntil: aRootClass.
	definedMethods size = 0
		ifTrue: [^ {0. Set new}].
	testedMethods := 
		self methods inject: Set new into: 
							[:sums :cm | sums union: cm messages].
	testedMethods := testedMethods reject: [:sel | (definedMethods includes: sel) not].
	untestedMethods := definedMethods select: [:selector | (testedMethods includes: selector) not].
	^ { (testedMethods size * 100 / definedMethods size) asFloat . untestedMethods}

]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>coveragePercentage [
	^ self coverage first
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>debug: aSymbol [

	^(self selector: aSymbol) debug
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>defaultTimeLimit [
	^DefaultTimeLimit ifNil: [DefaultTimeLimit := 1 minutes]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>defaultTimeLimit: aDuration [
	DefaultTimeLimit := aDuration
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>defaultTimeLimitSecs [
	^self defaultTimeLimit asMilliSeconds / 1000.0
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>defaultTimeLimitSecs: aNumber [
	self defaultTimeLimit: aNumber seconds
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>defaultTimeLimitSettingOn: aBuilder [
	<systemsettings>
	
	(aBuilder setting: #defaultTimeLimitSecs)
		target: self;
		parent: #pharoSystem ;
		label: 'Default time limit for tests (secs)' ;
		description: 'Detault time limit in seconds for test execution'
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>generateLastStoredRunMethod [

	self shouldGenerateLastStoredRunMethod ifTrue: [
		self class
			compile: (self lastRunMethodNamed: #lastStoredRun)
			classified: 'history' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>hasMethodBeenRun: aSelector [
	^ ((self lastRun at: #errors),
		(self lastRun at: #failures),
		(self lastRun at: #passed))
			includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>hasTestSelectors [

	^(self selectors anySatisfy: [ :each | 
		(each beginsWith: 'test') and: [
				each numArgs isZero 
			]
		]) or: [ 
			self superclass isTestCase and: [ 
				self shouldInheritSelectors and: [ 
						self superclass hasTestSelectors	
				]
			]
		]
	
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>history [
	^ history ifNil: [ history := self newTestDictionary ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>history: aDictionary [

	history := aDictionary.
	self historyAnnouncer announce: (TestSuiteEnded result: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>historyAnnouncer [
	^ HistoryAnnouncer ifNil: [  HistoryAnnouncer := Announcer new ]
]

{
	#category : #'initialize - event',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>initialize [
	super initialize.
	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance weak
		when: MethodAdded, MethodModified, MethodRemoved 
		send: #methodChanged: 
		to: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #TestCase
			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>isTestCase [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>isUnitTest [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>isUsed [
	"all my subclasses are used by me"
	^self name = 'TestCase'
		ifTrue: [ super isUsed ]
		ifFalse: [ true ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>lastRun [
	^ self classForTestResult historyFor: self
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>lastRunMethodNamed: aSelector [
	
	^ String streamContents: [:str |
		str nextPutAll: aSelector asString ;cr.
		str tab; nextPutAll: '^ ', (self lastRun) storeString]

]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>lastStoredRun [
	^ ((Dictionary new) add: (#failures->#()); add: (#passed->#()); add: (#errors->#()); yourself)
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>localCoverage [
	"returns the coverage determined by a simple static analysis of test coverage 
	made by the receiver on a class that is identified by the name of the receiver.
	We assume that SetTest test Set. The computation of the coverage takes only into
	account the methods defined locally in the tested class. See coverage for a more global 
	coverage"

	| cls className |
	(self name endsWith: 'Test')
		ifFalse: [ self error: 'Please, use #localCoverageForClass: instead' ].
	className := self name copyFrom: 1 to: self name size - 'Test' size.
	cls := Smalltalk globals at: className asSymbol ifAbsent: [ self error: 'Please, use #localCoverageForClass: instead' ].
	cls isBehavior
		ifFalse: [ cls := cls class ].
	^ self localCoverageForClass: cls
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>localCoverageAsString [
	| cov className |
	cov := self localCoverage first asInteger. 
	"coverage already checks that the name is ends with 'Test' and if the class tested exists"
	
	className := self name copyFrom: 1 to: (self name size - 'Test' size).
	^ self name asString, ' covers ', cov asString, '% of ', className.
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>localCoverageForClass: cls [
	
	| definedMethods testedMethods untestedMethods |
	definedMethods := cls selectors.
	"It happens for IdentityBag / IdentityBagTest"
	definedMethods size = 0
		ifTrue: [^ {0. Set new}].

	testedMethods := 
		self methods inject: Set new into: 
							[:sums :cm | sums union: cm messages].
					
	"testedMethods contains all the methods send in test methods, which probably contains methods that have nothign to do with collection"
	testedMethods := testedMethods reject: [:sel | (definedMethods includes: sel) not].

	untestedMethods := definedMethods select: [:selector | (testedMethods includes: selector) not].

	^ { (testedMethods size * 100 / definedMethods size) asFloat . untestedMethods}

]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>localCoveragePercentage [
	^ self localCoverage first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>lookupHierarchyRoot [
	^TestCase
]

{
	#category : #'initialize - event',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodChanged: anEvent [
	"Remove the changed method from the known test results."
	
	| cls sel |
	cls := anEvent methodClass.
	(cls inheritsFrom: TestCase)
		ifFalse: [^ self].
	sel := anEvent selector.
	(sel beginsWith: 'test')
		ifFalse: [^ self].
	self classForTestResult removeFromTestHistory: sel in: cls.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodFailed: aSelector [
	^ (self lastRun at: #failures) includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodPassed: aSelector [
	^ (self lastRun at: #passed) includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodProgressed: aSelector [
	^ ((self storedMethodRaisedError: aSelector) or: [self storedMethodFailed: aSelector])
		and: [self methodPassed: aSelector]
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodRaisedError: aSelector [
	^ (self lastRun at: #errors) includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>methodRegressed: aSelector [
	^ (self storedMethodPassed: aSelector) and: [(self methodFailed: aSelector) or: [self methodRaisedError: aSelector]]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>newTestDictionary [

	^ Dictionary new at: #timeStamp put: DateAndTime now;
		at: #passed put: Set new;
		at: #failures put: Set new;
		at: #errors put: Set new;
		yourself
		
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>resetAnnouncer [
	self announcers removeKey: self ifAbsent: []
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>resetHistory [
	history := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>resources [

	^#()
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>run: aSymbol [

	^(self selector: aSymbol) run
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>runAllAndLogResult [

	"runs all tests in the image"

	TestCase suite run logCr
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>selector: aSymbol [

	^self new setTestSelector: aSymbol
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>shouldAnnounce [
	^ self announcers includesKey: self
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>shouldGenerateLastStoredRunMethod [
	| sameRun |
	
	(self class includesSelector: #lastStoredRun)
		ifFalse: [^ true].
	sameRun := #(#passed #failures #errors) inject: true into: 
		[ :ok :set | ok and: [(self lastRun at: set) = (self lastStoredRun at: set) ]].
	^ sameRun not

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>shouldInheritSelectors [
	"I should inherit from an Abstract superclass but not from a concrete one by default, unless I have no testSelectors in which case I must be expecting to inherit them from my superclass.  If a test case with selectors wants to inherit selectors from a concrete superclass, override this to true in that subclass."
	
	^self ~~ self lookupHierarchyRoot
		and: [self superclass isAbstract or: [self testSelectors isEmpty]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>storedMethodFailed: aSelector [
	^ (self lastStoredRun at: #failures) includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>storedMethodPassed: aSelector [
	^ (self lastStoredRun at: #passed) includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>storedMethodRaisedError: aSelector [
	^ (self lastStoredRun at: #errors) includes: aSelector
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>suite [

	^self buildSuite
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>sunitVersion [
	^'4.0'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase class>>testSelectors [
	^(self selectors select: [ :each | (each beginsWith: 'test') and: [each numArgs isZero]])
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>addDependentToHierachy: anObject  [
	"an empty method. for Composite compability with TestSuite"
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>announce: anAnnouncementClass [
	^ self announce: anAnnouncementClass withResult: nil
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>announce: anAnnouncementClass withResult: result [
	| event |
	self shouldAnnounce ifFalse: [ ^ self ].
	
	event := anAnnouncementClass asAnnouncement.
	event testCase: self.
	event testSelector: testSelector.
	event testResult: result.
	self announcer announce: event.
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>announcer [
	^ self class announcer
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>cleanUpInstanceVariables [
	self class allInstVarNames do: [ :name |
		name = 'testSelector' ifFalse: [
			self instVarNamed: name put: nil ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>debug [
	| result |
	result := self classForTestResult new.
	[ result runCaseForDebug: self ]
		ensure: [ self classForTestResource resetResources: self resources.
			result updateResultsInHistory  ].
	^ result
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>debugAsFailure [
	| semaphore |
	semaphore := Semaphore new.
	[ 
	semaphore wait.
	self classForTestResource resetResources: self resources ] fork.
	(self class selector: testSelector) runCaseAsFailure: semaphore
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>defaultTimeLimit [
	^self class defaultTimeLimit
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionContaining: aString [
	^[aBlock value.
 	false] on: anExceptionalEvent
		do: [:ex | ex return: (ex description includesSubstring: aString) ]
			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>expectedFailures [
	| pragmas |
	^ expectedFails ifNil: [
		
		pragmas := Pragma allNamed: #expectedFailure from: self class to: TestCase.
		expectedFails := pragmas collect: [:each | each method selector  ].
	]	

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>failureLog	 [
	^Transcript

			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>isExpectedFailure [
	^self expectedFailures includes: testSelector
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>isLogging [
	"By default, we're not logging failures. If you override this in 
	a subclass, make sure that you override #failureLog"
	^false
			
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>logFailure: aString [
	self isLogging ifTrue: [
		self failureLog 
			cr; 
			nextPutAll: aString; 
			flush]
			
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>openDebuggerOnFailingTestMethod [
	"SUnit has halted one step in front of the failing test method. Step over the 'self halt' and 
	 send into 'self perform: testSelector' to see the failure from the beginning"

	self
		halt;
		performTest
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>performTest [
	self perform: testSelector asSymbol
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>prepareToRunAgain 	 [

	"Used by the debugger when a test is restarted
	I'm not 'hidding'' possible exceptions because I think it is best to popup a new debugger
	if some one occurs and let the programmer decide what to do - Hernan"
	self 
		tearDown;
		setUp
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>printOn: aStream [
	aStream nextPutAll: self class printString.
	self printTestSelectorOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>printTestSelectorDefiningClass: aClass on: aStream [
	aStream << '('.
	aClass printOn: aStream.
	aStream << ')'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>printTestSelectorOn: aStream [
	testSelector
		ifNotNil: [ 
			| class |
			class := self class whichClassIncludesSelector: testSelector.
			class ~= self class
				ifTrue: [ self printTestSelectorDefiningClass: class on: aStream ].
			aStream
				nextPutAll: '>>#';
				nextPutAll: testSelector ]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>removeDependentFromHierachy: anObject  [
	"an empty method. for Composite compability with TestSuite"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>resources [
	"We give TestCase this instance-side method so that methods polymorphic with TestSuite can be code-identical.  Having this instance-side method also helps when writing tests of resource behaviour. Except for such tests, it is rare to override this method and should not be done without thought.  If there were a good reason why a single test case needed to share tests requiring different resources, it might be legitimate."

	^self class resources
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>run [
	| result |
	result := self classForTestResult new.
	[ result runCase: self]
		ensure: [ self classForTestResource resetResources: self resources ].
	^ result
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>run: aResult [
	aResult runCase: self
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>runCase [
	self resources do: [:each | each availableFor: self].
	[self setUp.
	self performTest] ensure: [
		self tearDown.
		self cleanUpInstanceVariables]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>runCaseAsFailure: aSemaphore [
	[self resources do: [:each | each availableFor: self].
	[self setUp.
	self openDebuggerOnFailingTestMethod] ensure: [self tearDown]]
		ensure: [aSemaphore signal]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>runCaseManaged [
	CurrentExecutionEnvironment runTestCase: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>selector [
	^testSelector
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>setTestSelector: aSymbol [
	testSelector := aSymbol
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>setUp [

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>shouldAnnounce [
	^ self class shouldAnnounce
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>shouldPass [
	^self isExpectedFailure not
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>tearDown [

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCase>>timeLimit: aDuration [
	^TestExecutionEnvironment maxTimeForTest: aDuration
]
