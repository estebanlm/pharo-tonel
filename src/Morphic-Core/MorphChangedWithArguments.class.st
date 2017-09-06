"
I am an announcement raised when a Morph changed and need to propagate the information to dependents. In addition, I also propagate a value
"
Class {
	#name : #MorphChangedWithArguments,
	#superclass : #MorphChanged,
	#instVars : [
		'arguments'
	],
	#category : #Morphic-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChangedWithArguments>>arguments [
	^ arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChangedWithArguments>>arguments: anObject [
	arguments := anObject
]

{
	#category : #delivering,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChangedWithArguments>>deliverTo: aHandler [

	^ aHandler update: selector with: arguments

	
]
