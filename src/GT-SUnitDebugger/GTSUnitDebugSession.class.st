"
I am a debugging session for the SUnit debugger. 
I extract from the execution stack various data needed by the user interface of the SUnit debugger, like the test object and method.

Public API and Key Messages

- process:context: does the initialization of the session
- data is provided using the methods in the accessing protocol

    Instance Variables
	actualResult:		<Object>
	assertionContext:		<Object>
	expectedResult:		<Object>
	testObject:		<Object>
"
Class {
	#name : #GTSUnitDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'assertionContext',
		'expectedResult',
		'actualResult',
		'testContext',
		'assertionCallerContext'
	],
	#category : #GT-SUnitDebugger,
	#timestamp : 'AndreiChis 12/30/2015 10:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession class>>activationPredicate [

	^  GTSUnitActivationPredicate new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>actualResult [
	
	^ actualResult
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>assertionCallerContext [

	^ assertionCallerContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>assertionContext [

	^ assertionContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>expectedResult [
	
	^ expectedResult 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>initializeAssestionContextFrom: aContext [
	| frameworkTestClasses |
	
	frameworkTestClasses := {TestCase. TestCase superclass}.
	
	assertionContext := aContext findContextSuchThat: [ :anotherContext |
		anotherContext = testContext 
			ifTrue: [ 
				"the assestion context should be between the top context and before the test context"
				^ self  ].
		anotherContext sender notNil and: [ 
			 (frameworkTestClasses anySatisfy: [ :aTestClass |
				 aTestClass includesSelector: anotherContext sender method selector]) not ] ].
	assertionContext 
		ifNotNil: [ assertionCallerContext := assertionContext sender]
	
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>initializeTestContextFrom: aContext [

	"we first try to find a test method in the stack"
	testContext := aContext findContextSuchThat: [ :anotherContext |
		anotherContext method isTestMethod ].
	
	testContext ifNil: [
		"if we do not find a test method, perhaps we are in the context of a different method, such as setUp, so we are looking for the last occurence of the test case instance in the stack"
		testContext := aContext findContextSuchThat: [ :anotherContext |
			anotherContext receiver class isTestCase ] ].
	
	testContext ifNil: [ 
		"if we did not find anything, we fallback to the default context"
		testContext := aContext ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>isActive [

	^ self isActive: self testContext
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>isActive: aContext [

	^ aContext 
		ifNil: [ false ] 
		ifNotNil: [ 
			aContext isDead not and: [
				aContext ~= self process suspendedContext or: [aContext willReturn not ] ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>overridesDefaultSetOrTearMethods [
	
	^ self overridesDefaultTearDownMethod or: [ 
		self overridesDefaultSetUpMethod ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>overridesDefaultSetUpMethod [
	
	^ self setUpMethod methodClass ~= TestCase
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>overridesDefaultTearDownMethod [
	
	^ self tearDownMethod methodClass ~= TestCase
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>process: aProcess context: aContext [

	super process: aProcess context: aContext.

	assertionContext ifNil: [
		self initializeTestContextFrom: aContext.
		self initializeAssestionContextFrom: aContext.
		self supportsDiff ifTrue: [ 
			actualResult := assertionContext tempAt: 1.
			expectedResult := assertionContext tempAt: 2 ]  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>setUpMethod [

	^ self testObject class lookupSelector: #setUp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>supportsDiff [

	^ assertionContext 
		ifNil: [ false ]
		ifNotNil: [ assertionContext selector = #assert:equals: ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>tearDownMethod [

	^ self testObject class lookupSelector: #tearDown
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>testContext [

	^ testContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebugSession>>testObject [

	^ testContext receiver
]
