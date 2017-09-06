"
I analyze package sent messages to reveal dependencies.

Examples:
(self on: 'Kernel') difference
(self on: 'Kernel') missingMethodsWithPotentialMatch
(self on: 'Kernel') possibleDeadCode
(self on: 'Kernel') missingDependencies
(self on: 'Kernel') 	missingMethodsWithPotentialMatchAfterMissingDependenciesAddition

"
Class {
	#name : #DAMessageSendAnalyzer,
	#superclass : #Object,
	#instVars : [
		'packageAnalysis',
		'missingMethods'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'ChristopheDemarey 6/29/2015 15:05'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer class>>on: aPackageName [
	| packageAnalysis |
	packageAnalysis := ((DAPackageRelationGraph onPackagesNamed: { aPackageName })
				build;
				packages)
			select: #isSeen.
	^ self basicNew
		initializeWith: packageAnalysis first;
		yourself
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer class>>packagesProvidingSelector: aSelector [
	^ aSelector implementors 
		collect: [:each | each package name]
		as: Set
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>implementedMessages [
	^ (self packageStaticDependencies 
		add: self packageName;
		yourself)
		flatCollect: [ :name | (RPackageOrganizer default packageNamed: name) selectors ]
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>implementedMessagesWithManuallyResolvedDependencies [
	^ (self manuallyResolvedDependencies 
		flatCollect: [ :name | (RPackageOrganizer default packageNamed: name) selectors ]
		as: Set)
			addAll: self implementedMessages;
			yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>initializeWith: aDAPackage [
	packageAnalysis := aDAPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>manuallyResolvedDependencies [
	^ self rPackage manuallyResolvedDependencies 
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>missingDependencies [
	^ (self missingMethodsWithPotentialMatch
		select: [ :each | each size = 1 ]) flattened asSet
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>missingMethods [
	^ self missingMethodsWithPotentialMatch keys
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>missingMethodsImplementedIn: aPackageName [
	^ (RPackageOrganizer default packageNamed: aPackageName) selectors
		intersection: self missingMethods
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>missingMethodsWithPotentialMatch [
	^ missingMethods ifNil: 
		[ missingMethods := Dictionary new.
		self unimplementedCalls do: [ :selector |
		missingMethods
			at: selector 
			put: (self packagesProvidingSelector: selector) ].
		missingMethods ]
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>missingMethodsWithPotentialMatchAfterManuallyResolvedDependenciesAddition [
	| dictionary |
	
	dictionary := Dictionary new.
	self unimplementedCallsInAllDependencies do: [ :selector |
		dictionary 
			at: selector 
			put: (self packagesProvidingSelector: selector) ].
	^ dictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>packageName [
	^ packageAnalysis packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>packageStaticDependencies	 [
	^ packageAnalysis dependencies 
		collect: [:each | each target packageName ]
		as: Set
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>packagesProvidingSelector: aSelector [
	^ self class packagesProvidingSelector: aSelector
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>possibleDeadCode [
	^ self missingMethodsWithPotentialMatch
		select: #isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>rPackage [
	^ packageAnalysis rPackageSet packages detect: [ :each | each packageName = self packageName ]
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>sentMessages [
	^ self rPackage methods 
		flatCollect: #messages
		as: Set
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>unimplementedCalls [
	^ self sentMessages difference: self implementedMessages
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendAnalyzer>>unimplementedCallsInAllDependencies [
	^ self sentMessages difference: self implementedMessagesWithManuallyResolvedDependencies
]
