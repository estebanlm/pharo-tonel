Extension {
	#name : #Boolean
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Boolean>>asExternalTypeOn: generator  [
	^ FFIConst value: self asBit
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Boolean class>>asExternalTypeOn: generator  [
	^ FFIBool asExternalTypeOn: generator
]
