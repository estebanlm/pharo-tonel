Extension {
	#name : #StringTest
}

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
StringTest>>testAsClass [
	self 
		assert: 'String' asClass
		equals: String
]

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
StringTest>>testAsClassIfAbsent [

	self 
		assert: ('String' asClassIfAbsent: [ self fail ])
		equals: String.
	
	'+' asClassIfAbsent: [ ^ self "success" ].
	self fail.
]

{
	#category : #'*ScriptingExtensions-Tests',
	#timestamp : ' 8/31/2017 05:26:45'
}
StringTest>>testAsClassIfPresent [
	
	'String' asClassIfPresent: [ :class | 
		self assert: class equals: String ].
	
	'+' asClassIfPresent: [ ^ self fail ].
]
