"
I am an abstract superclass for some visitors that answer objects describing EpEvent instances.
"
Class {
	#name : #EpEntryContentVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:05'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryContentVisitor>>visitEvent: aChange [
	^ self error: 'Should not be reached'.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryContentVisitor>>visitTraitRemoved: aChange [
	^ self visitTraitChange: aChange
]
