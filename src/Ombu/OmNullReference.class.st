"
I represent the no-reference. I implement the null object design pattern.
"
Class {
	#name : #OmNullReference,
	#superclass : #OmAbstractReference,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Ombu-Entries,
	#timestamp : 'MartinDias 4/14/2014 23:28'
}

{
	#category : #'ston persistence',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference class>>fromSton: stonReader [

	stonReader parseListDo: [ :each :index | "nothing to read" ].

	^ self uniqueInstance
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference>>isNull [
	^ true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference>>printOn: aStream [
	aStream 
		nextPutAll: 'null:reference'
]

{
	#category : #'ston persistence',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference>>stonContainSubObjects  [
	^ false
]

{
	#category : #'ston persistence',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullReference>>stonOn: stonWriter [

	stonWriter 
		writeObject: self 
		streamShortList: [ :writer |  ]
]
