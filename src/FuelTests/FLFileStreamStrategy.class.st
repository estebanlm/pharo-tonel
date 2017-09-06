"
I am a strategy for traditional file streams.
"
Class {
	#name : #FLFileStreamStrategy,
	#superclass : #FLStreamStrategy,
	#instVars : [
		'fileStreamClass'
	],
	#category : #FuelTests-StreamStrategies,
	#timestamp : 'MartinDias 10/12/2011 11:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy class>>new [
	self error: 'Invalid creation method.'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy class>>newWith: aFileStream [

	^self basicNew
		initializeWith: aFileStream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy class>>newWithBinaryFileStream [
	^ (FLPlatform current isPharo and: [
		FLPlatform current versionNumber >= 5 ])
			ifTrue: [
				FLBinaryFileStreamStrategy basicNew
					initialize;
					yourself ]
			ifFalse: [ self newWithStandardFileStream ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy class>>newWithMultiByteFileStream [

	^self newWith: MultiByteFileStream
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy class>>newWithStandardFileStream [

	^self newWith: StandardFileStream
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>fileName [
	"Answer a filename to serialize and materialize using it."

	^ FLPlatform current absolutePathOf: (FLPlatform current imageName, '-tests.fuel')
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>fileStreamClass [
	"Returns the FileStream specific class"
	
	^fileStreamClass
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>initializeWith: aFileStreamClass [

	self initialize.	
	fileStreamClass := aFileStreamClass.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>readStreamDo: aValuable [
	"Evaluates the argument with a read stream. Answers the result."
	
	^self fileStreamClass
		oldFileNamed: self fileName
		do: [ :aStream | aValuable value: aStream binary ]
]

{
	#category : #'test support',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>tearDown [
	(File named: self fileName) delete
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLFileStreamStrategy>>writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."

	^self fileStreamClass
		forceNewFileNamed: self fileName 
		do: [ :aStream | aValuable value: aStream binary ]
]
