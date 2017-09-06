Extension {
	#name : #String
}

{
	#category : #'*zinc-resource-meta-core',
	#timestamp : ' 8/31/2017 07:17:01'
}
String>>addedToZnUrl: url [
	| segments |
	segments := self findTokens: '/'.
	^ url withPathSegments: segments
]

{
	#category : #'*zinc-resource-meta-core',
	#timestamp : ' 8/31/2017 07:17:01'
}
String>>asZnMimeType [
	^ ZnMimeType fromString: self
]

{
	#category : #'*zinc-resource-meta-core',
	#timestamp : ' 8/31/2017 07:17:01'
}
String>>asZnUrl [
	^ ZnUrl fromString: self
]
