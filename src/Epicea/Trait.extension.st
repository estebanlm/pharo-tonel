Extension {
	#name : #Trait
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
Trait>>asEpiceaRingDefinition [

	^ self asRingDefinition
		package: self epiceaPackageName;
		yourself.
]

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
Trait>>epiceaPackageName [
	"Answer my package name for Epicea serialization"

	self flag: #fix.
	^ (RPackage organizer packageOfClassNamed: self name) 
		ifNotNil: [ :package | package name ]
		ifNil: [ 'nil' ]
]
