"
I'm a 128bits (cuadruple precision) float. 
It is usually not used, but some compiler modes support it (__float128 in gcc)

THIS IS NOT YET SUPPORTED
"
Class {
	#name : #FFIFloat128,
	#superclass : #FFIFloatType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 18:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat128 class>>externalType  [
	^ self error: '128bits floats are not currently supported!'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat128 class>>externalTypeAlignment [
	^ 16
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat128 class>>externalTypeSize [
	^ 16
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat128>>basicHandle: aHandle at: index [
	self error: 'Not yet supported!'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat128>>basicHandle: aHandle at: index put: value [
	self error: 'Not yet supported!'
]
