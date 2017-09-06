Extension {
	#name : #SymbolTest
}

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
SymbolTest>>testAsClass [
	self 
		assert: #Symbol asClass
		equals: Symbol
]

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
SymbolTest>>testAsClassIfAbsent [

	self 
		assert: (#Symbol asClassIfAbsent: [ self fail ])
		equals: Symbol.
		
	#+ asClassIfAbsent: [ ^ self "success" ].
	self fail.
]

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
SymbolTest>>testAsClassIfPresent [
	
	#Symbol asClassIfPresent: [ :class | 
		self assert: class equals: Symbol ].
	
	#'+' asClassIfPresent: [ ^ self fail ].
]
