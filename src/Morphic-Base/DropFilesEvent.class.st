"
This event is sent when an external file is dropped into the image itself.

The event can be used by any Morph implementing:

#wantsDropFiles: anEvent 
#dropFiles: anEvent 




"
Class {
	#name : #DropFilesEvent,
	#superclass : #DropEvent,
	#category : #Morphic-Base-Events,
	#timestamp : 'HenrikNergaard 11/24/2015 18:07'
}

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:13'
}
DropFilesEvent>>sentTo: anObject [
	"Dispatch the receiver into anObject"
	^anObject handleDropFiles: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
DropFilesEvent>>type [
	^#dropFilesEvent
]
