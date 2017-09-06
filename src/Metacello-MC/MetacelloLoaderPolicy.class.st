"

"
Class {
	#name : #MetacelloLoaderPolicy,
	#superclass : #Object,
	#instVars : [
		'overrideRepositories',
		'repositoryMap',
		'ensuredMap',
		'cacheRepository',
		'cacheGofer',
		'ignoreImage',
		'loadData',
		'loadDirective',
		'silently'
	],
	#category : #Metacello-MC-Loaders,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy class>>overrideRepositories: aCollection [

	^self new overrideRepositories: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>cacheGofer [

	cacheGofer == nil 
		ifTrue: [ 
			"don't use a caching Gofer here, since we expect the contents to change during a fetch operation"
			cacheGofer := Gofer new. 
			cacheGofer disablePackageCache.
			cacheGofer repository: self cacheRepository. ].
	^ cacheGofer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>cacheRepository [

	cacheRepository == nil ifTrue: [ cacheRepository := MCDictionaryRepository new ].
	^ cacheRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>cacheRepository: anMCRepository [

	cacheRepository := anMCRepository.
	"getting a new repository, so wipe out the cacheGofer and ensureMap"
	ensuredMap := cacheGofer := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>ensuredMap [

	ensuredMap == nil ifTrue: [ ensuredMap := Dictionary new ].
	^ensuredMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>ensuredMap: anObject [
	ensuredMap := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>hasRepositoryOverrides [

	^self overrideRepositories ~~ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>ignoreImage [
	^ ignoreImage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>ignoreImage: anObject [
	ignoreImage := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>initialize [

	self 
		repositoryMap; 
		cacheRepository;
		ensuredMap.
	ignoreImage := false
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>load [

	overrideRepositories := Array with: self cacheRepository. "ensure that hasRepositoryOverrides is true"
	self loadDirective loadWithPolicy: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>loadData [

 	loadData == nil ifTrue: [ loadData := MetacelloLoadData new ].
	^loadData
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>loadDirective [

	loadDirective == nil ifTrue: [ loadDirective := MetacelloLinearLoadDirective new ].
	^ loadDirective
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>overrideRepositories [
	^ overrideRepositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>overrideRepositories: anObject [
	overrideRepositories := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>pushAtomicLoadDirectivesDuring: aBlock for: aLoader [

	self pushLoadDirective: (MetacelloAtomicLoadDirective loader: aLoader) during: aBlock.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>pushExplicitLoadDirectivesDuring: aBlock for: aLoader [

	| directive |
	directive := MetacelloExplicitLoadDirective loader: aLoader.
	self pushLoadDirective: directive during: aBlock.
	^directive
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>pushLinearLoadDirectivesDuring: aBlock for: aLoader [

	self pushLoadDirective: (MetacelloLinearLoadDirective loader: aLoader) during: aBlock.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>pushLoadDirective: aLoaderDirective during: aBlock [

	|  oldRoot |
	self loadDirective add: aLoaderDirective.
	oldRoot := loadDirective.
	loadDirective := aLoaderDirective.
	aBlock ensure: [ loadDirective := oldRoot ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>repositoryMap [

	repositoryMap == nil ifTrue: [ repositoryMap := Dictionary new ].
	^repositoryMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>repositoryMap: anObject [
	repositoryMap := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>resetCacheGofer [

	cacheGofer := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>silently [

	silently == nil ifTrue: [ silently := false ].
	^ silently
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLoaderPolicy>>silently: anObject [
	silently := anObject
]
