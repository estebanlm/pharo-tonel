"
I'm a glamour column for fast tables.
"
Class {
	#name : #GLMFastTableColumn,
	#superclass : #FTColumn,
	#instVars : [
		'glamourColumn',
		'target',
		'selector',
		'arguments'
	],
	#category : #Glamour-FastTable-Model,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTableColumn>>execute  [
	target ifNil: [ ^ self ].
	selector ifNil: [ ^ self ].
	
	target perform: selector withArguments: arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTableColumn>>glamourColumn [
	^ glamourColumn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTableColumn>>glamourColumn: anObject [
	glamourColumn := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTableColumn>>target: aTarget actionSelector: aSelector arguments: aCollection  [
	target := aTarget. 
	selector := aSelector.
	arguments := aCollection
]
