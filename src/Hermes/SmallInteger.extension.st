Extension { #name : #SmallInteger }

{ #category : #'*Hermes' }
SmallInteger >> asExportedLiteral [
	^ HESmallInteger for: self.
]
