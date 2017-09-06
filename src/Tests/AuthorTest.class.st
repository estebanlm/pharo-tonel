"

"
Class {
	#name : #AuthorTest,
	#superclass : #TestCase,
	#instVars : [
		'author'
	],
	#category : #Tests-System,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
AuthorTest>>testUniqueness [
	self should: [ Author new ] raise: Error.
]
