"
I am a small wrapper used to encapsulate data created and used during spec interpretation
"
Class {
	#name : #SpecWrapper,
	#superclass : #Object,
	#instVars : [
		'instance',
		'selector'
	],
	#category : #Spec-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper class>>instance: instance selector: selector [

	^ self new
		instance: instance;
		selector: selector;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>instance [
	
	^ instance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>instance: anObject [
	
	instance := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>isRedrawable [
	
	^ self instance isRedrawable
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>removeSubWidgets [
	
	^ self instance removeSubWidgets
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>selector [
	
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecWrapper>>selector: anObject [
	
	selector := anObject
]
