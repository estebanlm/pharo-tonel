"
A GLMBrickAbstractAdaptor is an interface for all adaptors to be used with brick lazy widgets
"
Class {
	#name : #GLMBrickAbstractModel,
	#superclass : #Object,
	#category : #Glamour-Morphic-Brick-Model,
	#timestamp : 'AliakseiSyrel 12/6/2014 20:15'
}

{
	#category : #'adaptor api',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAbstractModel>>count [

	self subclassResponsibility
]

{
	#category : #'adaptor api',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAbstractModel>>morphAt: anInteger convert: aMorph [

	self subclassResponsibility
]
