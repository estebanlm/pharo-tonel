Extension {
	#name : #CompiledMethod
}

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>isEqualRegardlessTrailerTo: aCompiledMethod [
	^ (self copyWithTrailerBytes: CompiledMethodTrailer empty) = (aCompiledMethod copyWithTrailerBytes: CompiledMethodTrailer empty)
]

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>sizeWithoutTrailer [
	^ self trailer endPC
]
