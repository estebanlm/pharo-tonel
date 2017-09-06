Extension {
	#name : #AbstractFileReference
}

{
	#category : #'*zinc-resource-meta-filesystem',
	#timestamp : ' 8/31/2017 05:26:47'
}
AbstractFileReference>>asZnUrl [
	"Convert the receiver in a file:// ZnUrl.
	Only an absolute path can be represented as a file:// URL"
	
	^ self asAbsolute path asZnUrl
]
