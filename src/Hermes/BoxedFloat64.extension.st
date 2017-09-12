Extension { #name : #BoxedFloat64 }

{ #category : #'*Hermes' }
BoxedFloat64 >> asExportedLiteral [
	^ HEBoxedFloat64 for: self
]
