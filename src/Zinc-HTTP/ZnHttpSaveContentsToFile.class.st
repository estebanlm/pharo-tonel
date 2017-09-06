"
I am ZnHttpSaveContentsToFile.
I am a ZnUrlOperation.

I implement the #saveContentsToFile: URL operation for HTTP(S) urls, which downloads the url resource to a file.

  'http://zn.stfx.eu/zn/numbers.txt' asZnUrl saveContentsToFile: Path * 'numbers.txt'.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnHttpSaveContentsToFile,
	#superclass : #ZnUrlOperation,
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : 'SvenVanCaekenberghe 6/25/2014 17:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpSaveContentsToFile class>>operation [
	^ #saveContentsToFile:
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpSaveContentsToFile class>>schemes [
	^ #( #http #https )
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpSaveContentsToFile>>performOperation [
	"Download the HTTP(S) resource specified by url to the file in argument.
	Return a file reference on the file that's just been downloaded.
	If something goes wrong, an exception will be signalled."

	ZnClient new
		enforceHttpSuccess: true;
		url: self url;
		downloadTo: argument.
	^ argument asFileReference
]
