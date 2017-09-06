Extension {
	#name : #TraitBehavior
}

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TraitBehavior>>allCallsOn [
	"Answer a SortedCollection of all the methods that refer to me by name or as part of an association in a global dict."
	self isAnonymous ifTrue: [ ^#() ].
	^ (self allCallsOnIn: self systemNavigation)
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TraitBehavior>>allCallsOn: aSymbol [
	"Answer a SortedCollection of all the methods that call on aSymbol."

	^ self  systemNavigation allCallsOn: aSymbol from: self .
	
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TraitBehavior>>allCallsOnIn: aSystemNavigation [
	"Answer a SortedCollection of all the methods that refer to me by name or as part of an association in a global dict."

	^ (aSystemNavigation 
		allReferencesTo: (self environment associationAt: self theNonMetaClass name)), 
		(aSystemNavigation allCallsOn: self theNonMetaClass name)	
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TraitBehavior>>allUnsentMessages [
	"Answer an array of all the messages defined by the receiver that are not sent anywhere in the system."

	^ SystemNavigation new allUnsentMessagesIn: self selectors
]

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TraitBehavior>>referencedClasses [
	"Return the set of classes that are directly referenced by my methods"

	^ self methods flatCollectAsSet: #referencedClasses
]
