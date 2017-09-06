"
A GLMImplicitBrowser is an abstract implementation of a browser that defines an implicit flow of transmissions.

When using implicit browsers, the developer does not have access to the internal transmissions.
"
Class {
	#name : #GLMImplicitBrowser,
	#superclass : #GLMBrowser,
	#instVars : [
		'presentations',
		'transmission'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 3/5/2011 21:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMImplicitBrowser>>addPresentation: aPresentation [
	self transmission transmissionStrategy addPresentation: aPresentation 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMImplicitBrowser>>newTransmission [
	^ self transmission copy
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMImplicitBrowser>>show: aBlock [
	self transmission transmissionStrategy presentationsFactory: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMImplicitBrowser>>transmission [
	^ transmission ifNil: [
		transmission := GLMTransmission new ensureReplacePresentationsStrategy.
		transmission ]
]
