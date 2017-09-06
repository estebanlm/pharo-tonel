"

"
Class {
	#name : #SessionManagerRegistrationTest,
	#superclass : #TestCase,
	#instVars : [
		'manager'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>setUp [
	manager := SessionManager new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenARegisteredClassHandlerShouldHasRegisteredReturnsTrue [
	manager registerSystemClassNamed: #Foo.

	self assert: (manager hasRegistered: #Foo)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenARegisteredClassRenamedThenItsHandlerIsUpdated [
	manager registerSystemClassNamed: #Foo.
	manager renamedClass: self from: #Foo to: #Bar.
	
	self 
		assert: (manager startupList collect: #handledId)
		equals: #( Bar ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenManyRegistrationsInDifferentCategoriesShoudlLastClassRegistrationBeTheOnlyOccurenceInStartupList [
	manager registerSystemClassNamed: #Foo.
	manager registerSystemClassNamed: #Bar.
	manager registerGuiClassNamed: #Foo atPriority: 30.
	manager registerGuiClassNamed: #Foo atPriority: 50.
	
	self 
		assert: (manager startupList collect: #handledId)
		equals: #( Bar Foo ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenManyRegistrationsInSameCategoryAtDifferentPriorityShoudlAClassBePresentOnlyOnceInStartupList [
	manager registerSystemClassNamed: #Foo.
	manager registerSystemClassNamed: #Bar atPriority: 15.
	manager registerSystemClassNamed: #Foo atPriority: 10.
	manager registerSystemClassNamed: #Foo atPriority: 20.
	
	self 
		assert: (manager startupList collect: #handledId)
		equals: #( Bar Foo ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenManyRegistrationsInSameCategoryShoudlAClassBePresentOnlyOnceInStartupList [
	manager registerSystemClassNamed: #Foo.
	manager registerSystemClassNamed: #Bar.
	manager registerSystemClassNamed: #Foo.
	manager registerSystemClassNamed: #Foo.
	
	self 
		assert: (manager startupList collect: #handledId)
		equals: #( Bar Foo ).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SessionManagerRegistrationTest>>testGivenUnknonwnHandledIdShouldHasRegisteredReturnsFalse [
	self deny: (manager hasRegistered: #Foo)
]
