"
A concrete wrapper implementation that uses a rewrite expression to create a new node
"
Class {
	#name : #ReRewriteTreeWrapper,
	#superclass : #ReRewriteWrapper,
	#instVars : [
		'tree'
	],
	#category : #Renraku-Rules-Rewrite,
	#timestamp : 'YuriyTymchuk 7/6/2016 23:20'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteTreeWrapper class>>on: aTree [

	^ self basicNew
		initializeTree: aTree;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteTreeWrapper>>initializeTree: aTree [
	tree := aTree
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteTreeWrapper>>rewriten: aNode with: aMap [

	^ tree copyInContext: aMap
]
