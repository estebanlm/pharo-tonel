Extension {
	#name : #CollectionValueHolder
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
CollectionValueHolder>>addAnnouncementFirst: ann [

	^ self addFirst: (DateAndTime now -> ann)
]
