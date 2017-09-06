Extension {
	#name : #TClassDescription
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
TClassDescription>>criticClass [
	"Return the class of the receiver for the critic browser. This behavior may be folded later by changing the name of this method or using another one."
	
	^ self
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
TClassDescription>>criticNameOn: aStream [
	"This behavior may be folded later by changing the name of this method or using another one."
	
	aStream 
		<< self name 
		<< ' (' 
		<< self category 
		<< ')' 
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
TClassDescription>>manifestBuilderForRuleChecker: aRuleChecker [
	"Return the manifestsince the rulechecker is keeping a cache, we ask it back"

	^ aRuleChecker manifestBuilderOfClass: self
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
TClassDescription>>mcWorkingCopy [
	MCWorkingCopy managersForClass:  self do: [: package | ^ package ]
]
