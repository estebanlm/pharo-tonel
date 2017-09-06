Extension {
	#name : #LargePositiveInteger
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
LargePositiveInteger>>fuelAccept: aGeneralMapper [
	^ self <= 4294967295 
		ifTrue: [ aGeneralMapper  mapAndTraceByClusterName: self to: FLPositive32SmallIntegerCluster ]
		ifFalse: [ aGeneralMapper visitBytesObject: self]
]
