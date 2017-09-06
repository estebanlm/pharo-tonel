"
I represent a local variable
"
Class {
	#name : #NECLocalEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECLocalEntry>>guessTypeWith: anECContext  [
	^ (anECContext guessTempVarClass: contents type: self type) 
		ifNil: [anECContext guessArgument: contents]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECLocalEntry>>isLocal [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECLocalEntry>>label [
	^ 'local variable'
]
