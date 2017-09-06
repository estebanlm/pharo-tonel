"

"
Class {
	#name : #MetacelloExplicitLoadDirective,
	#superclass : #MetacelloVersionLoadDirective,
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloExplicitLoadDirective>>explicitLoadUsing: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadLinearLoadDirective: self gofer: aGofer.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloExplicitLoadDirective>>explicitLoadWithPolicy: aLoadPolicy [

	| gofer |
	gofer := MetacelloGofer new.
	gofer disablePackageCache.
	gofer repository: aLoadPolicy cacheRepository.
	self explicitLoadUsing: self gofer: gofer
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloExplicitLoadDirective>>isExplicit [

	^true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloExplicitLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadExplicitLoadDirective: self gofer: aGofer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloExplicitLoadDirective>>title [

	^'explicit load'
]
