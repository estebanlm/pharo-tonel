"
I am signaled when trying to build a class with a duplicated slot.
"
Class {
	#name : #DuplicatedSlotName,
	#superclass : #ClassBuilderWarning,
	#instVars : [
		'newSlot',
		'oldSlot',
		'host'
	],
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>host [
	^ host
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>host: anObject [
	host := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>messageText [
	^ 'Slot #''', oldSlot name, ''' appeared twice in ', host name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>newSlot [
	^ newSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>newSlot: anObject [
	newSlot := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>oldSlot [
	^ oldSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
DuplicatedSlotName>>oldSlot: anObject [
	oldSlot := anObject
]
