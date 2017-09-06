"

"
Class {
	#name : #MetacelloPostLoadDirective,
	#superclass : #MetacelloPrePostLoadDirective,
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPostLoadDirective>>addTo: aLoaderDirective [

	spec postLoadDoIt value ~~ nil ifTrue: [ aLoaderDirective add: self ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPostLoadDirective>>label [

	^super label, ' >> ', self spec postLoadDoIt value asString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPostLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	aLoaderDirective loadPostloadDirective: self.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPostLoadDirective>>postLoadDo: aBlock [

	aBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPostLoadDirective>>title [

	^'postload'
]
