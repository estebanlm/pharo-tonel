Extension {
	#name : #Collection
}

{
	#category : #'*zinc-resource-meta-core',
	#timestamp : ' 8/31/2017 07:17:01'
}
Collection>>addedToZnUrl: url  [
	^ url withPathSegments: self
]
