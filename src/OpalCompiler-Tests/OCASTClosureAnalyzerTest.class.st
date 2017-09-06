"

"
Class {
	#name : #OCASTClosureAnalyzerTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-AST,
	#timestamp : ''
}

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testBlockArgumentIsArgumentVariable [
	| ast blockNode |
	ast := (OCOpalExamples>>#exampleForBlockArgument) parseTree.
	ast doSemanticAnalysis.
	blockNode := ast body statements first value.
	self assert: blockNode arguments notEmpty.
	self assert: blockNode arguments first isArgument
	
]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testDoubleRemoteAnidatedBlocks [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#doubleRemoteAnidatedBlocks) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 2.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: (ast scope lookupVar: 'last') isRemote.
	self assert: (ast scope lookupVar: 'val') isRemote.
	self assert: (ast scope lookupVar: 'val') vectorName = '0vector0'.
	self deny: (scopes second  lookupVar: 'i') isRemote. 
	

	
	



]

{
	#category : #'tests - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleBlockArgument [
	| ast assignment vars blockScope blockScope2 |
	ast := (OCOpalExamples>>#exampleBlockArgument) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 3.
	self assert: ast scope tempVector size = 0.
	self assert: ast scope copiedVars size = 0.
	
	self deny: (ast scope lookupVar: 'block') isRemote. 
	self deny: (ast scope lookupVar: 'block1') isRemote. 
	self deny: (ast scope lookupVar: 'block2') isRemote. 
	
	blockScope := (OCScopesCollector new visitNode: ast) scopes second.
	
	self assert: blockScope tempVars size = 2.
	self assert: blockScope tempVector size = 0.
	self assert: blockScope copiedVars size = 1.
	self deny: (blockScope lookupVar: 'temp') isRemote.
	self assert: (blockScope lookupVar: 'temp') isEscapingRead.
	self assert: (blockScope lookupVar: 'temp') isWrite.
	self deny: (blockScope lookupVar: 'temp') isEscapingWrite.
	self deny: (blockScope lookupVar: 'arg') isRemote.
	
	
	blockScope2 := (OCScopesCollector new visitNode: ast) scopes third.
	self assert: blockScope2 tempVars size = 0.
	self assert: blockScope2 tempVector size = 0.
	self assert: blockScope2 copiedVars size = 1.
	
	
	
	



]

{
	#category : #'tests - optimized blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleSimpleBlockLocalIf [
	| ast  assignment var |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocalIf) parseTree.
	ast doSemanticAnalysis.

	assignment := RBParseTreeSearcher treeMatching: '`var := ``@anything' in: ast. 	
	var := assignment variable binding.
	self assert: var isWrite.
	self deny: var isEscaping.
]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleSimpleBlockLocalWhile [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocalWhile) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: (ast scope lookupVar: 'a') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes second tempVars size = 1.
	self assert: scopes second tempVector size = 0.
	self deny: (scopes second lookupVar: 'b') isRemote.
	self assert: (scopes second lookupVar: 'b') isArg.
	self deny: (scopes fourth lookupVar: 'hallo') isRemote.
	


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleSimpleBlockNested [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#exampleSimpleBlockNested) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 2.
	self assert: ast scope tempVector size = 1.
	self deny: (ast scope lookupVar: 'a') isRemote.
	self deny: (ast scope lookupVar: 'dict') isRemote.
	self assert: (ast scope lookupVar: 'match') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes second tempVars size = 2.
	self assert: scopes second tempVector size = 0.
	self deny: (scopes second lookupVar: 'each') isRemote.
	self deny: (scopes second lookupVar: 'index') isRemote.
	
	self assert: scopes second copiedVars size = 3


	

	
	



]

{
	#category : #'tests - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleWhileModificationBefore [
	| ast assignment vars blockScope blockScope2 |
	ast := (OCOpalExamples>>#exampleWhileModificationBefore) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: ast scope copiedVars size = 1.
	
	self assert: (ast scope lookupVar: 'index') isRemote. 
	

	



]

{
	#category : #'tests - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testExampleWhileNoModification [
"A block in an optimized loop with no modification on temp vars in the loop
only needs to copy the tempvars. No write -> no indirection vector."
	| ast |
	ast := (OCOpalExamples>>#exampleWhileNoModification) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 3.
	self assert: ast scope tempVector size = 0.
	self assert: ast scope copiedVars size = 3.
	self deny: (ast scope lookupVar: 'a') isRemote. 
	self deny: (ast scope lookupVar: 'b') isRemote. 
	self deny: (ast scope lookupVar: 'c') isRemote. 
	

	



]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testInlinedBlockArgumentIsArgumentVariable [
	| ast blockNode |
	ast := (OCOpalExamples>>#exampleForInlinedBlockArgument) parseTree.
	ast doSemanticAnalysis.
	blockNode := ast body statements first arguments first.
	self assert: blockNode arguments notEmpty.
	self assert: blockNode arguments first isArgument
	
]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testMethodArgumentIsArgumentVariable [
	| ast |
	ast := (OCOpalExamples>>#exampleWithArgument:) parseTree.
	ast doSemanticAnalysis .
	self assert: ast arguments notEmpty.
	self assert: ast arguments first isArgument
	
]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNestedBlocksRemoteInBlockCase1 [
	| ast scopes |
	ast := (OCOpalExamples>>#nestedBlocksRemoteInBlockCase1) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	self deny: (ast scope lookupVar: 'block') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes second tempVars size = 0.
	self assert: scopes second tempVector size = 2.
	self assert: (scopes second tempVector at: 'a') isRemote.
	self assert: (scopes second tempVector at: 'b') isRemote.


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNestedBlocksRemoteInBlockCase2 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#nestedBlocksRemoteInBlockCase2) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	self deny: (ast scope lookupVar: 'block') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes second tempVars size = 0.
	self assert: scopes second tempVector size = 0.
	
	self assert: scopes third tempVars size = 0.
	self assert: scopes third tempVector size = 1.
	self assert: (scopes third tempVector at: 'a') isRemote.
	
	self assert: scopes fourth tempVars size = 0.
	self assert: scopes fourth tempVector size = 0.
	
	self assert: scopes fifth tempVars size = 0.
	self assert: scopes fifth tempVector size = 1.
	self assert: (scopes fifth tempVector at: 'b') isRemote.


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNestedBlocksRemoteInBlockCase3 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#nestedBlocksRemoteInBlockCase3) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: (ast scope lookupVar: 'block') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes second tempVars size = 0.
	self assert: scopes second tempVector size = 0.
	
	self assert: scopes third tempVars size = 0.
	self assert: scopes third tempVector size = 1.
	self assert: (scopes third tempVector at: 'a') isRemote.
	
	self assert: scopes fourth tempVars size = 0.
	self assert: scopes fourth tempVector size = 0.
	
	self assert: scopes fifth tempVars size = 0.
	self assert: scopes fifth tempVector size = 1.
	self assert: (scopes fifth tempVector at: 'b') isRemote.


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNoRemoteBlockArgument [
	| ast assignment vars |
	ast := (OCOpalExamples>>#noRemoteBlockArgument) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 3.
	
	self deny: (ast scope lookupVar: 'block') isRemote .
	self deny: (ast scope lookupVar: 'block1') isRemote.
	self deny: (ast scope lookupVar: 'block2') isRemote.



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNoRemoteReadInBlock [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#noRemoteReadInBlock) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	
	self deny: (ast scope lookupVar: 'a') isRemote.

	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testNoRemoteReadNestedBlocks [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#noRemoteReadNestedBlocks) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 0.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	self assert: scopes second tempVars size = 1.
	self assert: scopes second tempVector size = 0.
	self deny: (scopes second lookupVar: 'a') isRemote.

	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockReadInBlock [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockReadInBlock) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	self deny: (ast scope lookupVar: 't1') isRemote.
	


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWriteInBlock [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWriteInBlock) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	self deny: (ast scope lookupVar: 't1') isRemote.
	


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWriteInNestedBlock [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWriteInNestedBlock) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: (ast scope lookupVar: 't1') isRemote.
	


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWriteInNestedBlockCase2 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWriteInNestedBlockCase2) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	self deny: (ast scope lookupVar: 't1') isRemote.
	self assert: ast scope copiedVars size = 0.
	


	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWriteInNestedBlockCase3 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWriteInNestedBlockCase3) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: (ast scope lookupVar: 't1') isRemote.
	self assert: ast scope copiedVars size = 1. "Is this correct, I think that the copied vars should be empty."
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	self assert: scopes second tempVars size = 0.
	self assert: scopes second tempVector size = 0.
	self assert: scopes second copiedVars size = 1.
	scopes second copiedVars at: '0vector0' ifAbsent: [self fail].
	self assert: ((scopes second copiedVars at: '0vector0') isStoringTempVector).	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWriteInNestedBlockCase4 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWriteInNestedBlockCase4) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	self assert: (ast scope lookupVar: 't1') isRemote.
	self assert: ast scope copiedVars size = 1. "Is this correct, I think that the copied vars should be empty."
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	self assert: scopes second tempVars size = 0.
	self assert: scopes second tempVector size = 0.
	self assert: scopes second copiedVars size = 1.
	scopes second copiedVars at: '0vector0' ifAbsent: [self fail]
	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWrittenAfterClosedOverCase1 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWrittenAfterClosedOverCase1) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 0.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	
	self assert: scopes third  tempVars size = 0.
	self assert: scopes third  tempVector size = 1.
	
	self deny: (scopes third lookupVar: 'index') isRemote.
		"problem: as block is optimized, this var does not need to be remote"
	self assert: (scopes third tempVector at: 'temp') isRemote.

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testOptimizedBlockWrittenAfterClosedOverCase2 [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#optimizedBlockWrittenAfterClosedOverCase2) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size =0.
	self deny: (ast scope lookupVar: 'index') isRemote.
	
	scopes := (OCScopesCollector new visitNode: ast) scopes.
	self assert: (scopes third tempVector at: 'temp') isRemote.

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testSingleRemoteDifferentBlocksSameArgumentName [
	| ast assignment vars |
	ast := (OCOpalExamples>>#singleRemoteDifferentBlocksSameArgumentName) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 2.
	self assert: ast scope tempVector size = 1.
	
	self deny: (ast scope lookupVar: 'b') isRemote.
	self deny: (ast scope lookupVar: 'c') isRemote.
	self assert: (ast scope lookupVar: 'z') isRemote.

]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testSingleRemoteMethodArgument [
	| ast assignment vars |
	ast := (OCOpalExamples>>#singleRemoteMethodArgument) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 1.
	
	self deny: (ast scope lookupVar: 'block') isRemote.
	self assert: (ast scope lookupVar: 'temp') isRemote.


]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testSingleRemoteReadNestedBlocks [
	| ast assignment vars |
	ast := (OCOpalExamples>>#singleRemoteReadNestedBlocks) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	
	self assert: (ast scope lookupVar: 'a') isRemote.


]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testSingleRemoteTempVar [
	| ast |
	ast := (OCOpalExamples>>#singleRemoteTempVar) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 2.
	self assert: ast scope tempVector size = 1.
	
	self assert: (ast scope lookupVar: 'index') isRemote.
	self assert: (ast scope lookupVar: 'index') definingScope = ast scope.
	self deny: (ast scope lookupVar: 'block') isRemote.
	self deny: (ast scope lookupVar: 'collection') isRemote.



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testWrittenAfterClosedOver [
	| ast assignment vars scopes |
	ast := (OCOpalExamples>>#writtenAfterClosedOver) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 0.
	self assert: ast scope tempVector size = 1.
	
	self assert: (ast scope lookupVar: 'a') isRemote.

	

	
	



]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testsingleRemoteTempVarWhileWithTempNotInlined [
	| ast |
	ast := (OCOpalExamples>>#exampleWhileWithTempNotInlined) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 1.
	
	self assert: (ast scope lookupVar: 'index') isRemote.
	self assert: (ast scope lookupVar: 'index') definingScope = ast scope.
	self deny: (ast scope lookupVar: 'block') isRemote.




]

{
	#category : #'tests - special cases',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTClosureAnalyzerTest>>testsingleRemoteTempVarWrittenAfterClosedOver [
	| ast |
	ast := (OCOpalExamples>>#singleRemoteTempVarWrittenAfterClosedOver) parseTree.
	ast doSemanticAnalysis.
	self assert: ast scope isMethodScope.
	self assert: ast scope tempVars size = 1.
	self assert: ast scope tempVector size = 1.
	
	self assert: (ast scope lookupVar: 'index') isRemote.
	self assert: (ast scope lookupVar: 'index') definingScope = ast scope.
	self deny: (ast scope lookupVar: 'block') isRemote.


]
