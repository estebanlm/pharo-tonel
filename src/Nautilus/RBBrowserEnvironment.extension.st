Extension {
	#name : #RBBrowserEnvironment
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RBBrowserEnvironment>>browse [

	^ Smalltalk tools browser openInEnvironment: self
]
