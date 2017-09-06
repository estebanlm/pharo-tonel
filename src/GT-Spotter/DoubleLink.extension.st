Extension {
	#name : #DoubleLink
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
DoubleLink>>asSpotterDoubleLink [
	
	^ GTSpotterCandidateLink value: self value
]
