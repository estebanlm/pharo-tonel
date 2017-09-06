"
A GLMBrickListAdaptor is scriptable implementation of adaptor that is mostly used with list scroll brick

Instance Variables
	countLogic:		<Object>
	morphLogic:		<Object>
	origin:		<Object>

countLogic
	- xxxxx

morphLogic
	- xxxxx

origin
	- xxxxx

"
Class {
	#name : #GLMBrickListModel,
	#superclass : #GLMBrickAbstractModel,
	#instVars : [
		'origin',
		'countLogic',
		'morphLogic'
	],
	#category : #Glamour-Morphic-Brick-Model,
	#timestamp : 'AliakseiSyrel 12/6/2014 20:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel class>>on: anObject [

	^ self new on: anObject
]

{
	#category : #'adaptor api',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>count [

	^ countLogic
		ifNil: [ origin size ]
		ifNotNil: [ countLogic cull: origin ] 
]

{
	#category : #'adaptor api',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>morphAt: anInteger convert: aMorph [

	^ morphLogic
		ifNil: [ (origin at: anInteger) asMorph ]
		ifNotNil: [
			morphLogic isSymbol
				ifTrue: [ origin perform: morphLogic withEnoughArguments: { anInteger . aMorph }  ]
				ifFalse: [ morphLogic cull: anInteger cull: aMorph ] ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>morphAtLogic: aBlockWithTwoParameters [

	morphLogic := aBlockWithTwoParameters
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>on: anObject [

	origin := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>origin [

	^ origin
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickListModel>>sizeLogic: aBlockWithNoParameters [

	countLogic := aBlockWithNoParameters
]
