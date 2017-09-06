Extension {
	#name : #Behavior
}

{
	#category : #'*Collections-Abstract',
	#timestamp : ' 8/31/2017 07:16:43'
}
Behavior class>>sortBlock [
	^ [ :a :b | a name <= b name ]
]
