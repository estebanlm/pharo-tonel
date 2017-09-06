"
self new open
"
Class {
	#name : #GLMSimpleRubricExample,
	#superclass : #GLMRubricExample,
	#category : #Glamour-Rubric-Presentations-Examples,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMSimpleRubricExample>>presentation [
	^ GLMCompositePresentation new
		with: [ :a | 
			| t seg |
			t := a text.
			t withLineNumbers: true.
			t withAnnotation: true.
			t wrapped: true.
			t tabWidth: 40.
			t withColumns: true]
]
