Extension {
	#name : #MCVersion
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCVersion>>silentlyInitializeWithPackage: aPackage info: aVersionInfo snapshot: aSnapshot dependencies: aCollection [

	package := aPackage.
	info := aVersionInfo.
	snapshot := aSnapshot.
	dependencies := aCollection
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCVersion class>>silentlyPackage: aPackage info: aVersionInfo snapshot: aSnapshot dependencies: aCollection [

	^ self new silentlyInitializeWithPackage: aPackage info: aVersionInfo snapshot: aSnapshot dependencies: aCollection
]
