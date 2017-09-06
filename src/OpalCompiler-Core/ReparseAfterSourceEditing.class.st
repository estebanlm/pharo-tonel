"
Notify about the need to reparse after source code was edited
"
Class {
	#name : #ReparseAfterSourceEditing,
	#superclass : #Notification,
	#instVars : [
		'newSource'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'TorstenBergmann 1/31/2014 11:19'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:23'
}
ReparseAfterSourceEditing class>>signalWithNewSource: aSourceCode [

	^ self new
		newSource: aSourceCode;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
ReparseAfterSourceEditing>>newSource [
	
	^ newSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
ReparseAfterSourceEditing>>newSource: anObject [
	
	newSource := anObject
]
