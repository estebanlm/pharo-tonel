Extension {
	#name : #TraitBehavior
}

{
	#category : #'*Refactoring-Environment',
	#timestamp : ' 8/31/2017 05:26:25'
}
TraitBehavior>>asEnvironment [
	^ RBClassEnvironment class: self
]
