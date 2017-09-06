"

"
Class {
	#name : #MetacelloScriptProjectSpecNotification,
	#superclass : #MetacelloScriptNotification,
	#instVars : [
		'projectSpec'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception description',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptProjectSpecNotification>>defaultAction [
    "Result of signal should be the projectSpec to be used to perform the load"

    ^ self projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptProjectSpecNotification>>projectSpec [
    ^ projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptProjectSpecNotification>>projectSpec: anObject [
    projectSpec := anObject
]
