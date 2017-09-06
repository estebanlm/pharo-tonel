Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
SmalltalkImage>>getSystemAttribute: aNumber [
	^ self vm getSystemAttribute: aNumber
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
SmalltalkImage>>platformName [
	^ self os platformName
]
