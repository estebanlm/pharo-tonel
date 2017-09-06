"
I am an abstract class that represents a system event.
"
Class {
	#name : #EpEvent,
	#superclass : #Object,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:37'
}

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent class>>handlesAnnouncement: anAnnouncement [
	"The receiver acts as a filter to determine whether subscribers who used the receiver as signaling tag (event identifier class or symbol) should receive incoming announcement. In particular, registering to a superclass will receive the announcements from all subclasses."

	^ anAnnouncement class == self or: [ anAnnouncement class inheritsFrom: self ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>accept: aVisitor [

	self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isCodeChange [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpBehaviorChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpCategoryChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpClassChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpEvent [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpLogEntriesComment [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpMethodChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpProtocolChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpRefactoring [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpTestResultSet [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isEpTraitChange [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isMonticelloVersionSave [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEvent>>isMonticelloVersionsLoad [

	^ false
]
