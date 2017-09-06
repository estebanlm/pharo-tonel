"
I am an error raised when extending a class with an incompatible layout.
"
Class {
	#name : #IncompatibleLayoutConflict,
	#superclass : #ClassBuilderError,
	#instVars : [
		'layout',
		'subType'
	],
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IncompatibleLayoutConflict>>layout [
	^ layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IncompatibleLayoutConflict>>layout: anObject [
	layout := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IncompatibleLayoutConflict>>messageText [
	^ 'Class with ', layout class name, ' cannot be extended as ', subType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IncompatibleLayoutConflict>>subType [
	^ subType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IncompatibleLayoutConflict>>subType: anObject [
	subType := anObject
]
