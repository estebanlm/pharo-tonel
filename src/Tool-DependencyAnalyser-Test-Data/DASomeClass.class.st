"

"
Class {
	#name : #DASomeClass,
	#superclass : #Object,
	#category : #Tool-DependencyAnalyser-Test-Data,
	#timestamp : ''
}

{
	#category : #'tests - test data',
	#timestamp : ' 8/31/2017 05:26:38'
}
DASomeClass>>method1 [
	self unimplementedMethod
]

{
	#category : #'tests - test data',
	#timestamp : ' 8/31/2017 05:26:38'
}
DASomeClass>>method2 [
	"a message send not in Kernel package"
	(1 to: 3) 
		collect: [ :i | i * 2 ] 
		as: (self class environment at: #Array) "avoid a direct reference to Array"
]
