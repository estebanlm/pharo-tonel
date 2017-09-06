"
I am ZnHttpRetrieveContents.
I am a ZnUrlOperation.

I implement the #retrieveContents URL operation for HTTP(S) urls.

  'http://zn.stfx.eu/zn/numbers.txt' asZnUrl retrieveContents.

Part of Zinc HTTP Components.

"
Class {
	#name : #ZnHttpRetrieveContents,
	#superclass : #ZnUrlOperation,
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : 'SvenVanCaekenberghe 6/25/2014 17:35'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpRetrieveContents class>>operation [
	^ #retrieveContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpRetrieveContents class>>schemes [
	^ #( #http #https )
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpRetrieveContents>>performOperation [
	"Download and return the HTTP(S) resource that url refers to.
	This will typically return a String or a ByteArray (see ZnClient>>#get:).
	If something goes wrong, an exception will be signalled."

	^ ZnClient new
		beOneShot;
		enforceHttpSuccess: true;
		get: self url
]
