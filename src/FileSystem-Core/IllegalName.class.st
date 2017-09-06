"
I am raised on an attempt to use an illegal file name

"
Class {
	#name : #IllegalName,
	#superclass : #FileSystemError,
	#instVars : [
		'name'
	],
	#category : #FileSystem-Core-Kernel,
	#timestamp : 'TorstenBergmann 1/31/2014 11:34'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
IllegalName class>>name: aName [
	^ self basicNew initializeWithName: aName
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
IllegalName class>>signalWith: aName [
	^ (self name: aName) signal
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
IllegalName>>initializeWithName: aName [
	name := aName.
	self messageText: aName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
IllegalName>>name [
	^ name
]
