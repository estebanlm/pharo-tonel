"
I announce that a MCVersion was saved into a MCRepository.
"
Class {
	#name : #MCVersionSaved,
	#superclass : #Announcement,
	#instVars : [
		'version',
		'repository'
	],
	#category : #Monticello-Announcements,
	#timestamp : 'MartinDias 6/10/2015 19:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved class>>version: aMCVersion repository: aMCRepository [

	^ self basicNew
		initializeWithVersion: aMCVersion
		repository: aMCRepository;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>= another [

	^ (self class = another class
		and: [ self version = another version ])
		and: [ self repository = another repository ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>hash [

	^ (self class hash
		bitXor: self version hash)
		bitXor: self repository hash
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>initializeWithVersion: aMCVersion repository: aMCRepository [

	self initialize.
	
	version := aMCVersion.
	repository := aMCRepository.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>printOn: aStream [

	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: version info name;
		nextPut: $@;
		nextPutAll: repository description;
		nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>repository [

	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionSaved>>version [

	^ version
]
