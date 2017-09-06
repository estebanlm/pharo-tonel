"
I am BenchmarkResult. 

I know how much iterations where executed in a specific elapsed time duration.

I am the result of running the same piece of code multiple times.

I can compute my average #frequencey (#executionsPerSecond) and #period (#timePerExecution).

I have a human friendly print representation.

BenchmarkResult new
	iterations: 20000;
	elapsedTime: 10 seconds;
	yourself.

"
Class {
	#name : #BenchmarkResult,
	#superclass : #Object,
	#instVars : [
		'iterations',
		'elapsedTime'
	],
	#category : #Kernel-Chronology,
	#timestamp : 'SvenVanCaekenberghe 2/18/2015 17:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>elapsedTime [
	"Return the duration of the total execution time"
	
	^ elapsedTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>elapsedTime: duration [
	"Set the duration of the total execution time"
	
	elapsedTime := duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>executionsPerSecond [
	"Return the average number of executions per second"

	^ self frequency
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>frequency [
	"Return the average number of executions per second"
	
	^ iterations / elapsedTime totalSeconds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>isEmpty [
	iterations isNil | elapsedTime isNil 
		ifTrue: [ ^ true ].
	iterations isZero | elapsedTime isZero 
		ifTrue: [ ^ true ].
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>iterations [
	"Return the number of iterations that were executed"
	
	^ iterations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>iterations: integer [
	"Set the number of iterations that were executed"

	iterations := integer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>period [
	"Return the average duration of one iteration"
	
	^ elapsedTime / iterations
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>printFrequenceOn: stream [
	self frequency > 999
		ifTrue: [ self frequency rounded printWithCommasOn: stream ]
		ifFalse: [ self frequency printOn: stream showingDecimalPlaces: 3 ].
	stream << ' per second'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	self isEmpty
		ifTrue: [ 
			stream << ' empty' ]
		ifFalse: [ 
			iterations printWithCommasOn: stream.
			stream space; << ('iteration' asPluralBasedOn: iterations).
			stream << ' in '.
			elapsedTime printHumanReadableOn: stream.
			stream << '. '.
			self printFrequenceOn: stream ].
	stream nextPut: $)
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>shortPrintString [
	self isEmpty
		ifTrue: [ ^ self printString ].
	^ String streamContents: [ :out | self printFrequenceOn: out ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BenchmarkResult>>timePerExecution [
	"Return the average duration of one iteration"

	^ self period
]
