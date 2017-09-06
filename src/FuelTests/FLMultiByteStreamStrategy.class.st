"
I am a strategy for MultiByteBinaryOrTextStream..
"
Class {
	#name : #FLMultiByteStreamStrategy,
	#superclass : #FLStreamStrategy,
	#instVars : [
		'inMemoryStream'
	],
	#category : #FuelTests-StreamStrategies,
	#timestamp : 'MartinDias 10/12/2011 11:37'
}

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLMultiByteStreamStrategy>>readStreamDo: aValuable [
	"Evaluates the argument with a read stream. Answers the result."
	
	^aValuable value: inMemoryStream reset
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLMultiByteStreamStrategy>>writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."

	inMemoryStream := MultiByteBinaryOrTextStream on: ''.
	^aValuable value: inMemoryStream binary

]
