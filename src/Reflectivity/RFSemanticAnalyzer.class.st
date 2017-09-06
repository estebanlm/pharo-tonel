"
I add Reflectivity link analysis to the Semantic analyzer.

I add #beforeHooks and #afterHooks anotation and make sure to visit them for semantic analysis.
"
Class {
	#name : #RFSemanticAnalyzer,
	#superclass : #OCASTSemanticAnalyzer,
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 5/24/2015 11:29'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>analyseForLinks: aNode [
	| generator |
	aNode hasMetalink
		ifFalse: [ ^ self ].
	generator := HookGenerator node: aNode.

	aNode propertyAt: #preambles put: generator preamble.
	aNode preambles do: [:each | self visitNode: each].
	
	aNode hasMetalinkBefore ifTrue: [  
		aNode propertyAt: #beforeHooks put: generator beforeHooks.
 		aNode beforeHooks do: [:each | self visitNode: each]].
	
	aNode hasMetalinkAfter ifTrue: [  
		aNode propertyAt: #afterHooks put: generator afterHooks.
		self visitNode: aNode afterHooks].
	
	aNode hasMetalinkInstead ifTrue: [  
		aNode propertyAt: #insteadHooks put: generator insteadHooks.
 		aNode insteadHooks do: [:each | self visitNode: each]].	

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>analyseForLinks: aNode generator: aGenerator [

	aNode propertyAt: #preambles put: aGenerator preamble.
	aNode preambles do: [:each | self visitNode: each].
	
	aNode hasMetalinkBefore ifTrue: [  
		aNode propertyAt: #beforeHooks put: aGenerator beforeHooks.
 		aNode beforeHooks do: [:each | self visitNode: each]].
	
	aNode hasMetalinkAfter ifTrue: [  
		aNode propertyAt: #afterHooks put: aGenerator afterHooks.
		self visitNode: aNode afterHooks].
	
	aNode hasMetalinkInstead ifTrue: [  
		aNode propertyAt: #insteadHooks put: aGenerator insteadHooks.
 		aNode insteadHooks do: [:each | self visitNode: each]].	

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>analyseForLinksForNodes: aNode [
	| generator |
	aNode hasMetalink
		ifFalse: [ ^ self ].
	generator := HookGenerator node: aNode.
	self analyseForLinks: aNode generator: generator.

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>analyseForLinksForVariables: aVariableNode [
	| variable generator |
	variable := aVariableNode binding variable.
	variable hasMetalink
		ifFalse: [ ^ self ].
	generator := HookGeneratorForVariables entity: variable node: aVariableNode.
	self analyseForLinks: variable generator: generator.


]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>analyze: aNode [
	self visitNode: aNode.
	RFASTClosureAnalyzer new visitNode: aNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitAssignmentNode: aNode [
	self visitVarWrite: aNode variable.
	super visitAssignmentNode: aNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitMethodNode: aMethodNode [
	
	scope := compilationContext scope newMethodScope. 
	aMethodNode scope: scope.  scope node: aMethodNode.
	aMethodNode arguments do: [:node | self declareArgumentNode: node ].
	aMethodNode pragmas do: [:each | self visitNode: each].
	self analyseForLinksForNodes: aMethodNode.
	self visitNode: aMethodNode body.
	scope := scope outerScope.

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitNode: aNode [
	"here we add the hook anotations and visit those AST parts for semantic analysis"
	super visitNode: aNode.
	aNode isMethod ifFalse: [self analyseForLinksForNodes: aNode]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitStoreIntoTempNode: aNode  [
	| name var |
	name := aNode name.
	var := scope lookupVarForDeclaration: name.
	var	ifNil: [ 
			var := scope addTemp: name ].
	aNode binding: var.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitStorePopIntoTempNode: aNode  [
	| name var |
	name := aNode name.
	var := scope lookupVarForDeclaration: name.
	var	ifNil: [ 
			var := scope addTemp: name ].
	aNode binding: var.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitVarWrite: aNode [
	self analyseForLinksForNodes: aNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSemanticAnalyzer>>visitVariableNode: aVariableNode [
	super visitVariableNode: aVariableNode.
	self flag: #TBD. "needs to be extendend to other kinds of variables and cleaned"
	aVariableNode isGlobal ifTrue: [  
		self analyseForLinksForVariables: aVariableNode ].
	(aVariableNode isInstance) ifTrue: [  
		self analyseForLinksForVariables: aVariableNode ]
]
