"
I'm a komit object representing a change in a method.  
I wrap an MC operation (addition/removal/definition).
"
Class {
	#name : #KomitMethod,
	#superclass : #KomitObject,
	#instVars : [
		'method',
		'operation'
	],
	#classInstVars : [
		'methods'
	],
	#category : #Komitter-Models,
	#timestamp : 'StephaneDucasse 11/24/2015 19:01'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod class>>initialize [
	
	methods := Dictionary new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod class>>method: aMethod [

	^ self new
		method: aMethod;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>><= aKomitObject  [

	^ self method selector <= aKomitObject method selector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>isCommitable [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>isMethod [

	^ true
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>koDestinationText [
	^ operation koDestinationText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>koSourceText [
	
	^ self operation koSourceText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>method: anObject [
	method := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>operation [
	^ operation
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>operation: anOperation [

	operation := anOperation
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self method selector printOn: aStream.
	aStream << ' ]'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>selector [

	^ self method selector
]
