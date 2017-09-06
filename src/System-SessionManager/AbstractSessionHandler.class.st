"
API  to manage startup and shutdown of a session.
On startup, isImageStarting indicates wheter the image is starting or just resuming from a save.
On shutdown, isQuitting indicates if we save and quit the image  or if we just save  the image.  
"
Class {
	#name : #AbstractSessionHandler,
	#superclass : #Object,
	#category : #System-SessionManager,
	#timestamp : 'ChristopheDemarey 10/2/2015 11:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:58'
}
AbstractSessionHandler>>handledId [
	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:58'
}
AbstractSessionHandler>>printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $(;
		nextPutAll: self handledId;
		nextPut: $)
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
AbstractSessionHandler>>shutdown: isImageQuitting [
	self subclassResponsibility
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
AbstractSessionHandler>>startup: isImageStarting [
	self subclassResponsibility
]
