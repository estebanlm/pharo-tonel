"
SUnit tests for RBPatternParser.
RBPatternParser needs some extra tests not covered by RBPatternTest for its extended syntax
(pattern variables and pattern blocks)
"
Class {
	#name : #RBPatternParserTest,
	#superclass : #RBParserTest,
	#category : #AST-Tests-Core,
	#timestamp : 'NicolaiHess 8/15/2016 13:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBPatternParserTest class>>parserClass [
	^ RBPatternParser
]

{
	#category : #'tests parsing',
	#timestamp : ' 8/31/2017 05:26:29'
}
RBPatternParserTest>>testParseFaultyPatternBlock [
	| node patternBlockNoArgButBar patternBlockNoArgButColon unfinishedBlock varWithUnfinishedBlock |
	"parsing pattern block should mark this block as faulty, if it is unfinished no closing brace, or missing parts (colon but no arg, 
	no arg but vertical bar)"
	patternBlockNoArgButBar := '`{ | }'.
	patternBlockNoArgButColon := '`{ : }'.
	unfinishedBlock := '`{ :  '.
	varWithUnfinishedBlock := '`sth `{ :  '.
	{patternBlockNoArgButBar . patternBlockNoArgButColon .varWithUnfinishedBlock}
		do: [ :faultyExpression | 
			node := self parseFaultyExpression: faultyExpression.
			self assert: node isBlock.
			self assert: node isFaulty]
]
