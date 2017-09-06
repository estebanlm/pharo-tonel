"
A wrapper that provides a single interface to produce a new node from the matched node and a maping of wildcard variables.
"
Class {
	#name : #ReRewriteWrapper,
	#superclass : #Object,
	#category : #Renraku-Rules-Rewrite,
	#timestamp : 'YuriyTymchuk 7/6/2016 23:16'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRewriteWrapper>>rewriten: aNode with: aMap [

	^ self subclassResponsibility 
]
