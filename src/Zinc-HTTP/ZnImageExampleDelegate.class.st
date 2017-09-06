"
I am ZnImageExampleDelegate.
I am a implementation of the web app in 'Building and deploying your first web app in Pharo'.

I serve an image that web clients can change by uploading a new one.

  ZnServer startDefaultOn: 1701.
  ZnImageExampleDelegate installInDefaultServer.
  ZnServer stopDefault.

I implement the following API or resources

	GET /image - returns an HTML page showing our image and a form to upload a new image
	GET /image?raw=true - directly serves the last uploaded image
	POST /image - handler accepting a multipart form data entity with a file part containing GIF, JPEG or PNG bytes
	
Part of Zinc HTTP Components.
"
Class {
	#name : #ZnImageExampleDelegate,
	#superclass : #Object,
	#instVars : [
		'image'
	],
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : '<historical>'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate class>>installInDefaultServer [
	"Assuming the default server has the default delegate, 
	install ourself under /image"
	
	ZnServer default delegate 
		map: 'image' to: self new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>downloadPharoLogo [
	^ ZnClient new beOneShot
		get: 'http://pharo.org/files/pharo.png';
		entity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>form [
	^ self formForImageEntity: self image
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>formForImageEntity: imageEntity [
	"Parse the actual bytes of imageEntity and return a Form."
	
	| imageType parserClassName parserClass parser |
	imageType := imageEntity contentType sub.
	parserClassName := imageType asUppercase, #ReadWriter.
	parserClass := Smalltalk globals at: parserClassName asSymbol.
	parser := parserClass on: imageEntity readStream.
	^ parser nextImage
	
]

{
	#category : #'request handling',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>handleGetRequest: request [
	"GET /image - Serve an HTML page showing our image and a form to upload a new one.
	GET /image?raw=true - Serve the last image directly"
	
	^ (request uri queryAt: #raw ifAbsent: [ nil ])
		ifNil: [ 
			ZnResponse ok: (ZnEntity html: self html) ]
		ifNotNil: [ 
			ZnResponse ok: self image ]
]

{
	#category : #'request handling',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>handlePostRequest: request [
	"POST /image <multipart form data with file part> - change the image and show the result.
	Do full error checking before accepting the newly uploaded image"
	
	| part newImage badRequest |
	badRequest := [ ^ ZnResponse badRequest: request ].
	(request hasEntity and: [ request contentType matches: ZnMimeType multiPartFormData ])
		ifFalse: badRequest.
	part := request entity 
		partNamed: #file 
		ifNone: badRequest.
	newImage := part entity.
	(newImage notNil and: [ newImage contentType matches: 'image/*' asZnMimeType ])
		ifFalse: badRequest.
	[ self formForImageEntity: newImage ] on: Error do: badRequest.
	image := newImage.
	^ ZnResponse redirect: #image
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>handleRequest: request [
	"Dispatch between GET and POST on /image"
	
	request uri path = #image
		ifTrue: [ 
			request method = #GET
				ifTrue: [ 
					^ self handleGetRequest: request ].
			request method = #POST
				ifTrue: [ 
					^ self handlePostRequest: request ] ].
	^ ZnResponse notFound: request uri
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>html [
	^ ZnHtmlOutputStream streamContents: [ :html |
		 html page: 'Image' do: [
			html 
				tag: #src attributes: #(src 'image?raw=true');
				tag: #br;
				tag: #form attributes: #(enctype 'multipart/form-data' action image method POST) do: [
					html
						tag: #h3 with: 'Change the image:';
						tag: #input attributes: #(type file name file);
						tag: #input attributes: #(type submit value Upload) ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>image [
	"Return the current image entity.
	Use a default when not yet set."
	
	^ image ifNil: [ image := self downloadPharoLogo ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnImageExampleDelegate>>value: request [
	"I implement the generic #value: message as equivalent to #handleRequest:"
	
	^ self handleRequest: request
]
