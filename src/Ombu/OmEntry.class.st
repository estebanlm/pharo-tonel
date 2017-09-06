"
I am a container for recording objects into a store. I also have tags for custom meta-information.
"
Class {
	#name : #OmEntry,
	#superclass : #Object,
	#instVars : [
		'tags',
		'content'
	],
	#category : #Ombu-Entries,
	#timestamp : 'MartinDias 4/14/2014 23:26'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry class>>content: anObject [
	^ self basicNew 
		initializeWithContent: anObject;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>= other [
	^ other species = self species and: [ 
		other content = self content ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>content [
	^ content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>content: anObject  [
	content := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>hash [
	^ self species hash bitXor: self content hash
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>initializeWithContent: anObject [
	self initialize.
	content := anObject.
	tags := Dictionary new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>isEmpty [
	^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	content printOn: aStream.
	aStream nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>tagAt: aKey [

	^ self tags at: aKey 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntry>>tags [
	^ tags
]
