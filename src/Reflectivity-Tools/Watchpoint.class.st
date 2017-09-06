"
A wathchpoint save the change of values of expressions. 
I save them as an oredered collection of  key val association where the key is the timestamp an val is the actual value of the expression.

To install a watchpoint in a node: 
Watchpoint in: aNode
"
Class {
	#name : #Watchpoint,
	#superclass : #Object,
	#instVars : [
		'tagname',
		'node',
		'link',
		'values',
		'recording'
	],
	#classVars : [
		'Watchpoints'
	],
	#category : #Reflectivity-Tools-Watchpoints,
	#timestamp : 'mcamp 11/20/2015 11:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>allWatchpoints [
	^ Watchpoints ifNil: [ Watchpoints := WeakKeyDictionary new ]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>deleteAllHistory [

	self allWatchpoints valuesDo: [ :aWatchpoint| aWatchpoint deleteHistory].
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>deleteHistoryFrom: aNode [

	(self allWatchpoints at: aNode ifAbsent:[^self]) deleteHistory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>from: aNode [
	^self allWatchpoints at: aNode.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>from: aNode ifAbsent: aBlock [
	^self allWatchpoints at: aNode ifAbsent: aBlock.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>in: aRBProgramNode [
	^self in: aRBProgramNode named: ''.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>in: aRBProgramNode named: aName [
	aRBProgramNode hasWatchpoint ifTrue: [ ^ aRBProgramNode watchpoint ].
	^self new 
		node: aRBProgramNode;
		tagname: aName;
		install.
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>removeAll [
	self allWatchpoints values do: [ :aWatchpoint| aWatchpoint uninstall].
	Watchpoints := nil.
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint class>>removeFrom: aNode [

	(self allWatchpoints at: aNode ifAbsent: [ ^self ]) uninstall
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>addValue: anObject [
	values add: 
		(DateAndTime now -> anObject).
	^anObject.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>compiledMethod  [
	^self node methodNode method
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>deleteHistory [
	values := OrderedCollection new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>initialize [
	super initialize.
	values := OrderedCollection new.
	recording := true.
]

{
	#category : #install,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>install [

	node hasWatchpoint ifTrue: [ self error: 'Node already has a watchpoint'].
	
	link := MetaLink new 
				metaObject: self;
				selector: #addValue:;
				arguments: #(value);
				control: #after;
				condition: [ recording ];
				option: #(+ optionWeakAfter).
	node link: link.
	self class allWatchpoints at: node put: self.
]

{
	#category : #recording,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>isRecording [
	^recording
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>node [
	^ node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>node: anObject [
	node := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>printLastValue [
	values ifNil: [ ^''].
	values ifEmpty: [ ^'not run' ].
	^values last value printStringLimitedTo: 5.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>printOn: aStream [
	aStream nextPutAll: 'WP'.
	tagname isAllSeparators 
		ifFalse: [ 
			aStream nextPutAll: ' '.
			aStream nextPutAll: tagname ]. 
	aStream nextPutAll: ': '.
	aStream nextPutAll: (self printLastValue).
]

{
	#category : #recording,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>start [
	recording := true.
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged new link: link)
]

{
	#category : #recording,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>stop [
	recording := false.
	SystemAnnouncer uniqueInstance announce: (MetalinkChanged new link: link)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>tagname [
	^ tagname
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>tagname: anObject [
	tagname := anObject
]

{
	#category : #install,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>uninstall [
	node hasWatchpoint ifFalse: [ ^self ].
	link uninstall.
	self class allWatchpoints removeKey: node.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
Watchpoint>>values [
	^values.
]
