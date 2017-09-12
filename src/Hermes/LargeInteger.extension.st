Extension { #name : #LargeInteger }

{ #category : #'*Hermes' }
LargeInteger >> asExportedLiteral [
	^ HELargeInteger for: self
]
