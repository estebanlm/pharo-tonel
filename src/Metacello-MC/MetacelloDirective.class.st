"

"
Class {
	#name : #MetacelloDirective,
	#superclass : #Object,
	#instVars : [
		'spec',
		'loader'
	],
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective class>>loadPackage: aPackageSpec externalReference: externalReference loader: aLoader [

	^MetacelloPackageLoadDirective new
		spec: aPackageSpec externalReference: externalReference  loader: aLoader
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective class>>loader: aLoader [

	^self new
		loader: aLoader
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective class>>postLoadSpec: packageOrVersionSpec loader: aLoader [

	^MetacelloPostLoadDirective new
		spec: packageOrVersionSpec loader: aLoader
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective class>>preLoadSpec: packageOrVersionSpec loader: aLoader [

	^MetacelloPreLoadDirective new
		spec: packageOrVersionSpec loader: aLoader
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>addTo: aLoaderDirective [

	aLoaderDirective add: self
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>directivesDo: aBlock [

	aBlock value: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>label [

	^self spec label
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>loader [

	^loader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>loader: aLoader [

	loader := aLoader
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>packageDirectivesDo: aBlock [

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>packageDo: aBlock [

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>postLoadDo: aBlock [

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>preLoadDo: aBlock [

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>prepostLoadDirectivesDo: aBlock [

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>prepostLoadDo: aBlock [

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>printOn: aStream [

	self printOn: aStream indent: 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>printOn: aStream indent: indent [

	indent timesRepeat: [ aStream tab ].
	aStream
		nextPutAll: self title;
		nextPutAll: ' : ';
		nextPutAll: self label.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>printString [
	"Explicit override of superclass implementation. When you are printing a loadDirective it is annoying to have it truncated."

	^String streamContents: [:s | self printOn: s]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>spec [

	^spec
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>spec: packageOrVersionSpec loader: aLoader [

	spec := packageOrVersionSpec.
	loader := aLoader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>title [

	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>versionDirectivesDepthFirstDo: aBlock [

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>versionDirectivesDo: aBlock [

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloDirective>>versionDo: aBlock [

]
