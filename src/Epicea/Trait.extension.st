Extension { #name : #Trait }

{ #category : #'*Epicea-Ring' }
Trait >> asEpiceaRingDefinition [

	^ self asRingDefinition
		package: self epiceaPackageName;
		yourself.
]

{ #category : #'*Epicea-Ring' }
Trait >> epiceaPackageName [
	"Answer my package name for Epicea serialization"

	self flag: #fix.
	^ (RPackage organizer packageOfClassNamed: self name) 
		ifNotNil: [ :package | package name ]
		ifNil: [ 'nil' ]
]
