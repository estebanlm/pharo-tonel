"
I am rendering ExecutionCounters in the editor.
"
Class {
	#name : #CounterIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Watchpoints,
	#timestamp : 'MarcusDenker 6/21/2016 15:18'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
CounterIconStyler>>iconBlock: aNode [
	^[ :seg | ExecutionCounter removeFrom: aNode. seg delete]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
CounterIconStyler>>iconFor: aNode [
	^ self iconNamed: #classIcon 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
CounterIconStyler>>iconLabelBlock: aNode [

	^ [aNode counter count asString]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
CounterIconStyler>>shouldStyleNode: aNode [
	^aNode hasExecutionCounter
]
