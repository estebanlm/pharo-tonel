"
I am a strategy for using GZipStream.
"
Class {
	#name : #FLGZipStrategy,
	#superclass : #FLStreamStrategy,
	#instVars : [
		'targetStrategy'
	],
	#category : #FuelTests-StreamStrategies,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZipStrategy class>>newWithTarget: aStreamStrategy [

	^self basicNew
		initializeWith: aStreamStrategy;
		yourself
		
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZipStrategy>>initializeWith: aStreamStrategy [

	self initialize.
	targetStrategy := aStreamStrategy.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZipStrategy>>readStreamDo: aValuable [
	"Evaluates the argument with a read stream. Answers the result."
	
	targetStrategy readStreamDo: [:aStream |
		^ GZipReadStream with: aStream do: aValuable]

]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZipStrategy>>writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."
	
	targetStrategy writeStreamDo: [:aStream |
		^ GZipWriteStream with: aStream do: aValuable]

]
