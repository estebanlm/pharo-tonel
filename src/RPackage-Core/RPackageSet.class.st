"
I'm a set who can be instantiated by pattern matching RPackages (""name"" and ""name-*"").
My purpose is to provide a bridge between monticello and system packages, to allow backward compatibility with old packaging. 

"
Class {
	#name : #RPackageSet,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'packages',
		'classes',
		'definedClasses',
		'extensionMethods',
		'methods',
		'classesAndMetaClasses',
		'extensionClasses',
		'systemCategories',
		'overriddenMethods'
	],
	#classInstVars : [
		'cacheActive',
		'cachePackages'
	],
	#category : #RPackage-Core,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>basicNamed: aString [
	^ self basicNew 
		initialize: aString;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>cacheActive: aBoolean  [
	cacheActive := aBoolean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>cachePackageAt: aString ifAbsentPut: aBlock [
	"self addCount: aString."
	^ self cachePackages 
		at: aString asSymbol
		ifAbsentPut: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>cachePackages  [
	^ cachePackages ifNil: [ cachePackages := IdentityDictionary new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>isCacheActive  [
	^ cacheActive ifNil: [ cacheActive := false ].
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>named: aString [

	^ self isCacheActive 
		ifTrue: [ 
			self 
				cachePackageAt: aString 
				ifAbsentPut: [ self basicNamed: aString ] ]
		ifFalse: [ self basicNamed: aString ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>resetCache  [
	cachePackages := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet class>>withCacheDo: aBlock  [
	| oldActive |
	
	oldActive := self isCacheActive.
	self cacheActive: true.
	aBlock ensure: [ 
		self cacheActive: oldActive.
		self isCacheActive ifFalse: [ self resetCache ] ].
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>asRPackageSet [
	^self
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>category: categoryName matches: prefix [
	^ RPackageOrganizer default category: categoryName matches: prefix
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>categoryNames [
	^  self packages 	
		inject:  #()
		into: [ :all :each | all, (each classTagCategoryNames asArray) ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>changeRecordForOverriddenMethod: aMethodDefinition [
	^ SourceFiles
		changeRecordsFor: aMethodDefinition 
		detect: [ :protocol | 
			self 
				includesMethodCategory: protocol 
				ofClass: aMethodDefinition actualClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>classes [
	^classes ifNil: [ classes := self collectFromAllPackages: #definedClasses ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>classesAndMetaClasses [
	^classesAndMetaClasses ifNil: [ 
		classesAndMetaClasses := self collectFromAllPackages: #classesAndMetaClasses ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>collectFromAllPackages: selector [
	^self packages
		inject: #()
		into: [ :all :each | all, (each perform: selector) asArray ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>collectFromAllPackages: selector with: anObject [
	^self packages
		inject: #()
		into: [ :all :each | all, (each perform: selector with: anObject) asArray ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>coreCategoriesForClass: aClass [
	^self collectFromAllPackages: #coreCategoriesForClass: with: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>definedClasses [
	^definedClasses ifNil: [ definedClasses := self collectFromAllPackages: #definedClasses ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>extensionCategoriesForClass: aClass [
	^ aClass organization categories select: [:cat | self isYourClassExtension: cat]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>extensionClasses [
	^extensionClasses ifNil: [ extensionClasses := self collectFromAllPackages: #extensionClasses ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>extensionMethods [
	^extensionMethods ifNil: [
		extensionMethods := ((self collectFromAllPackages: #extensionMethods) collect: #asRingDefinition) asSet asArray ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>includesClass: aClass [
	^self packages anySatisfy: [ :each | each includesClass: aClass ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>includesMethodCategory: categoryName ofClass: aClass [
	^ (self isYourClassExtension: categoryName)
		or: [(self includesClass: aClass)
				and: [(self isForeignClassExtension: categoryName) not ]]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>includesSystemCategory: categoryName [
	^self packages anySatisfy: [ :each | 
		each includesSystemCategory: categoryName ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>initialize: aString [
	self initialize.
	packageName := aString asSymbol.
	packages := (RPackage organizer packageNamed: aString ifAbsent: [  nil ])
		ifNotNil: [ :package | { package }  ]
		ifNil: [ {} ]

]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>isForeignClassExtension: categoryName [
	^ categoryName first = $* and: [(self isYourClassExtension: categoryName) not]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>isYourClassExtension: categoryName [
	^ categoryName notNil and: [self category: categoryName asLowercase matches: self methodCategoryPrefix]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>methodCategoryPrefix [
	^ '*', self packageName asLowercase
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>methods [
	^methods ifNil: [ methods := (self collectFromAllPackages: #methods) collect: #asRingDefinition ]
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>overriddenMethods [
	^overriddenMethods ifNil: [ overriddenMethods := self collectFromAllPackages: #overriddenMethods ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>packageName [
	^packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>packages [
	^packages
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>systemCategories [
	^systemCategories ifNil: [ systemCategories := (self collectFromAllPackages: #systemCategories) asSet asArray].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
RPackageSet>>unregister [
	self packages do: #unregister
]
