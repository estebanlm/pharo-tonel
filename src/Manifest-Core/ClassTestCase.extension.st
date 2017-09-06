Extension {
	#name : #ClassTestCase
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassTestCase>>assertValidLintRule: aLintRule [
	| checker |
	checker := SmalllintManifestChecker new 
		rule: aLintRule; 
		environment: self targetClassEnvironment;
		run.
	self 
		assert: aLintRule result isEmpty
		description: [ aLintRule rationale ]
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassTestCase>>targetClassEnvironment [
	^RBClassEnvironment class: self targetClass.
]
