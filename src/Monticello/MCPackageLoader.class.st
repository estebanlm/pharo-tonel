"
A MCPackageLoader is responsible for loading packages.  It gets used by VersionLoader, so it is eventually responsible for loading everything.

Instance Variables
	additions:		<Definitions>  Definitions that need to be added
	errorDefinitions:		<Object>
	obsoletions:		<Object>
	provisions:		<Object>
	removals:		<Object>
	requirements:		<Object>
	unloadableDefinitions:		<Object>
	methodAdditions  <MethodAdditions> MethodDefinitions corresponding to the Definitions in ""additions"" that have been added so far.

"
Class {
	#name : #MCPackageLoader,
	#superclass : #Object,
	#instVars : [
		'requirements',
		'unloadableDefinitions',
		'obsoletions',
		'additions',
		'removals',
		'errorDefinitions',
		'provisions',
		'methodAdditions'
	],
	#category : #Monticello-Loading,
	#timestamp : '<historical>'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader class>>installSnapshot: aSnapshot [
	self new
		installSnapshot: aSnapshot;
		load
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader class>>unloadPackage: aPackage [
	self new
		unloadPackage: aPackage;
		loadWithNameLike: aPackage name, '-unload'
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader class>>updatePackage: aPackage withSnapshot: aSnapshot [
	self new
		updatePackage: aPackage withSnapshot: aSnapshot;
		load
]

{
	#category : #'patch ops',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>addDefinition: aDefinition [
	additions add: aDefinition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>analyze [
	| sorter |
	sorter := self sorterForItems: additions.
	additions := sorter orderedItems.
	requirements := sorter externalRequirements.
	unloadableDefinitions := sorter itemsWithMissingRequirements asSortedCollection.
	
	sorter := self sorterForItems: removals.
	removals := sorter orderedItems reversed.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>basicLoad [
    errorDefinitions := OrderedCollection new.
    SourceFiles deferFlushDuring: [self basicLoadDefinitions].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>basicLoadDefinitions [

	"FIXME. Do a separate pass on loading class definitions as the very first thing.
	This is a workaround for a problem with the so-called 'atomic' loading (you wish!)
	which isn't atomic at all but mixes compilation of methods with reshapes of classes.

	Since the method is not installed until later, any class reshape in the middle *will*
	affect methods in subclasses that have been compiled before. There is probably
	a better way of dealing with this by ensuring that the sort order of the definition lists
	superclass definitions before methods for subclasses but I need this NOW, and adding
	an extra pass ensures that methods are compiled against their new class definitions."

	additions do: [ :each | self loadClassDefinition: each ] displayingProgress: 'Loading classes...'.
	additions do: [ :each | self tryToLoad: each           ] displayingProgress: 'Compiling methods...'.
	removals  do: [ :each | each unload                    ] displayingProgress: 'Cleaning up...'.
	
	self shouldWarnAboutErrors ifTrue: [ self warnAboutErrors ].
	errorDefinitions do: [ :each | each addMethodAdditionTo: methodAdditions ] displayingProgress: 'Reloading erroneous definitions...'.
	
	methodAdditions do: [ :each | each installMethod ].
	methodAdditions do: [ :each | each notifyObservers ].
	additions       do: [ :each | each postloadOver: (self obsoletionFor: each) ] displayingProgress: 'Initializing...'.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>dependencyWarning [
	^ String streamContents:
		[:s |
		s nextPutAll: 'This package depends on the following classes:'; cr.
		requirements do: [:ea | s space; space; nextPutAll: ea; cr].
		s nextPutAll: 'You must resolve these dependencies before you will be able to load these definitions: '; cr.
		unloadableDefinitions do: [:ea | s space; space; nextPutAll: ea summary; cr]] 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>errorDefinitionWarning [
	^ String streamContents:
		[:s |
		s nextPutAll: 'The following definitions had errors while loading.  Press Proceed to try to load them again (they may work on a second pass):'; cr.
		errorDefinitions do: [:ea | s space; space; nextPutAll: ea summary; cr]] 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>initialize [
	super initialize.
	additions := OrderedCollection new.
	removals := OrderedCollection new.
	obsoletions := Dictionary new.
	methodAdditions := OrderedCollection new. 

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>installSnapshot: aSnapshot [
	| patch |
	patch := aSnapshot patchRelativeToBase: MCSnapshot empty.
	patch applyTo: self.

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>load [
	self validate.
	self useNewChangeSetDuring: [self basicLoad].
	MCMethodDefinition cachedDefinitions finalizeValues.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>loadClassDefinition: aDefinition [

	[ aDefinition isClassDefinition 
		ifTrue: [ aDefinition load ]
	] on: Error do: [ 
		errorDefinitions add: aDefinition ].
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>loadWithName: baseName [
	self validate.
	self useChangeSetNamed: baseName during: [self basicLoad]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>loadWithNameLike: baseName [
	self validate.
	self useNewChangeSetNamedLike: baseName during: [self basicLoad]
]

{
	#category : #'patch ops',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>modifyDefinition: old to: new [
	self addDefinition: new.
	obsoletions at: new put: old.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>obsoletionFor: aDefinition [
	^ obsoletions at: aDefinition ifAbsent: [nil]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>orderDefinitionsForLoading: aCollection [
	^ (self sorterForItems: aCollection) orderedItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>orderedAdditions [
	^ additions
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>provisions [
	^ provisions ifNil: [provisions := Set withAll: Smalltalk globals keys]
]

{
	#category : #'patch ops',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>removeDefinition: aDefinition [
	removals add: aDefinition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>shouldWarnAboutErrors [
	^ errorDefinitions isEmpty not and: [false "should make this a setting ?"]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>sorterForItems: aCollection [
	| sorter |
	sorter := MCDependencySorter items: aCollection.
	sorter addExternalProvisions: self provisions.
	^ sorter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>tryToLoad: aDefinition [
	[aDefinition addMethodAdditionTo: methodAdditions] on: Error do: [errorDefinitions add: aDefinition].
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>unloadPackage: aPackage [
	self updatePackage: aPackage withSnapshot: MCSnapshot empty.
	MCMethodDefinition cachedDefinitions finalizeValues.
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>updatePackage: aPackage withSnapshot: aSnapshot [
	|  patch packageSnap |
	packageSnap := aPackage snapshot.
	patch := aSnapshot patchRelativeToBase: packageSnap.
	patch applyTo: self.
	packageSnap definitions do: [:ea | self provisions addAll: ea provisions]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>useChangeSetNamed: baseName during: aBlock [
	"Use the named change set, or create one with the given name."
	| oldChanges newChanges |
	oldChanges := ChangeSet current.
	newChanges := (ChangeSet named: baseName) ifNil: [ ChangeSet new name: baseName ].
	ChangeSet newChanges: newChanges.
	aBlock ensure: [ ChangeSet newChanges: oldChanges ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>useNewChangeSetDuring: aBlock [
	^self useNewChangeSetNamedLike: 'MC' during: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>useNewChangeSetNamedLike: baseName during: aBlock [
	^self useChangeSetNamed: (ChangeSet uniqueNameLike: baseName) during: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>validate [
	self analyze.
	unloadableDefinitions isEmpty ifFalse: [self warnAboutDependencies].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>warnAboutDependencies  [
	self notify: self dependencyWarning
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageLoader>>warnAboutErrors [
	self notify: self errorDefinitionWarning.

]
