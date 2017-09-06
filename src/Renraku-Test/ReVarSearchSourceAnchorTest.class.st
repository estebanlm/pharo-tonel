"

"
Class {
	#name : #ReVarSearchSourceAnchorTest,
	#superclass : #TestCase,
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReVarSearchSourceAnchorTest>>testModifyFor [
	| anchor |
	anchor := ReVarSearchSourceAnchor new.
	
	self
		assert: (anchor modify: 'one' for: #(one))
		equals: '''one'''.
	
	self
		assert: (anchor modify: 'one' for: #(one two))
		equals: '''one '.
	
	self
		assert: (anchor modify: 'two' for: #(one two))
		equals: ' two'''.
	
	self
		assert: (anchor modify: 'two' for: #(one two three))
		equals: ' two '
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReVarSearchSourceAnchorTest>>testSearchString [

	| anchor |
	
	anchor := ReVarSearchSourceAnchor
		entity: Object newAnonymousSubclass
		string: 'var'.
		
	self
		assert: anchor searchString
		equals: 'var'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReVarSearchSourceAnchorTest>>testSearchString2 [

	| anchor |
	
	anchor := ReVarSearchSourceAnchor
		entity: (
			Object newAnonymousSubclass
				addClassVarNamed: 'Var';
				yourself)
		string: 'Var'.
		
	self
		assert: anchor searchString
		equals: '''Var'''
]
