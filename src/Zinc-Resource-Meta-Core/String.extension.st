Extension { #name : #String }

{ #category : #'*zinc-resource-meta-core' }
String >> addedToZnUrl: url [
	| segments |
	segments := self findTokens: '/'.
	^ url withPathSegments: segments
]

{ #category : #'*zinc-resource-meta-core' }
String >> asZnMimeType [
	^ ZnMimeType fromString: self
]

{ #category : #'*zinc-resource-meta-core' }
String >> asZnUrl [
	^ ZnUrl fromString: self
]
