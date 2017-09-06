Extension {
	#name : #Symbol
}

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
Symbol>>asGlamourOriginIdentifier [
	^ GLMPortIdentifier defaultOriginOf: self
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
Symbol>>asGlamourTargetIdentifier [
	^ GLMPortIdentifier defaultTargetOf: self
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
Symbol>>glamourValueWithArgs: anArray  [
	 
	anArray size < 1 ifTrue: [^nil]. 
	^anArray first perform: self
]
