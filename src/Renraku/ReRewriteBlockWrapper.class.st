"
A concrete wrapper implementation that uses a block to create new nodes
"
Class {
	#name : #ReRewriteBlockWrapper,
	#superclass : #ReRewriteWrapper,
	#instVars : [
		'block'
	],
	#category : #Renraku-Rules-Rewrite,
	#timestamp : 'YuriyTymchuk 7/6/2016 23:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteBlockWrapper class>>on: aBlock [

	^ self basicNew
		initializeBlock: aBlock;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteBlockWrapper>>initializeBlock: aBlock [
	block := aBlock
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteBlockWrapper>>rewriten: aNode with: aMap [

	^ block cull: aNode cull: aMap
]
