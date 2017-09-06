Extension {
	#name : #HashedCollection
}

{
	#category : #'*Monticello-Storing',
	#timestamp : ' 8/31/2017 07:17:01'
}
HashedCollection>>comeFullyUpOnReload: smartRefStream [
	"Symbols have new hashes in this image."

	self  compact.
	"^ self"

]
