"
This is a utility that: 
- executes a job asynchroniously
- it remembers the process so that it can terminate the job, if needed
- triggers a callback when it's done
"
Class {
	#name : #GLMAsyncTask,
	#superclass : #Object,
	#instVars : [
		'process',
		'callback',
		'delay',
		'task',
		'priority',
		'arguments'
	],
	#category : #Glamour-Morphic-Brick-Async,
	#timestamp : 'TudorGirba 11/26/2014 15:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>arguments [

	^ arguments ifNil: [ arguments := {  } ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>arguments: aCollection [

	arguments := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>callback [

	^ callback ifNil: [ callback := [  ] ]
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>complete: anObject callback: aBlock [
	
	process ifNil: [ ^ self terminate ].
	process isTerminated ifFalse: [ "for some cases when we try to return result of wrong process" ^ self ].
	
	callback = aBlock ifFalse: [ ^ self terminate ].
	
	callback ifNotNil: [ callback cull: anObject ].
	process := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>delay [

	^ delay ifNil: [ delay := 0 ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>delay: anInteger [

	delay := anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>doInBackground: aBlock [

	task := aBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute [

	^ self execute: self arguments
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute: anArguments [

	^ self
		execute: self task
		withArguments: anArguments
		callback: self callback
		priority: self priority
		delay: self delay
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute: aBlock withArguments: aCollection callback: callbackBlock [
	"execution happens with UI process priority so that communication with UI can be done in real time"
	
	^ self
		execute: aBlock
		withArguments: aCollection
		callback: callbackBlock
		priority: Processor userSchedulingPriority
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute: aBlock withArguments: aCollection callback: callbackBlock delay: anIntegerMilliseconds [
	"execution happens with UI process priority so that communication with UI can be done in real time"
	
	^ self
		execute: aBlock
		withArguments: aCollection
		callback: callbackBlock
		priority: Processor userSchedulingPriority
		delay: anIntegerMilliseconds
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute: aBlock withArguments: aCollection callback: callbackBlock priority: aPriority [
		
	^ self
		execute: aBlock
		withArguments: aCollection
		callback: callbackBlock
		priority: aPriority
		delay: 0
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>execute: aBlock withArguments: aCollection callback: callbackBlock priority: aPriority delay: anIntegerMilliseconds [
	
	self terminate.
	
	callback := callbackBlock.
	process := [ |result|
		anIntegerMilliseconds > 0 ifTrue: [ anIntegerMilliseconds milliSeconds wait ].
		result := aBlock valueWithEnoughArguments: aCollection.
		"we use it to pass result from background thread and execute callback block in UI thread"
		UIManager default defer: [ self complete: result callback: callbackBlock ]
	]	newProcess.
	
	process priority: aPriority.
	process resume.
		
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>isTerminated [

	process ifNil: [ ^ true ].
	^ process isTerminated
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>onCompleted: aBlock [

	callback := aBlock
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>pause [

	process ifNotNil: [ process suspend ]
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>perform: aBlock delay: anInteger [

	self
		execute: []
		withArguments: {}
		callback: aBlock
		delay: anInteger
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>perform: aBlock delay: anInteger priority: aPriority [

	self
		execute: []
		withArguments: {}
		callback: aBlock
		priority: aPriority
		delay: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>priority [

	^ priority ifNil: [ priority := Processor userSchedulingPriority ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>priority: anInteger [

	priority := anInteger
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>resume [

	process ifNotNil: [ process resume ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>task [

	^ task ifNil: [ task := [  ] ]
]

{
	#category : #async,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAsyncTask>>terminate [

	process ifNotNil: [ process terminate. process := nil ]
]
