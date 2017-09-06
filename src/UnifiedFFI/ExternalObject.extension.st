Extension {
	#name : #ExternalObject
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalObject>>autoRelease [
	self isExternalAddress ifFalse: [ ^ self ].
	^ self getHandle autoRelease
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalObject>>pointer  [
	^ self getHandle pointer
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalObject>>registerAsExternalResource [
	self deprecated: 'Use #autoRelease instead.' on: '2016-01-22' in: #Pharo5.  
	self isExternalAddress ifFalse: [ ^ self ].
	^ self getHandle registerAsExternalResource
]
