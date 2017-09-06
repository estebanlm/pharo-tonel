Extension {
	#name : #ReleaseTest
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
ReleaseTest>>assertValidLintRule: aLintRule [
	| checker |
	checker := SmalllintManifestChecker new 
		rule: aLintRule;
		run.
	self 
		assert: aLintRule result isEmpty
		description: [ aLintRule rationale ]
]
