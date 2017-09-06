"
I am a strategy that help tests for writing (and then reading) on streams.
"
Class {
	#name : #FLStreamStrategy,
	#superclass : #Object,
	#category : #FuelTests-StreamStrategies,
	#timestamp : 'MartinDias 10/12/2011 11:36'
}

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLStreamStrategy>>fuelAccept: aGeneralMapper [
	"Visit myself as a substitution. See #fuelSubstitution."

	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLStreamStrategy>>readStreamDo: aValuable [
	"Evaluates the argument with a read stream. Answer the result."
	
	self subclassResponsibility 
]

{
	#category : #'test support',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLStreamStrategy>>tearDown [

]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLStreamStrategy>>writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answer the result."
	
	self subclassResponsibility 
]
