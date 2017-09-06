"
I am an atomic item used to execute a portion of code at image startup.
"
Class {
	#name : #StartupAction,
	#superclass : #Object,
	#instVars : [
		'code',
		'hasBeenExecuted',
		'runOnce',
		'nameOfItem',
		'name'
	],
	#category : #StartupPreferences,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction class>>name: nameOfItem code: code [

	^ self new
		code: code;
		name: nameOfItem;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction class>>name: nameOfItem code: code runOnce: aBoolean [

	^ self new
		code: code;
		name: nameOfItem;
		runOnce: aBoolean;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>= anObject [

	anObject class = self class ifFalse: [ ^ false ].
	^ self code = anObject code and: [ self name = anObject name and: [ self runOnce = anObject runOnce ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>code [

	^ code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>code: anObject [
	
	code := anObject
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>execute [

	| block correctlyExecuted |
	(self hasBeenExecuted and: [ self runOnce ]) ifTrue: [ ^ self ].
	block := self code isBlock
				ifTrue: [ self code ]
				ifFalse: [[ self class compiler evaluate: self code ]].
	correctlyExecuted := true. 
	block on: Halt, Error do: [ :ex | 
		StartupPreferencesLoader default errors add: {ex. self}.
		ex pass ].
	self hasBeenExecuted: correctlyExecuted.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>hasBeenExecuted [

	^ hasBeenExecuted ifNil: [ hasBeenExecuted := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>hasBeenExecuted: anObject [
	
	hasBeenExecuted := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>name [

	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>name: anObject [
	
	name := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>printOn: aStream [

	aStream <<'a ' << self class name << '(' << self name << ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>runOnce [

	^ runOnce ifNil: [ runOnce := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>runOnce: anObject [
	
	runOnce := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupAction>>storeOn: aStream [

	aStream << self class name << ' name: '<< self name printString <<' code: ' << code printString.
	self runOnce ifTrue: [ aStream << ' runOnce: true']
]
