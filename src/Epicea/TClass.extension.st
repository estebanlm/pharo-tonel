Extension { #name : #TClass }

{ #category : #'*Epicea-Ring' }
TClass >> asEpiceaRingDefinition [
	"Answer a Ring definition as Epicea requires it (customized for serialization)."

	^ self explicitRequirement
]

{ #category : #'*Epicea-Ring' }
TClass >> epiceaPackageName [
	"Answer my package name for Epicea serialization"

	self flag: #fix.
	^ (RPackage organizer packageOfClassNamed: self name) 
		ifNotNil: [ :package | package name ]
		ifNil: [ 'nil' ]
]
