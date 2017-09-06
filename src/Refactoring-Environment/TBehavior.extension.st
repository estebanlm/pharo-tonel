Extension {
	#name : #TBehavior
}

{
	#category : #'*Refactoring-Environment',
	#timestamp : ' 8/31/2017 05:26:25'
}
TBehavior>>asEnvironment [
	^ RBClassEnvironment class: self
]
