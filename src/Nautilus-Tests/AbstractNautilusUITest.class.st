"
An AbstractNautilusUITest is a test class for testing the behavior of AbstractNautilusUI
"
Class {
	#name : #AbstractNautilusUITest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #Nautilus-Tests,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
AbstractNautilusUITest>>setUp [
	"Setting up code for AbstractNautilusUITest"

	model := AbstractNautilusUI new.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
AbstractNautilusUITest>>testSortClassesInCachedHierarchyB [

]
