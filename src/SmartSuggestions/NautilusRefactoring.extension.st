Extension {
	#name : #NautilusRefactoring
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
NautilusRefactoring>>accessorsClassVarNamed: aVariableName from: aClass [
	self performRefactoringFor: #privateAccessorsClassVarNamed:from: with: aVariableName with: aClass
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
NautilusRefactoring>>accessorsInstVarNamed: aVariableName from: aClass [
	self performRefactoringFor: #privateAccessorsInstVarNamed:from: with: aVariableName with: aClass

]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
NautilusRefactoring>>privateAccessorsClassVarNamed: aVariableName from:  aClass. [
	^ RBCreateAccessorsForVariableRefactoring 
			model: environment
			variable: aVariableName
			class: aClass
			classVariable: true
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
NautilusRefactoring>>privateAccessorsInstVarNamed: aVariableName from:  aClass. [
	^ RBCreateAccessorsForVariableRefactoring 
			model: environment
			variable: aVariableName
			class: aClass
			classVariable: false
]
