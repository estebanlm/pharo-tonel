Extension {
	#name : #Set
}

{
	#category : #'*Monticello-Storing',
	#timestamp : ' 8/31/2017 07:17:01'
}
Set>>comeFullyUpOnReload: smartRefStream [
	"Symbols have new hashes in this image."

	self rehash.
	"^ self"

]
