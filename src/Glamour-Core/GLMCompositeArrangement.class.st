"
This is a strategy to capture the intended arrangement of multiple presentations of a composite presentation. The subclasses define the actual arrangement.
"
Class {
	#name : #GLMCompositeArrangement,
	#superclass : #Object,
	#instVars : [
		'composite'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 1/6/2010 23:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositeArrangement class>>of: aCompositePresentation [
	^ self new composite: aCompositePresentation; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositeArrangement>>composite [
	^ composite
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositeArrangement>>composite: anObject [
	composite := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompositeArrangement>>renderGlamorouslyOn: aRenderer [
	self subclassResponsibility
]
