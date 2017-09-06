Extension {
	#name : #ZnUrl
}

{
	#category : #'*zinc-http',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUrl>>retrieveContents [
	"Download and return the resource that I refer to.
	This will typically return a String or a ByteArray.
	If something goes wrong, an exception will be signalled."
	
	" 'http://zn.stfx.eu/zn/numbers.txt' asZnUrl retrieveContents. "
	
	^ self performOperation: #retrieveContents
]

{
	#category : #'*zinc-http',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUrl>>saveContentsToFile: aFilename [
	"Download and return a fileReference to the resource that I refer to.

	If something goes wrong, an exception will be signalled."
	
	" 'http://zn.stfx.eu/zn/numbers.txt' asZnUrl saveContentsToFile: Path * 'numbers.txt'. "
	
	^ self performOperation: #saveContentsToFile: with: aFilename
]
