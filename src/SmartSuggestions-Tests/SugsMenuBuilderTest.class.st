"
SUnit tests for the Smart suggestions menu builder
"
Class {
	#name : #SugsMenuBuilderTest,
	#superclass : #TestCase,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:43'
}

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForClassItsRBVariable [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext classContext.
	self assert: (node isKindOf: RBVariableNode).
	"Es una forma un tanto molesta de preguntar... es de clase?" 
	self assert:( node binding isLiteralVariable and: [Smalltalk globals  includesAssociation: node binding assoc ]).
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForClassVarItsRBVariable [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext classVariableContext .
	self assert: (node  isKindOf: RBVariableNode).
	"Es una forma un tanto molesta de preguntar... es una var de clase?" 
	self assert:( node binding isLiteralVariable and: [(Smalltalk globals  includesAssociation: node binding assoc ) not]).
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForInstanceVariableItsRBVariable [
	| node |

	node := SugsMenuBuilder findBestNodeFor: SugsMockContext instVarContext .
	self assert: (node isKindOf: RBVariableNode).
	self assert: (node binding isInstance).
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForLiteralItsRBLiteral [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext literalContext.
	self assert: node class equals: RBLiteralValueNode .
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForMessageNodeItsRBMessageSend [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext mesageContext  .
	self assert: node class equals: RBMessageNode .
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForMethodNodeItsRBMehod [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext methodContext .
	self assert: node class equals: RBMethodNode.
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForMultilineItsRBSequence [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext sourceContext .
	self assert: node class equals: RBSequenceNode .

]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForSelfNodeItsRBSelf [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext selfContext.
	self assert: node class equals: RBSelfNode.
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForSelfNodeItsRBSuper [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext superContext.
	self assert: node class equals: RBSuperNode 
]

{
	#category : #nodes,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testFindBestNodeForTemporaryVariableItsRBVariable [
	| node |

	node :=SugsMenuBuilder findBestNodeFor:  SugsMockContext tempVarContext .
	self assert: node isTemp.
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testNoSuggestionForSelfNode [
	| suggestions expected |

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext selfContext.
	expected := SugsSuggestionFactory globalCommands .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testNoSuggestionForSuperNode [
	| suggestions expected |

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext superContext.
	expected := SugsSuggestionFactory globalCommands .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAAssigmentNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext assigmentContext.

	expected := SugsSuggestionFactory commandsForAssignment.	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAClassNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext classContext.

	expected := SugsSuggestionFactory commandsForClass.	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAClassVariableNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext classVariableContext.

	expected := SugsSuggestionFactory commandsForClassVariable .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAMehodNodeIncludesAllValid [
	| suggestions expected context |

	context := SugsMockContext methodContext.
	suggestions := SugsMenuBuilder findSuggestionsFor: context.
	expected := (SugsSuggestionFactory commandsForMethod do: [:aSugg | aSugg context: context] )select: #isValidForContext.
	self assert: (expected allSatisfy: [ :expect | suggestions includes: expect ])
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAMessageNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext mesageContext.

	expected := SugsSuggestionFactory commandsForMessage .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForATemporaryVariableNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext tempVarContext.

	expected := SugsSuggestionFactory commandsForTemporaryVariable .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForAnInstanceVariableNodeIncludesAllDeclared [
	| suggestions expected|

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext instVarContext.

	expected := SugsSuggestionFactory commandsForInstanceVariable .	
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForLiteralNodeIncludesAllExpected [
	| suggestions expected |

	suggestions :=SugsMenuBuilder findSuggestionsFor: SugsMockContext literalContext.
	expected := SugsSuggestionFactory commandsFoLiteralNode .
	self assert:(expected allSatisfy:[:expect | suggestions includes: expect]).
]

{
	#category : #suggstions-by-selection,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMenuBuilderTest>>testSuggestionForSourceNodeIncludesAllValid [
	| suggestions expected context |
	context := SugsMockContext sourceContext.
	suggestions :=SugsMenuBuilder findSuggestionsFor: context.
	expected := (SugsSuggestionFactory commandsForSource do: [:aSugg | aSugg context: context] )select: #isValidForContext.
		
	self assert: (expected allSatisfy:[:expect | suggestions includes: expect]).
]
