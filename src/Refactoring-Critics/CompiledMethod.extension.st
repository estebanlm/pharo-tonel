Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
CompiledMethod>>selfMessages [

	|  selfMessages searcher |
	selfMessages := Set new.
	searcher := RBParseTreeSearcher new.
	searcher
		matches: 'self `@message: ``@args'
			do: [:aNode :answer | selfMessages add: aNode selector].

	searcher executeTree: self parseTree initialAnswer: nil.
	
	^ selfMessages
]

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
CompiledMethod>>superMessages [

	|  superMessages searcher |
	superMessages := Set new.
	searcher := RBParseTreeSearcher new.
	searcher
		matches: 'super `@message: ``@args'
			do: [:aNode :answer | superMessages add: aNode selector].

	searcher executeTree: self parseTree initialAnswer: nil.
	
	^ superMessages
]
