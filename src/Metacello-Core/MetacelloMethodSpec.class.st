"

"
Class {
	#name : #MetacelloMethodSpec,
	#superclass : #Object,
	#instVars : [
		'project',
		'selector',
		'category',
		'versionString',
		'methodSections'
	],
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>category [
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>category: anObject [
	category := anObject
]

{
	#category : #'method generation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>compileMethod [

	(project configuration class
		compile: self methodSource
		classified: self category) == nil
		ifTrue: [ self error: 'Error compiling the method' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>methodSections [

	methodSections == nil ifTrue: [ methodSections := OrderedCollection new ].
	^ methodSections
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>methodSections: anObject [
	methodSections := anObject
]

{
	#category : #'method generation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>methodSource [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>project [
	^ project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>project: anObject [
	project := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>selector: anObject [
	selector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>versionString [
	^ versionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSpec>>versionString: aStringOrSymbol [
	versionString := aStringOrSymbol
]
