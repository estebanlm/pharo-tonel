"
I'm a model for exposing method information.
I'm an example to be used in FTExampleMethodListDataSource and FTExampleMethodTableDataSource.
"
Class {
	#name : #FTExampleMethodModel,
	#superclass : #Object,
	#instVars : [
		'method',
		'actionIcon'
	],
	#category : #Morphic-Widgets-FastTable-Examples,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel class>>method: aMethod [
	^ self basicNew 
		initializeMethod: aMethod;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel class>>new [
	self error: 'Use #method:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>actionOn: aBrowser [
	^ actionIcon ifNil: [ actionIcon := self createActionIconOn: aBrowser ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>createActionIconOn: aBrowser [
	| actions action |
	actions := AbstractMethodIconAction allSubclasses 
		collect: [ :class | class for: self method in: self ].
	actions sort: [ :a :b | a actionOrder < b actionOrder ].
	action := actions detect: [ :each | each isActionHandled ].
	^ action actionIcon

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>initializeMethod: aMethod [
	self initialize.
	method := aMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>name [
	^ self method selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>origin [
	^ self method origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTExampleMethodModel>>protocol [
	^ self method protocol
]
