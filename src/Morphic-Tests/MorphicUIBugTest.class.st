"
A MorphicUIBugTest is a class for testing the shortcomings and repairs of the MorphicUI manager.
.

Instance Variables
	cases:		<aCollection>

cases
	- a list of morphs that may need to be deleted during teardown.
	the tests are expected to fill this list it starts out empty by default.
	
	

"
Class {
	#name : #MorphicUIBugTest,
	#superclass : #TestCase,
	#instVars : [
		'cases'
	],
	#category : #Morphic-Tests-Bugs,
	#timestamp : 'wiz 1/3/2007 13:57'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
MorphicUIBugTest>>setUp [
	"default. tests will add morphs to list. Teardown will delete."

	cases := #()
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
MorphicUIBugTest>>tearDown [
	"default. tests will add morphs to list. Teardown will delete."

	cases do: [ :each | each delete ]
]
