"

"
Class {
	#name : #MetacelloVersionLoadDirective,
	#superclass : #MetacelloDirective,
	#instVars : [
		'loadDirectives'
	],
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>add: aDirective [

	self loadDirectives add: aDirective
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>directivesDo: aBlock [

	aBlock value: self.
	self loadDirectives do: [:directive | directive directivesDo: aBlock ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>finalizeLoad: aGofer [
	"nothing special for linear loads"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>isExplicit [

	^false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>label [

	self spec == nil ifTrue: [ ^'' ].
	^self spec label
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadAtomicLoadDirective: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadDirectives do: [:directive | directive loadUsing: aLoaderDirective gofer: aGofer ].
	aLoaderDirective finalizeLoad: aGofer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadDirectives [

	loadDirectives == nil ifTrue: [ loadDirectives := OrderedCollection new ].
	^ loadDirectives
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadDirectives: anObject [
	loadDirectives := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadExplicitLoadDirective: aLoaderDirective gofer: aGofer [
	"load has already been performed, no need to load again"
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadLinearLoadDirective: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadDirectives do: [:directive | directive loadUsing: aLoaderDirective gofer: aGofer ].
	aLoaderDirective finalizeLoad: aGofer.
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadPackageDirective: aPackageLoadDirective gofer: aGofer [

	aPackageLoadDirective loader loadingSpecLoader 
		loadPackageDirective: aPackageLoadDirective 
		gofer: aGofer
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadPostloadDirective: aPostloadDirective  [

	| block |
	(block :=  aPostloadDirective spec postLoadDoItBlock) ~~ nil
		ifTrue: [
			aPostloadDirective evaluateSupplyingAnswers: [ block valueWithPossibleArgs: 
					(Array 
						with: aPostloadDirective loader 
						with: aPostloadDirective spec) ].
			Transcript cr; show: 'Evaluated -> ', aPostloadDirective spec label, ' >> ', aPostloadDirective spec postLoadDoIt value asString]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadPreloadDirective: aPreloadDirective  [

	| block |
	(block :=  aPreloadDirective spec preLoadDoItBlock) ~~ nil
		ifTrue: [
			aPreloadDirective evaluateSupplyingAnswers: [ block valueWithPossibleArgs: 
					(Array 
						with: aPreloadDirective loader 
						with: aPreloadDirective spec) ].
			Transcript cr; show: 'Evaluated -> ', aPreloadDirective spec label, ' >> ', aPreloadDirective spec preLoadDoIt value asString]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>loadWithPolicy: aLoadPolicy [

	| gofer |
	gofer := MetacelloGofer new.
	gofer disablePackageCache.
	gofer repository: aLoadPolicy cacheRepository.
	self loadUsing: self gofer: gofer
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>packageDirectivesDo: aBlock [

	self loadDirectives do: [:directive | directive packageDirectivesDo: aBlock ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>packagesDo: aBlock [

	self loadDirectives do: [:directive | directive packageDo: aBlock ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>prepostLoadDirectivesDo: aBlock [

	self loadDirectives do: [:directive | directive prepostLoadDirectivesDo: aBlock ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>prepostLoadsDo: aBlock [

	self loadDirectives do: [:directive | directive prepostLoadDo: aBlock ].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>printLoadDirectivesOn: aStream indent: indent [

	self loadDirectives do: [:each |
		aStream cr. 
		each printOn: aStream indent: indent + 1 ].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>printOn: aStream indent: indent [

	super printOn: aStream indent: indent.
	self printLoadDirectivesOn: aStream indent: indent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>spec [
	"Expected to be a MetacelloVersionSpec"
	
	(spec == nil  and: [  self loader ~~ nil ]) 
		ifTrue: [ 
			^[ self loader spec versionSpec ] 
				on: MessageNotUnderstood
				do: [:ex | ex return: self loader spec ]].
	^spec
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>versionDirectivesDepthFirstDo: aBlock [

	self loadDirectives do: [:directive | directive versionDirectivesDepthFirstDo: aBlock ].
	aBlock value: self.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>versionDirectivesDo: aBlock [

	aBlock value: self.
	self loadDirectives do: [:directive | directive versionDirectivesDo: aBlock ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>versionDo: aBlock [

	aBlock value: self.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloVersionLoadDirective>>versionsDo: aBlock [

	self loadDirectives do: [:directive | directive versionDo: aBlock ].
]
