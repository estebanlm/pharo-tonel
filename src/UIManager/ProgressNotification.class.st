"
Used to signal progress without requiring a specific receiver to notify. Caller/callee convention could be to simply count the number of signals caught or to pass more substantive information with #signal:.
"
Class {
	#name : #ProgressNotification,
	#superclass : #Notification,
	#instVars : [
		'amount',
		'done',
		'extra'
	],
	#category : #UIManager-Support,
	#timestamp : '<historical>'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification class>>signal: signalerText extra: extraParam [
	"TFEI - Signal the occurrence of an exceptional condition with a specified textual description."

	| ex |
	ex := self new.
	ex extraParam: extraParam.
	^ex signal: signalerText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>amount [
	^amount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>amount: aNumber [
	amount := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>done [
	^done
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>done: aNumber [
	done := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>extraParam [
	^extra
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
ProgressNotification>>extraParam: anObject [
	extra := anObject
]
