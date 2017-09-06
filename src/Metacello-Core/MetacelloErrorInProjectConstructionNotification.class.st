"

"
Class {
	#name : #MetacelloErrorInProjectConstructionNotification,
	#superclass : #Notification,
	#instVars : [
		'versionString',
		'exception'
	],
	#category : #Metacello-Core-Exceptions-Notifications,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification class>>versionString: aString exception: anException [
    ^ self new
        versionString: aString;
        exception: anException;
        signal
]

{
	#category : #'exception description',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification>>defaultAction [
    "Answer false if you want the version recorded in the errorMap.
	Answer true if you want to go ahead and throw the error"

    ^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification>>exception [
	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification>>exception: anObject [
	exception := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification>>versionString [
	^ versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloErrorInProjectConstructionNotification>>versionString: anObject [
	versionString := anObject
]
