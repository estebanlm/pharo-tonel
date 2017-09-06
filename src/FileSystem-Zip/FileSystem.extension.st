Extension {
	#name : #FileSystem
}

{
	#category : #'*filesystem-zip',
	#timestamp : ' 8/31/2017 05:26:12'
}
FileSystem class>>zip: aReference [
	^ self store: (ZipStore reference: aReference)
]
