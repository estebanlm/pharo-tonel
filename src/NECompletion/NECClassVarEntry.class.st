"
I represent a class Variable
"
Class {
	#name : #NECClassVarEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarEntry>>guessTypeWith: anECContext  [
	^ anECContext guessClassVarClass: contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarEntry>>label [
	^ 'class variable'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECClassVarEntry>>type [
	^ #classVar
]
