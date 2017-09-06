"
I'm a 16bits (half precision) float. 
It is usually not used, but ARM processors support them (__fp16 in gcc). 

THIS IS NOT YET SUPPORTED
"
Class {
	#name : #FFIFloat16,
	#superclass : #FFIFloatType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 18:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat16 class>>externalType [
	self error: '16bits floats are not currently supported!'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat16 class>>externalTypeAlignment [
	^ 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat16 class>>externalTypeSize [
	^ 2
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat16>>basicHandle: aHandle at: index [
	self error: 'Not yet supported!'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat16>>basicHandle: aHandle at: index put: value [
	self error: 'Not yet supported!'
]
