"
I am a specialized variable node for global  variables, class variables and pool variables. These variables are class names
(#Object -> Object) pointing to objects 
or other names pointing to objects that are accessible from e,g. the global scope
(Processor  -> ""ProcessorScheduler"").

The parser does not know about this type of variables until you call doSemanticAnalysis:

(RBParser parseMethod:'foo Object new') body statements first receiver class. ""RBVariableNode""
(RBParser parseMethod:'foo Object new') doSemanticAnalysis body statements first receiver class.  ""RBGlobalNode""
"
Class {
	#name : #RBGlobalNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : 'MarcusDenker 11/30/2016 14:25'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBGlobalNode>>acceptVisitor: aProgramNodeVisitor  [
	^ aProgramNodeVisitor visitGlobalNode: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBGlobalNode>>isGlobal [
	^true
]
