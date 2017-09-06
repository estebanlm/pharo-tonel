"

"
Class {
	#name : #MetacelloAtomicLoadDirective,
	#superclass : #MetacelloVersionLoadDirective,
	#instVars : [
		'packageloads',
		'preloads',
		'postloads'
	],
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>directivesDo: aBlock [

	aBlock value: self.
	self preloads do: [:directive | directive directivesDo: aBlock ].
	self loadDirectives do: [:directive | directive directivesDo: aBlock ].
	self postloads do: [:directive | directive directivesDo: aBlock ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>finalizeLoad: aGofer [
	"load the accumulated packages (if any), reset the package list"

	| pkgLoads |
	self preloads do: [:directive | super loadPreloadDirective: directive ].
	preloads := nil.
	(pkgLoads := self packageloads) notEmpty 
		ifTrue: [
			self loader loadingSpecLoader 
				loadPackageDirectives: pkgLoads 
				gofer: aGofer.
			self packageloads: nil ].
	self postloads do: [:directive | super loadPostloadDirective: directive ].
	postloads := nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadAtomicLoadDirective: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadDirectives do: [:directive | directive loadUsing: self gofer: aGofer ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadLinearLoadDirective: aLoaderDirective gofer: aGofer [

	self finalizeLoad: aGofer.
	super loadLinearLoadDirective: aLoaderDirective gofer: aGofer
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadPackageDirective: aPackageLoadDirective gofer: aGofer [
	"accumulate packages"
	
	self packageloads add: aPackageLoadDirective
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadPostloadDirective: aPostloadDirective [
	"accumulate postloads"

	self postloads add: aPostloadDirective
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadPreloadDirective: aPreloadDirective  [
	"accumulate preloads"

	self preloads add: aPreloadDirective
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	self loadDirectives isEmpty ifTrue: [ ^self ].
	aLoaderDirective loadAtomicLoadDirective: self gofer: aGofer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>packageloads [

	packageloads == nil ifTrue: [ packageloads := OrderedCollection new ].
	^ packageloads
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>packageloads: anObject [
	packageloads := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>postloads [

	postloads == nil ifTrue: [ postloads := OrderedCollection new ].
	^ postloads
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>preloads [

	preloads == nil ifTrue: [ preloads := OrderedCollection new ].
	^ preloads
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>prepostLoadDirectivesDo: aBlock [

	self preloads do: [:directive | directive prepostLoadDirectivesDo: aBlock ].
	self loadDirectives do: [:directive | directive prepostLoadDirectivesDo: aBlock ].
	self postloads do: [:directive | directive prepostLoadDirectivesDo: aBlock ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>prepostLoadsDo: aBlock [

	self preloads do: [:directive | directive prepostLoadDo: aBlock ].
	self loadDirectives do: [:directive | directive prepostLoadDo: aBlock ].
	self postloads do: [:directive | directive prepostLoadDo: aBlock ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAtomicLoadDirective>>title [

	^'atomic load'
]
