"
I represent super.
"
Class {
	#name : #NECSuperEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECSuperEntry>>guessTypeWith: anECContext  [
	^ anECContext theClass ifNotNil: [anECContext theClass superclass]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECSuperEntry>>label [
	^ 'super'
]
