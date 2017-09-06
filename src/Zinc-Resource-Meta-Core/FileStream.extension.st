Extension {
	#name : #FileStream
}

{
	#category : #'*zinc-resource-meta-core',
	#timestamp : ' 8/31/2017 07:17:01'
}
FileStream>>asZnUrl [
	"Convert the receiver in a file:// ZnUrl"

	| fileUrl |
	fileUrl := ZnUrl new.
	fileUrl scheme: #file.
	self directory pathSegments do: [ :each | fileUrl addPathSegment: each ].
	fileUrl addPathSegment: self localName.
	^ fileUrl
]
