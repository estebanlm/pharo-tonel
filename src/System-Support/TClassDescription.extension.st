Extension {
	#name : #TClassDescription
}

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
TClassDescription>>allUnreferencedClassVariables [
	"Answer a list of the names of all the receiver's unreferenced class vars, including those defined in superclasses"

	^ self systemNavigation allUnreferencedClassVariablesOf: self
]
