"
We need to analyse the #after hook: it is a block
"
Class {
	#name : #RFASTClosureAnalyzer,
	#superclass : #OCASTClosureAnalyzer,
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 9/24/2015 09:54'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFASTClosureAnalyzer>>visitNode: aNode [
	super visitNode: aNode.
	aNode hasMetalinkAfter ifTrue: [  
 		aNode afterHooks do: [:each | super visitNode: each]].
]
