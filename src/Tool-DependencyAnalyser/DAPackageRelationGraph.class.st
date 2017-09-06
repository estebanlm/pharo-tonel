"
I'm a package dependency graph. 
To build the dependency graph among packages, you have just to give a set of PDPackage on entry. Then :

	- use the message computeStaticDependencies messages to retrieve all the dependency among the packages.
	- use the message removeInternalDependencies if you want to remove all the internal dependency.
	- finally use combineDependencies to combine each dependency which have the same source and the target into 	composite dependency.
		
"
Class {
	#name : #DAPackageRelationGraph,
	#superclass : #Object,
	#instVars : [
		'packages',
		'classToPackage'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/21/2014 14:35'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph class>>new [
	^ self onPackages: OrderedCollection new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph class>>onPackages: aCollection [
	^ self basicNew
		initializeWithPackages: aCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph class>>onPackagesNamed: packageNames [
	^ self basicNew
		initializeWithPackages: (packageNames collect: [ :each | DAPackage onPackageNamed: each ]);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addExtensionDependencies: aPDPackage	 [
	aPDPackage rPackageSet extensionMethods
		do: [ :method | | packageOfExtendedClass |
			packageOfExtendedClass := self packageForBehavior: method actualClass.
			self addPackage: packageOfExtendedClass.
			aPDPackage
				add:
					((DAExtensionDependency from: aPDPackage to: packageOfExtendedClass)
						theClass: method actualClass;
						selector: method selector asSymbol;
						method: method).
			 ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addInheritanceDependencies: aPackage [
	| package |
	self package: aPackage
		classesDo: [ :class | 
			class superclass ifNotNil: [ 
					package := self packageForBehavior: class superclass.
					aPackage
						add:
							((DAInheritanceDependency from: aPackage to: package)
								theClass: class;
								superclass: class superclass).
					self addPackage: package ] ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addMessageSendDependencies: aPackage [
	| analyser |
	analyser := (DAMessageSendAnalyzer basicNew
		initializeWith: aPackage;
		yourself).

	analyser manuallyResolvedDependencies do: 
		[ :packageName |
		(analyser missingMethodsImplementedIn: packageName) 
			ifEmpty: [ PotentialOutDatedDependencyWarning signalDependency: packageName on: aPackage packageName ]
			ifNotEmpty: 	[ :implementedMethods |
				aPackage add: ((DAMessageSendDependency from: aPackage to: (self daPackageWith: packageName))
					implementedMethods: implementedMethods;
					yourself) ] ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addPackage: aPDPackage [
	aPDPackage beIncluded.
	packages 
		at: aPDPackage packageName
		put: aPDPackage
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addPackages: aCollection [
	aCollection
		do: [ :package | 
			self addPackage: package ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addReferenceDependencies: aPackage [
	(self methodsFor: aPackage) 
		do: [ :method | self findReferencesIn: method for: aPackage ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>addTraitDependencies: aPackage [
	| package |
	self package: aPackage
		classesDo: [ :class | 
			class traits
				do: [ :trait |
					package := self packageForBehavior: trait.
					aPackage
						add:
							((DATraitDependency from: aPackage to: package)
								theClass: class;
								trait: trait).
					self addPackage: package ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>allDependentPackagesFromSeenPackages [
	| aSet |
	aSet := Set new.
	self seenPackages do: [ :seenPackage |
		aSet addAll: (seenPackage dependentPackages) ].
	
	^ aSet	

]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>allExtensionDependencies [
	| aCollectionOfExtensionDependency |
	aCollectionOfExtensionDependency := OrderedCollection new.
	
	self seenPackages do: [ :each |
		each dependencies do: [ :dependency |
			aCollectionOfExtensionDependency addAll: dependency extensionDependencies.
			 ]
		 ].
	^ aCollectionOfExtensionDependency
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>allReferenceDependencies [
	| aCollectionOfReferenceDependency |
	aCollectionOfReferenceDependency := OrderedCollection new.
	
	self seenPackages do: [ :each |
		each dependencies do: [ :dependency |
			aCollectionOfReferenceDependency addAll: dependency referenceDependencies.
			 ]
		 ].
	^ aCollectionOfReferenceDependency
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>allSeen [
	
	^ self packages allSatisfy: [ :each | each isSeen ].
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>build [
	"build the dependency graph"
	self 
		computeStaticDependencies;
		removeInternalDependencies;
		combineDependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>classToPackage [
	^ classToPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>classToPackage: aClass [
	^ (classToPackage at: aClass) packageName
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>classesFor: aPackage [
	^ aPackage rPackageSet classes
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>clearAllDependencies [
	packages do: [ :package | package clearDependencies ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>clearPackages [
	packages := Dictionary new
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>combineDependencies [
	"Combine all dependencies with the same source and target into one composite
	dependency."
	self packages 
		do: [ :each | self combineDependencies: each ]
		displayingProgress: 'Combining Dependencies'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>combineDependencies: aPackage [
	| grouped composite |
	grouped := aPackage dependencies
		groupedBy: [ :each | each target ]
		having: [ :each | true ].
	
	aPackage clearDependencies.
	
	grouped keysAndValuesDo: [ :target :dependencies |
		composite := DACompositeDependency from: aPackage to: target.
		dependencies do: [ :each | composite add: each ].
		aPackage add: composite ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>computeStaticDependencies [
	self packages
		do: [ :each | 
			each isSeen
				ifFalse: [ 
					self computeStaticDependencies: each.
					each beSeen ] ] 
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>computeStaticDependencies: aPackage [
	
	self addInheritanceDependencies: aPackage.
	self addExtensionDependencies: aPackage.
	self addReferenceDependencies: aPackage.
	self addTraitDependencies: aPackage.
	self addMessageSendDependencies: aPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>daPackageWith: packageName [
	^ DAPackage on: (RPackageSet named: packageName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>dependenciesFrom: aPackage [
	"Answer all seen packages."

	^ (packages at: aPackage) dependencies
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>findReferencesIn: aMethod for: aPackage [
	| package compiledMethod |

	compiledMethod := aMethod compiledMethod.
	^ compiledMethod
		ifNotNil: [ 
			compiledMethod literals allButLast
				do: [ :literal | 
					(self isReference: literal)
						ifTrue: [ 
							package := self packageForBehavior: literal value.
							self addPackage: package.
							aPackage
								add:
									((DAReferenceDependency from: aPackage to: package)
										theClass: aMethod actualClass;
										selector: aMethod method selector asSymbol;
										reference: literal value;
										method: aMethod;
										yourself) ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>includedPackages [
	"Answer the currently analyzed set of packages."

	^ self packages select: [ :each | each isIncluded ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>includesSeenPackage: aPackage	 [
	^ self seenPackages includes: aPackage
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>initializeWithPackages: aCollection [
	self initialize.
	packages := Dictionary new.
	aCollection do: [ :each | self addPackage: each ].
	classToPackage := IdentityDictionary new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>isReference: aLiteral [
	^ aLiteral isVariableBinding and: [ aLiteral value isBehavior and: [ aLiteral key = aLiteral value name ] ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>methodsFor: aPackage [
	^ aPackage rPackageSet methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>outgoing [
	"Answer a collection of all dependencies that point out of the current package set."

	^ self includedPackages
		inject: Bag new
		into: [ :outgoing :package |
			package dependencies do: [ :each |
				(each isInternal or: [ each target isIncluded ])
					ifFalse: [ outgoing add: each ] ].
			outgoing ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>package: aPackage classesDo: aBlock  [
	aPackage rPackageSet classes do: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>packageAt: aPackageName [
	"answer a PDPackage"
	(packages keys includes: aPackageName) ifTrue: [  
	^ packages at: aPackageName ].
	^ nil
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>packageForBehavior: aClass [
	"return a PDPackage and put in classToPackage"

	^ classToPackage
		at: aClass
		ifAbsentPut: [ 
			self packages
				detect: [ :each | each rPackageSet includesClass: aClass ]
				ifNone: [ self systemPackageContaining: aClass ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>packageNamed: aString ifAbsent: aBlock [
	^ packages at: aString ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>packages [

	^ packages values
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>packagesName [

	^ packages keys
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>pdPackageFrom: aClass [
	^ packages detect: [ :package | package rPackageSet includesClass: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>predecessors: aPackage [
	"returns a Collection with the predecessors of the package"

	| aCollection |
	aCollection := OrderedCollection new.
	self packages
		do: [ :package | 
			package dependencies
				do: [ :dependency | 
					dependency target = aPackage
						ifTrue: [ aCollection add: package ] ] ].
	^ aCollection
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>refreshGraph [
	| olderPackages refreshPackage |
	classToPackage := IdentityDictionary new.
	olderPackages := self seenPackagesName.
	self clearPackages.
	olderPackages
		do: [ :packageName | 
			refreshPackage := self daPackageWith: packageName.
			self addPackage: refreshPackage ].
	self build
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>refreshPackageDependencies: aPackage [
	aPackage clearDependencies.
	self computeStaticDependencies: aPackage.
	self combineDependencies: aPackage.
	aPackage removeAllInternal.
	aPackage beSeen.
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>removeInternalDependencies [
	"Remove all dependencies from a package to itself"
	
	self includedPackages
		do: [ :each | each removeAllInternal ]
		displayingProgress: 'Removing internal Dependencies'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>removeOutgoingDependencies [
	"Remove all dependencies to packages not included in this relation"
	
	self includedPackages
		do: [ :each | self removeOutgoingDependencies: each ]
		displayingProgress: 'Removing outgoing Dependencies'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>removeOutgoingDependencies: aPackage [
	| removals |
	removals := aPackage dependencies reject: [ :each | each target isIncluded ].
	removals do: [ :each | aPackage remove: each ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>removePackage: packageName [
	^ packages removeKey: packageName
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>seenPackages [
	^ self packages 
		select: [ :each | each isSeen ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>seenPackagesName [
	"Answer all seen packages name."

	^ self seenPackages collect: [ :package | package packageName ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>seenPackagesWithFilter: aFilter [
	^ self packages 
		select: [ :each | each isSeen and: [ aFilter match: each packageName ] ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>seenPackagesWithoutExtension [
	^ self packages select: [ :each | each isSeen ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>successors: aPackage [
	"answer a collection with the successors of aPackage in the graph"

	| aCollection |
	aCollection := OrderedCollection new.
	(packages at: aPackage packageName) dependencies
		do: [ :dependency | 
			(self packagesName includes: dependency target packageName)
				ifTrue: [ aCollection add: dependency target ] ].
	^ aCollection
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>systemPackageContaining: aClass [
	| info |
	info := (RPackageOrganizer default packageOf: aClass) packageName.
	^ info
		ifNil: [ self error: 'Package for ' , aClass name , ' not found.' ]
		ifNotNil: [ DAPackage on: (RPackageSet named: info asString) ]
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraph>>usersOf: aPackage [
	| users |
	users := OrderedCollection new.
	self seenPackages
		do: [ :package | 
			(package dependentPackages includes: aPackage)
				ifTrue: [ users add: package ] ].
	^ users
]
