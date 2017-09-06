Extension {
	#name : #TApplyingOnClassSide
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
TApplyingOnClassSide>>stonName [
	^ #Class
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
TApplyingOnClassSide>>stonOn: stonWriter [
	stonWriter
		writeObject: self 
		listSingleton: self theNonMetaClass name asSymbol
]
