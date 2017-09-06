"

"
Class {
	#name : #MetacelloPreLoadDirective,
	#superclass : #MetacelloPrePostLoadDirective,
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPreLoadDirective>>addTo: aLoaderDirective [

	spec preLoadDoIt value ~~ nil ifTrue: [ aLoaderDirective add: self ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPreLoadDirective>>label [

	^super label, ' >> ', self spec preLoadDoIt value asString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPreLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadPreloadDirective: self.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPreLoadDirective>>preLoadDo: aBlock [

	aBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPreLoadDirective>>title [

	^'preload'
]
