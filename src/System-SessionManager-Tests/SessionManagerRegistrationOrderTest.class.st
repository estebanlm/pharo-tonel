"

"
Class {
	#name : #SessionManagerRegistrationOrderTest,
	#superclass : #TestCase,
	#instVars : [
		'manager'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : ''
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>assertHandledId: aSessionHandlerList equals: aCollection [
	self 
		assert: (aSessionHandlerList collect: #handledId)
		equals: aCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>register: aString atSystemPriority: anInteger [
	manager 
		register: aString
		inCategory: manager systemCategory
		atPriority: anInteger
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>setUp [
	manager := SessionManager new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testCategoriesPriorityOrder [
	manager 
		register: (ClassSessionHandler forClassNamed: 'anObject');
		registerSystemClassNamed: 'aFirstSubscription' atPriority: 100.
	
	self 
		assertHandledId: manager startupList 
		equals: #( 'aFirstSubscription' 'anObject' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testCreateCategoryFailsIfAfterUnexistentCategory [
	| customCategory |
	
	self 
		should: [customCategory := manager createCategory: 'Second' after: 'First']
		raise: NotFound.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testCustomCategoryGoesAfterSystemCategoryByDefault [
	| customCategory |
	customCategory := manager createCategory: 'Custom'.
	customCategory register: 'aCustomAction'.
	
	manager systemCategory register: 'aSystemAction' atPriority: 10.
	
	self 
		assert: manager startupList
		equals: #( 'aSystemAction' 'aCustomAction' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testCustomCategoryOrderIsPreserved [
	| customCategory |
	customCategory := manager createCategory: 'First'.
	customCategory register: 'first'.	
	
	customCategory := manager createCategory: 'Second' after: 'First'.
	customCategory register: 'second'.
	
	self 
		assert: manager startupList 
		equals: #( 'first' 'second' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testPriorityOrderInTheSameCategoryIsRespected [
	manager
		registerSystemClassNamed: 'aFirstSubscription' atPriority: 100;
		registerSystemClassNamed: 'aSecondSubscription' atPriority: 110;
		registerSystemClassNamed: 'aThirdSubscriptionThatShouldGoFirst' atPriority: 90.
		

	self 
		assertHandledId: manager startupList 
		equals: #( 'aThirdSubscriptionThatShouldGoFirst' 'aFirstSubscription' 'aSecondSubscription' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testRegisterElementByDefault [
	manager register: (ClassSessionHandler forClassNamed: 'anObject').

	self 
		assertHandledId: manager startupList
		equals: #( 'anObject' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testRegisterSystemElement [
	manager registerSystemClassNamed: 'anObject' atPriority: 1.

	self 
		assertHandledId: manager startupList
		equals: #( 'anObject' ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationOrderTest>>testSubscriptionReverseOrder [
	manager
		registerSystemClassNamed: 'aFirstSubscription' atPriority: 100;
		register: (ClassSessionHandler forClassNamed: 'anObject').

	self 
		assertHandledId: manager startupList 
		equals: #( 'aFirstSubscription' 'anObject' ).
	self 
		assertHandledId: manager shutdownList 
		equals: #( 'anObject' 'aFirstSubscription' ).
]
