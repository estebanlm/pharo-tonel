"
I represent a global variable.
"
Class {
	#name : #NECGlobalEntry,
	#superclass : #NECEntry,
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECGlobalEntry>>guessTypeWith: anECContext  [
	| globalEntry |
	globalEntry := Smalltalk at: contents ifAbsent: [^ nil].
	globalEntry isBehavior ifTrue: [^ globalEntry].
	globalEntry ifNotNil: [^ globalEntry class].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECGlobalEntry>>label [
	^ 'global'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECGlobalEntry>>type [
	^ #globalVar
]
