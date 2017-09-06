Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>criticClass [
	"Return the class of the receiver for the critic browser. This behavior may be folded later by changing the name of this method or using another one."
	
	^ self methodClass
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>criticNameOn: aStream [
	"This behavior may be folded later by changing the name of this method or using another one."
	
	aStream 
		<< self methodClass name 
		<< '>>#' 
		<< self selector  
		<< ' (' 
		<< self methodClass theNonMetaClass category 
		<< ')'
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>criticTheNonMetaclassClass [
	"Return the class of the receiver for the critic browser. This behavior may be folded later by changing the name of this method or using another one."
	
	^ self methodClass theNonMetaClass
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>manifestBuilderForRuleChecker: aRuleChecker [
	"Return the manifestsince the rulechecker is keeping a cache, we ask it back"

	^ aRuleChecker manifestBuilderOfMethod: self
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethod>>mcWorkingCopy [
	 MCWorkingCopy managersForClass: self methodClass selector: self selector do: [ :package | ^ package ]
]
