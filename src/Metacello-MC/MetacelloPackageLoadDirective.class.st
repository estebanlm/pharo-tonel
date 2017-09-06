"

"
Class {
	#name : #MetacelloPackageLoadDirective,
	#superclass : #MetacelloDirective,
	#instVars : [
		'resolvedReference',
		'externalReference'
	],
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>externalReference [
	^ externalReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>file [

	^self externalReference name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>label [

	^self file
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadPackageDirective: self gofer: aGofer
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>packageDirectivesDo: aBlock [

	aBlock value: self
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>packageDo: aBlock [

	aBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>packageName [

	^self externalReference packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>repository [

	^self externalReference repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>resolvedReference [
	^ resolvedReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>resolvedReference: anObject [
	resolvedReference := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>spec: aPackageSpec externalReference: anExternalReference loader: aLoader [

	super spec: aPackageSpec loader: aLoader.
	externalReference := anExternalReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPackageLoadDirective>>title [

	^'load'
]
