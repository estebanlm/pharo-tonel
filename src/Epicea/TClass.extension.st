Extension {
	#name : #TClass
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
TClass>>asEpiceaRingDefinition [
	"Answer a Ring definition as Epicea requires it (customized for serialization)."

	^ self explicitRequirement
]

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
TClass>>epiceaPackageName [
	"Answer my package name for Epicea serialization"

	self flag: #fix.
	^ (RPackage organizer packageOfClassNamed: self name) 
		ifNotNil: [ :package | package name ]
		ifNil: [ 'nil' ]
]
