"
I am a meta-object that can be put on any AST node to count execution

To install a watchpoint in a node: 
	ExecutionCounter installOn: aNode
	
Class CounterIconStyler then renders an icon in the editor, mouse over it to see the current counter value.
"
Class {
	#name : #ExecutionCounter,
	#superclass : #Object,
	#instVars : [
		'node',
		'link',
		'count'
	],
	#classVars : [
		'Counters'
	],
	#category : #Reflectivity-Tools-Watchpoints,
	#timestamp : 'md 6/21/2016 11:37'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter class>>allCounters [
	^ Counters ifNil: [ Counters := WeakKeyDictionary new ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter class>>installOn: aRBProgramNode [
	^self new
		node: aRBProgramNode;
		install.
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter class>>removeAll [
	self allCounters values do: [ :aWatchpoint| aWatchpoint uninstall].
	Counters := nil.
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter class>>removeFrom: aNode [

	(self allCounters at: aNode ifAbsent: [ ^self ]) uninstall
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter class>>resetAll [
	self allCounters values do: [ :counter | counter reset ].
	Counters := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>count [
	^ count
]

{
	#category : #counter,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>increase [
	count := count + 1
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>initialize [
	super initialize.
	count := 0.
]

{
	#category : #add/remove,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>install [

	link := MetaLink new 
				metaObject: self;
				selector: #increase.
	node link: link.
	self class allCounters at: node put: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>node [
	^ node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>node: anObject [
	node := anObject
]

{
	#category : #counter,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>reset [
	count := 0
]

{
	#category : #add/remove,
	#timestamp : ' 8/31/2017 05:26:28'
}
ExecutionCounter>>uninstall [
	node hasExecutionCounter ifFalse: [ ^self ].
	link uninstall.
	self class allCounters removeKey: node.
]
