"
I am default execution environment which used when nothing special is installed on process.

I am singleton:
	DefaultExecutionEnvironment instance
	
Tools which define specific environments could add polymorphic behaviour to me
"
Class {
	#name : #DefaultExecutionEnvironment,
	#superclass : #ExecutionEnvironment,
	#classInstVars : [
		'instance'
	],
	#category : #Kernel-Processes,
	#timestamp : 'DenisKudryashov 8/29/2016 15:57'
}

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
DefaultExecutionEnvironment class>>beActive [

	CurrentExecutionEnvironment restoreDefault 
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
DefaultExecutionEnvironment class>>beActiveDuring: aBlock [

	^self instance beActiveDuring: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DefaultExecutionEnvironment class>>instance [
	^instance ifNil: [ instance := self new ]
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
DefaultExecutionEnvironment>>prepareForNewProcess: aProcess [

]
