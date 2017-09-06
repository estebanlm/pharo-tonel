"
**MetacelloLoadProjectSpecVersionNotification** is signalled to indicate that the given project spec was loaded into the image.
"
Class {
	#name : #MetacelloProjectSpecLoadedNotification,
	#superclass : #MetacelloScriptProjectSpecNotification,
	#category : #Metacello-Core-Scripts,
	#timestamp : 'dkh 6/1/2012 09:32'
}

{
	#category : #'exception description',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadedNotification>>defaultAction [
    ^ nil
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloProjectSpecLoadedNotification>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleProjectSpecLoaded: self
]
