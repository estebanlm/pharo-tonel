"
I am a window used by WindowSpec.

I have been introduced since it's currently the best solution to prevent to add dozen of respondsTo: in StandardWindow or add dirty extensions to Object (because all models are not subclasses of Model)
"
Class {
	#name : #SpecWindow,
	#superclass : #StandardWindow,
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWindow>>aboutText [

	^ self model aboutText
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWindow>>close [

	self model askOkToClose
		ifTrue: [ self okToChange ifFalse: [ ^ self ] ].
		
	super close
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWindow>>okToChange [

	^ self model okToChange
]
