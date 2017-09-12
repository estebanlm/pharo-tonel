Extension { #name : #TextEmphasis }

{ #category : #'*Text-Scanning' }
TextEmphasis >> emphasizeScanner: scanner [
	"Set the emphasist for text scanning"
	scanner addEmphasis: emphasisCode
]
