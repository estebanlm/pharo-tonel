"
This is a strategy that populates a portSymbol with the result of evaluating valueBlock.
"
Class {
	#name : #GLMPortUpdater,
	#superclass : #Object,
	#instVars : [
		'portSymbol',
		'valueBlock'
	],
	#category : #Glamour-Helpers,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortUpdater>>glamourValueWithArgs: anArray  [
	 
	(anArray first pane port: self portSymbol) 
		value: (self valueBlock glamourValueWithArgs: anArray)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortUpdater>>portSymbol  [
	 
	^portSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortUpdater>>portSymbol: anObject  [
	 
	portSymbol := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortUpdater>>valueBlock  [
	 
	^valueBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortUpdater>>valueBlock: anObject  [
	 
	valueBlock := anObject
]
