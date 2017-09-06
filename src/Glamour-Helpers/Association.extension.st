Extension {
	#name : #Association
}

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
Association>>asGlamourOriginIdentifier [
	^ GLMPortIdentifier new 
		paneName: self key;
		portName: self value
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
Association>>asGlamourTargetIdentifier [
	^ GLMPortIdentifier new 
		paneName: self key;
		portName: self value
]
