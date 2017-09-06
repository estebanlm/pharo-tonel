"

"
Class {
	#name : #MetacelloLinearLoadDirective,
	#superclass : #MetacelloVersionLoadDirective,
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLinearLoadDirective>>loadUsing: aLoaderDirective gofer: aGofer [

	self loadDirectives isEmpty ifTrue: [ ^self ].
	aLoaderDirective loadLinearLoadDirective: self gofer: aGofer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloLinearLoadDirective>>title [

	^'linear load'
]
