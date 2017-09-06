"
A styler that highlight with green all executed statement.
For simplicity we extend from MetaLinkIconStyler
"
Class {
	#name : #CoverageRubricStyler,
	#superclass : #MetalinkIconStyler,
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 9/23/2015 10:58'
}

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageRubricStyler>>addIconStyle: aNode from: start to: stop [
	|rejectClass|
	
	rejectClass := { RBMethodNode . RBSequenceNode }.
	(rejectClass includes: aNode class) ifTrue: [ ^self ]. "do nothing" 
	aNode hasBeenExecuted ifTrue: [  super addIconStyle: aNode from: start to: stop]
]
