Extension {
	#name : #LargeNegativeInteger
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
LargeNegativeInteger>>fuelAccept: aGeneralMapper [
	^ self >= -4294967295
		ifTrue: [ aGeneralMapper mapAndTraceByClusterName: self to: FLNegative32SmallIntegerCluster ]
		ifFalse: [ aGeneralMapper visitBytesObject: self]
]
