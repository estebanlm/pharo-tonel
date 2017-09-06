"

"
Class {
	#name : #SpecWindowTest,
	#superclass : #TestCase,
	#category : #Spec-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecWindowTest>>testIsDisplayed [

	"Test for case: 16800 -> ask a SpecWindow for #isDisplayed always returns true"
	
	| windowModel |

	windowModel := TextModel new openWithSpec.	
	self assert: (windowModel isDisplayed).
	
	windowModel window minimize.	
	self assert: (windowModel isDisplayed).
		
	windowModel window close.
	self assert: (windowModel isDisplayed not).

	
]
