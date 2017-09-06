Extension {
	#name : #AbsolutePath
}

{
	#category : #'*zinc-resource-meta-filesystem',
	#timestamp : ' 8/31/2017 05:26:47'
}
AbsolutePath>>asZnUrl [
	"Convert the receiver in a file:// ZnUrl"

	| fileUrl |
	fileUrl := ZnUrl new.
	fileUrl scheme: #file.
	self do: [ :each | fileUrl addPathSegment: each ].
	^ fileUrl
]
