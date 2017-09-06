"
SUnit tests for variable definitions
"
Class {
	#name : #RGVariableDefinitionTest,
	#superclass : #TestCase,
	#category : #Ring-Tests-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:10'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGVariableDefinitionTest>>testClassInstanceVariable [
	| instVar newClass metaClass |
	
	instVar:= RGClassInstanceVariableDefinition named: 'sizes'.
	
	self assert: (instVar isClassInstanceVariable).
	self assert: (instVar isVariable).
	self assert: (instVar name = 'sizes').
	self assert: (instVar parent isNil).
	self assert: (instVar isMetaSide).
	
	newClass:= RGClassDefinition named: #OrderedCollection.
	newClass withMetaclass.
	metaClass:= newClass theMetaClass.
	instVar:= metaClass addInstVarNamed: 'sizes'.
	self assert: (instVar parent = metaClass).	
	self assert: (metaClass instanceVariables size = 1).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGVariableDefinitionTest>>testClassVariable [
	| instVar newClass |
	
	instVar:= RGClassVariableDefinition named: 'DependentsFields'.
	
	self assert: (instVar isClassVariable).
	self assert: (instVar isVariable).
	self assert: (instVar name = 'DependentsFields').
	self assert: (instVar parent isNil).
	self assert: (instVar isMetaSide not).   
	
	newClass:= RGClassDefinition named: #Object.
	instVar:= (RGClassVariableDefinition named: 'DependentsFields') parent: newClass.
	
	self assert: (instVar parent = newClass).
	self assert: (newClass classVariables isEmpty).
	
	newClass classVariables add: instVar.
	self assert: (newClass classVariables size = 1).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGVariableDefinitionTest>>testInstanceVariable [
	| instVar newClass |
	
	instVar:= RGInstanceVariableDefinition named: 'size'.
	
	self assert: (instVar isInstanceVariable).
	self assert: (instVar isVariable).
	self assert: (instVar name = 'size').
	self assert: (instVar parent isNil).
	self assert: (instVar isMetaSide not).
	
	newClass:= RGClassDefinition named: #OrderedCollection.
	instVar:= newClass addInstVarNamed: 'array'.
	self assert: (instVar parent = newClass).
	self assert: (newClass instanceVariables size = 1).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGVariableDefinitionTest>>testPoolVariable [
	| poolVar newClass |
	
	poolVar:= RGPoolVariableDefinition named: 'TextConstants'.
	
	self assert: (poolVar isPoolVariable).
	self assert: (poolVar isVariable).
	self assert: (poolVar name = 'TextConstants').
	self assert: (poolVar parent isNil).
	self assert: (poolVar isMetaSide not).
	
	newClass:= RGClassDefinition named: #OrderedCollection.
	poolVar:= (RGPoolVariableDefinition named:  'TextConstants' ) parent: newClass.
	self assert: (poolVar parent = newClass).
	self assert: (newClass sharedPools isEmpty).
	
	newClass sharedPools add: poolVar.
	self assert: (newClass sharedPools size = 1).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGVariableDefinitionTest>>testVariableEquality [

	| variable1 variable2|
	
	variable1 := (OrderedCollection asRingDefinition) instanceVariableNamed: #array.
	variable2 := (OrderedCollection asRingDefinition) instanceVariableNamed: #array.
	self assert: variable1 = variable2.

	variable1 := (RGClassVariableDefinition named:  #Foo) parentName: #Test.
	variable2 := (RGClassVariableDefinition named:  #Foo) parentName: #Test.
	self assert: variable1 = variable2.
	
	variable2 := (RGClassVariableDefinition named:  #Foo) parentName: #Test2.
	self deny: variable1 = variable2.
	
]
