Extension {
	#name : #RBMultiEnvironment
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RBMultiEnvironment>>isMultiEnvironment [
	^ true
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RBMultiEnvironment>>smallLintCritics [
	^ self asSelectorEnvironment smallLintCritics
]
