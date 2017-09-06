"

"
Class {
	#name : #MethodClassifierTest,
	#superclass : #TestCase,
	#category : #Tools-Test-Base,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
MethodClassifierTest>>testProtocolForKnownKeywordSuffixOfSelector [
	| classifier |
	classifier := MethodClassifier new.
	classifier class keywordSuffixMapping
		keysAndValuesDo: [ :suffix :protocol | 
			self
				assert: (classifier protocolForKnownKeywordSuffixOfSelector: suffix asSymbol) = protocol;
				assert: (classifier protocolForKnownKeywordSuffixOfSelector: ('more' , suffix) asSymbol) = protocol.
			(suffix endsWith: ':')
				ifTrue: [
					self
						assert: (classifier protocolForKnownKeywordSuffixOfSelector: (suffix , 'more:') asSymbol) = protocol;
						assert: (classifier protocolForKnownKeywordSuffixOfSelector: ('more' , suffix , 'more:') asSymbol) = protocol.
					self
						deny: (classifier protocolForKnownKeywordSuffixOfSelector: (suffix allButLast , 'More') asSymbol) = protocol;
						deny: (classifier protocolForKnownKeywordSuffixOfSelector: (suffix allButLast , 'More:') asSymbol) = protocol ]
				ifFalse: [
					self
						deny: (classifier protocolForKnownKeywordSuffixOfSelector: (suffix , 'More') asSymbol) = protocol;
						deny: (classifier protocolForKnownKeywordSuffixOfSelector: (suffix , 'More:') asSymbol) = protocol ] ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
MethodClassifierTest>>testProtocolForKnownPrefixOfSelector [
	| classifier |
	classifier := MethodClassifier new.
	classifier class prefixMapping
		keysAndValuesDo: [ :prefix :protocol | 
			self
				assert: (classifier protocolForKnownPrefixOfSelector: prefix asSymbol) = protocol;
				assert: (classifier protocolForKnownPrefixOfSelector: (prefix , 'More') asSymbol) = protocol;
				assert: (classifier protocolForKnownPrefixOfSelector: (prefix , ':') asSymbol) = protocol;
				assert: (classifier protocolForKnownPrefixOfSelector: (prefix , ':more:') asSymbol) = protocol.

			"it shouldn't mis-classify 'island' as 'testing' just because it starts with 'is'"
			self deny: (classifier protocolForKnownPrefixOfSelector: (prefix , 'more') asSymbol) = protocol ]
]
