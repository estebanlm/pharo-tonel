"
I represent self
"
Class {
	#name : #NECSelfEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECSelfEntry>>guessTypeWith: anECContext  [
	^ anECContext theClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECSelfEntry>>label [
	^ 'self'
]
