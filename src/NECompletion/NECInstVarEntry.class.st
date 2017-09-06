"
I represent an instance variable.
"
Class {
	#name : #NECInstVarEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECInstVarEntry>>guessTypeWith: anECContext  [
	^ anECContext guessInstVarClass: contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECInstVarEntry>>isInstance [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECInstVarEntry>>label [
	^ 'instance variable'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECInstVarEntry>>type [
	^ #instVar
]
