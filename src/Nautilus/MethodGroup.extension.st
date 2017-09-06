Extension {
	#name : #MethodGroup
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodGroup>>restrict: anEnvironment [
	^ anEnvironment selectMethods:[:m | self methods includes: m]
]
