"
Specific to BinaryFileStream
"
Class {
	#name : #FLBinaryFileStreamStrategy,
	#superclass : #FLFileStreamStrategy,
	#category : #FuelTests-StreamStrategies,
	#timestamp : 'MaxLeske 4/30/2016 10:50'
}

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBinaryFileStreamStrategy>>readStreamDo: aValuable [
	"Evaluates the argument with a read stream. Answers the result."
	
	^ ((Smalltalk globals at: #File) named: self fileName) readStreamDo: [ :aStream |
		aValuable value: aStream binary ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBinaryFileStreamStrategy>>writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."

	^ ((Smalltalk globals at: #File) named: self fileName)writeStreamDo: [ :aStream | 
		aValuable value: aStream binary ]
]
